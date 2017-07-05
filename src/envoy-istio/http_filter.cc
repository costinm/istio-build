/* Copyright 2017 Istio Authors. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <google/protobuf/stubs/status.h>
#include <common/common/logger.h>
#include <envoy/grpc/rpc_channel.h>
#include <common/grpc/rpc_channel_impl.h>
#include "common/common/base64.h"
#include "common/http/headers.h"
#include "common/http/utility.h"
#include "envoy/server/instance.h"
#include "envoy/ssl/connection.h"
#include "server/config/network/http_connection_manager.h"
#include "config.h"
#include "utils.h"
#include "src/envoy/mixer/http_control.h"

using ::google::protobuf::util::Status;
using StatusCode = ::google::protobuf::util::error::Code;

namespace Envoy {
namespace Http {
namespace IstioMixer {
namespace {

// Switch to turn off attribute forwarding
const std::string kJsonNameForwardSwitch("mixer_forward");

// Switch to turn off mixer check/report/quota
const std::string kJsonNameMixerSwitch("mixer_control");

    // Define attribute names
    const std::string kOriginUser = "origin.user";

    const std::string kRequestHeaders = "request.headers";
    const std::string kRequestHost = "request.host";
    const std::string kRequestMethod = "request.method";
    const std::string kRequestPath = "request.path";
    const std::string kRequestReferer = "request.referer";
    const std::string kRequestScheme = "request.scheme";
    const std::string kRequestSize = "request.size";
    const std::string kRequestTime = "request.time";
    const std::string kRequestUserAgent = "request.useragent";

    const std::string kResponseCode = "response.code";
    const std::string kResponseDuration = "response.duration";
    const std::string kResponseHeaders = "response.headers";
    const std::string kResponseSize = "response.size";
    const std::string kResponseTime = "response.time";

// Keys to well-known headers
    const LowerCaseString kRefererHeaderKey("referer");

    // Convert Status::code to HTTP code
int HttpCode(int code) {
  // Map Canonical codes to HTTP status codes. This is based on the mapping
  // defined by the protobuf http error space.
  switch (code) {
    case StatusCode::OK:
      return 200;
    case StatusCode::CANCELLED:
      return 499;
    case StatusCode::UNKNOWN:
      return 500;
    case StatusCode::INVALID_ARGUMENT:
      return 400;
    case StatusCode::DEADLINE_EXCEEDED:
      return 504;
    case StatusCode::NOT_FOUND:
      return 404;
    case StatusCode::ALREADY_EXISTS:
      return 409;
    case StatusCode::PERMISSION_DENIED:
      return 403;
    case StatusCode::RESOURCE_EXHAUSTED:
      return 429;
    case StatusCode::FAILED_PRECONDITION:
      return 400;
    case StatusCode::ABORTED:
      return 409;
    case StatusCode::OUT_OF_RANGE:
      return 400;
    case StatusCode::UNIMPLEMENTED:
      return 501;
    case StatusCode::INTERNAL:
      return 500;
    case StatusCode::UNAVAILABLE:
      return 503;
    case StatusCode::DATA_LOSS:
      return 500;
    case StatusCode::UNAUTHENTICATED:
      return 401;
    default:
      return 500;
  }
}

}  // namespace

    // Created at startup, from initialize().
class Config : public Logger::Loggable<Logger::Id::http> {

 public:
    std::string forward_attributes_;
    MixerConfig mixer_config_;
    Upstream::ClusterManager& cm_;
    Server::Instance& server_;

  Config(const Json::Object& config, Server::Instance& server)
      : cm_(server.clusterManager()), server_(server) {
    mixer_config_.Load(config);
    if (mixer_config_.mixer_server.empty()) {
      log().error(
          "mixer_server is required but not specified in the config: {}",
          __func__);
    } else {
      log().debug("Called Mixer::Config constructor with mixer_server: ",
                  mixer_config_.mixer_server);
      // ThreadLocalCluster*
      server.clusterManager().get(mixer_config_.mixer_server);
    }

    if (!mixer_config_.forward_attributes.empty()) {
      std::string serialized_str =
          IstioMixer::SerializeStringMap(mixer_config_.forward_attributes);
      forward_attributes_ =
          Base64::encode(serialized_str.c_str(), serialized_str.size());
      log().debug("Mixer forward attributes set: ", serialized_str);
    }


  }

  const std::string& forward_attributes() const { return forward_attributes_; }
};

typedef std::shared_ptr<Config> ConfigPtr;
    const std::chrono::milliseconds kGrpcRequestTimeoutMs(5000);

class Instance : public Http::StreamDecoderFilter,
                 public Http::AccessLog::Instance,
                 public Grpc::RpcChannelCallbacks,
                 public std::enable_shared_from_this<Instance> {
 private:
  //std::shared_ptr<HttpControl> http_control_;
  ConfigPtr config_;

  enum State { NotStarted, Calling, Complete, Responded };
  State state_;

  StreamDecoderFilterCallbacks* decoder_callbacks_;

  bool initiating_call_;
  int check_status_code_;

  bool mixer_disabled_;

  // mixer control switch (off by default)
  bool mixer_disabled() {
    auto route = decoder_callbacks_->route();
    if (route != nullptr) {
      auto entry = route->routeEntry();
      if (entry != nullptr) {
        auto key = entry->opaqueConfig().find(kJsonNameMixerSwitch);
        if (key != entry->opaqueConfig().end() && key->second == "on") {
          return false;
        }
      }
    }
    return true;
  }

  // attribute forward switch (on by default)
  bool forward_disabled() {
    auto route = decoder_callbacks_->route();
    if (route != nullptr) {
      auto entry = route->routeEntry();
      if (entry != nullptr) {
        auto key = entry->opaqueConfig().find(kJsonNameForwardSwitch);
        if (key != entry->opaqueConfig().end() && key->second == "off") {
          return true;
        }
      }
    }
    return false;
  }

 public:
    Grpc::RpcChannelPtr rpcChannel;
    ::istio::mixer::v1::Mixer_Stub *stub_;
    ::istio::mixer::v1::CheckResponse* response;

    // One per thread
  Instance(ConfigPtr config)
      : //http_control_(config->http_control()),
        config_(config),
        state_(NotStarted),
        initiating_call_(false),
        check_status_code_(HttpCode(StatusCode::UNKNOWN)) {
    Log().info("Called Mixer::Instance : {}", __func__);

    // See grpc_transport.cc
    rpcChannel = Grpc::RpcChannelPtr{new Grpc::RpcChannelImpl{
            config_.get()->server_.clusterManager(),
            config.get()->mixer_config_.mixer_server,
            *this,
            Optional<std::chrono::milliseconds>(kGrpcRequestTimeoutMs)}};

      stub_ = new ::istio::mixer::v1::Mixer_Stub(rpcChannel.get());
  }

    // GRPC callbacks
    void onPreRequestCustomizeHeaders(Http::HeaderMap& headers) override {}

    void onSuccess() override {checkDone(response);};

    void onFailure(const Optional<uint64_t>& grpc_status,
                   const std::string& message) override {
      state_ = Responded;
      if (grpc_status.valid()) {
        check_status_code_ = HttpCode(grpc_status.value());
      } else {
        check_status_code_ = HttpCode(500);
      }

      printf("Hi");
      Utility::sendLocalReply(*decoder_callbacks_, Code(check_status_code_),
                                message);

      };

    // END GRPC callbacks

  // Returns a shared pointer of this object.
  std::shared_ptr<Instance> GetPtr() { return shared_from_this(); }

  FilterHeadersStatus decodeHeaders(HeaderMap& headers,
                                    bool end_stream) override {
    Log().debug("Called Mixer::Instance : {}", __func__);

    if (!config_->forward_attributes().empty() && !forward_disabled()) {
      headers.addStatic(IstioMixer::kIstioAttributeHeader,
                        config_->forward_attributes());
    }

    mixer_disabled_ = mixer_disabled();
    if (mixer_disabled_) {
      return FilterHeadersStatus::Continue;
    }

    state_ = Calling;
    initiating_call_ = true;

    std::string origin_user;
    Ssl::Connection* ssl =
        const_cast<Ssl::Connection*>(decoder_callbacks_->ssl());
    if (ssl != nullptr) {
      origin_user = ssl->uriSanPeerCertificate();
    }

    auto instance = GetPtr();
    ::istio::mixer::v1::CheckRequest request;

    stub_->Check(nullptr, &request, response, nullptr);

    /*
      FillCheckAttributes(headers, &request_data->attributes);
      SetStringAttribute(kOriginUser, origin_user, &request_data->attributes);
      http_control_->Check(
        request_data_, headers, origin_user,
        [instance](const Status& status) { instance->completeCheck(status); });

     */

    // TODO(costin): we may still have a race condition - if RPC finishes and calls completeCheck, before
    // initiating_call is set to false.
    initiating_call_ = false;

    if (state_ == Complete) {
      // RPC finished before the method returned.
      return FilterHeadersStatus::Continue;
    }
    Log().debug("Called Mixer::Instance : {} Stop", __func__);
    return FilterHeadersStatus::StopIteration;
  }

  FilterDataStatus decodeData(Buffer::Instance& data,
                              bool end_stream) override {
    if (mixer_disabled_) {
      return FilterDataStatus::Continue;
    }

    Log().debug("Called Mixer::Instance : {} ({}, {})", __func__, data.length(),
                end_stream);
    if (state_ == Calling) {
      return FilterDataStatus::StopIterationAndBuffer;
    }
    return FilterDataStatus::Continue;
  }

    void checkDone(const ::istio::mixer::v1::CheckResponse* status) {
      Log().debug("Called Mixer::Instance : check complete {}",
                  status->DebugString());
      // This stream has been reset, abort the callback.
      if (state_ == Responded) {
        return;
      }
//      if (!status.ok() && state_ != Responded) {
//        state_ = Responded;
//        check_status_code_ = HttpCode(status.error_code());
//        Utility::sendLocalReply(*decoder_callbacks_, Code(check_status_code_),
//                                status.ToString());
//        return;
//      }

      state_ = Complete;
      if (!initiating_call_) {
        decoder_callbacks_->continueDecoding();
      }
    }


    FilterTrailersStatus decodeTrailers(HeaderMap& trailers) override {
    if (mixer_disabled_) {
      return FilterTrailersStatus::Continue;
    }

    Log().debug("Called Mixer::Instance : {}", __func__);
    if (state_ == Calling) {
      return FilterTrailersStatus::StopIteration;
    }
    return FilterTrailersStatus::Continue;
  }

  void setDecoderFilterCallbacks(
      StreamDecoderFilterCallbacks& callbacks) override {
    Log().debug("Called Mixer::Instance : {}", __func__);
    decoder_callbacks_ = &callbacks;
    // costin: GrpcTransport::SetDispatcher(decoder_callbacks_->dispatcher());
  }

  void completeCheck(const Status& status) {
    Log().debug("Called Mixer::Instance : check complete {}",
                status.ToString());
    // This stream has been reset, abort the callback.
    if (state_ == Responded) {
      return;
    }
    if (!status.ok() && state_ != Responded) {
      state_ = Responded;
      check_status_code_ = HttpCode(status.error_code());
      Utility::sendLocalReply(*decoder_callbacks_, Code(check_status_code_),
                              status.ToString());
      return;
    }

    state_ = Complete;
    if (!initiating_call_) {
      decoder_callbacks_->continueDecoding();
    }
  }

  void onDestroy() override { state_ = Responded; }

  virtual void log(const HeaderMap* request_headers,
                   const HeaderMap* response_headers,
                   const AccessLog::RequestInfo& request_info) override {
    Log().debug("Called Mixer::Instance : {}", __func__);
    // If decodeHaeders() is not called, not to call Mixer report.
    // Make sure not to use any class members at the callback.
    // The class may be gone when it is called.
    // Log() is a static function so it is OK.

      // TODO(costin): response_headers, request_headers copy

/*
  if (info.bytesReceived() >= 0) {
    attr->attributes[kRequestSize] =
        Attributes::Int64Value(info.bytesReceived());
  }
  if (info.bytesSent() >= 0) {
    attr->attributes[kResponseSize] = Attributes::Int64Value(info.bytesSent());
  }

  attr->attributes[kResponseDuration] = Attributes::DurationValue(
      std::chrono::duration_cast<std::chrono::nanoseconds>(info.duration()));

  if (info.responseCode().valid()) {
    attr->attributes[kResponseCode] =
        Attributes::Int64Value(info.responseCode().value());
  } else {
    attr->attributes[kResponseCode] = Attributes::Int64Value(check_status_code);
  }

   if (response_headers) {
    attr->attributes[kResponseHeaders] =
        Attributes::StringMapValue(ExtractHeaders(*response_headers));

 std::map<std::string, std::string> headers;
  header_map.iterate(
      [](const HeaderEntry& header, void* context) {
        std::map<std::string, std::string>* header_map =
            static_cast<std::map<std::string, std::string>*>(context);
        (*header_map)[header.key().c_str()] = header.value().c_str();
      },
      &headers);

   }
  attr->attributes[kResponseTime] =
              Attributes::TimeValue(std::chrono::system_clock::now());

      http_control_->Report(request_data_, response_headers, request_info,
                          check_status_code_, [](const Status& status) {
                            Log().debug("Report returns status: {}",
                                        status.ToString());
                          });
 */

  }

  static spdlog::logger& Log() {
    static spdlog::logger& instance =
        Logger::Registry::getLog(Logger::Id::http);
    return instance;
  }
};

}  // namespace Mixer
}  // namespace Http

namespace Server {
namespace Configuration {

class IstioMixerConfig : public NamedHttpFilterConfigFactory {
 public:
    HttpFilterFactoryCb createFilterFactory(HttpFilterType type, const Json::Object& config,
                                            const std::string& stats, Server::Instance& server) override {

      if (type != HttpFilterType::Decoder) {
        throw EnvoyException(
                fmt::format("{} http filter must be configured as a decoder filter.", name()));
      }

    Http::IstioMixer::ConfigPtr mixer_config(
        new Http::IstioMixer::Config(config, server));
    return
        [mixer_config](Http::FilterChainFactoryCallbacks& callbacks) -> void {
          std::shared_ptr<Http::IstioMixer::Instance> instance =
              std::make_shared<Http::IstioMixer::Instance>(mixer_config);
          callbacks.addStreamDecoderFilter(
              Http::StreamDecoderFilterSharedPtr(instance));
          callbacks.addAccessLogHandler(
              Http::AccessLog::InstanceSharedPtr(instance));
        };
  }

    std::string name() {
      return "istiomixer";
    };

};

static RegisterNamedHttpFilterConfigFactory<IstioMixerConfig> register_;

}  // namespace Configuration
}  // namespace Server
}  // namespace Envoy
