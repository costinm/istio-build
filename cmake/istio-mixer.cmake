
set(ISTIOPROXY_SOURCES
        ${ISTIO_NATIVE}/mixerclient/src/attribute_compressor.cc
        ${ISTIO_NATIVE}/mixerclient/src/check_cache.cc
        ${ISTIO_NATIVE}/mixerclient/src/referenced.cc
        ${ISTIO_NATIVE}/mixerclient/src/client_impl.cc
        ${ISTIO_NATIVE}/mixerclient/src/delta_update.cc
        ${ISTIO_NATIVE}/mixerclient/src/quota_cache.cc
        ${ISTIO_NATIVE}/mixerclient/utils/md5.cc
        ${ISTIO_NATIVE}/mixerclient/utils/protobuf.cc
        ${ISTIO_NATIVE}/mixerclient/src/report_batch.cc
        ${ISTIO_NATIVE}/mixerclient/prefetch/quota_prefetch.cc
        ${ISTIO_NATIVE}/mixerclient/prefetch/time_based_counter.cc

        ${ISTIO_NATIVE}/proxy/src/envoy/mixer/http_filter.cc
        ${ISTIO_NATIVE}/proxy/src/envoy/mixer/utils.cc
        ${ISTIO_NATIVE}/proxy/src/envoy/mixer/tcp_filter.cc
        ${ISTIO_NATIVE}/proxy/src/envoy/mixer/mixer_control.cc
        ${ISTIO_NATIVE}/proxy/src/envoy/mixer/config.cc
        ${ISTIO_NATIVE}/proxy/src/envoy/mixer/grpc_transport.cc

        ${ISTIO_GENFILES}/external/gogoproto_git/gogoproto/gogo.pb.cc

        ${ISTIO_GENFILES}/external/mixerapi_git/mixer/v1/attributes.pb.cc
        ${ISTIO_GENFILES}/external/mixerapi_git/mixer/v1/check.pb.cc
        ${ISTIO_GENFILES}/external/mixerapi_git/mixer/v1/report.pb.cc
        ${ISTIO_GENFILES}/external/mixerapi_git/mixer/v1/service.pb.cc
        ${ISTIO_GENFILES}/external/googleapis_git/google/rpc/status.pb.cc
        #${ISTIO_GENFILES}/src/envoy/mixer/string_map.pb.cc
        ${ISTIO_GENFILES}/external/mixerclient_git/src/global_dictionary.cc
        )


# Must be linked in, so OBJECT. 'static' will not be loaded since there
# are no references.
add_library(istioproxy OBJECT ${ISTIOPROXY_SOURCES})

target_include_directories(istioproxy PRIVATE
        ${ISTIO_NATIVE}/mixerclient

        ${ISTIO_NATIVE}/fmt
        ${ISTIO_NATIVE}/xxhash
        ${ISTIO_NATIVE}/api
        ${ISTIO_NATIVE}/envoy/include
        ${ISTIO_NATIVE}/proxy
        ${ISTIO_GENFILES}/external/mixerapi_git
        ${ISTIO_GENFILES}/external/googleapis_git
        ${ISTIO_GENFILES}/external/gogoproto_git
        ${ISTIO_GENFILES}
        ${ISTIO_NATIVE}/boringssl/src/include
        ${ISTIO_NATIVE}/envoy/source
        ${ISTIO_NATIVE}/spdlog/include
        ${ISTIO_GENFILES}/external/envoy_api
        ${ISTIO_NATIVE}/lightstep/src/c++11
        ${ISTIO_NATIVE}/protobuf/src

        )
