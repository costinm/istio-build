include_directories(
        src/mixer
        src/proxy
        third_party/api
)

set(ISTIOPROXY_SOURCES
        src/mixerclient/src/attribute.cc
        src/mixerclient/src/check_cache.cc
        src/mixerclient/src/referenced.cc
        src/mixerclient/src/client_impl.cc
        src/mixerclient/src/delta_update.cc
        src/mixerclient/src/quota_cache.cc
        src/mixerclient/utils/md5.cc
        src/mixerclient/utils/protobuf.cc
        src/mixerclient/src/report_batch.cc
        src/mixerclient/src/attribute_converter.cc
        go/src/istio.io/proxy/src/envoy/mixer/http_filter.cc
        go/src/istio.io/proxy/src/envoy/mixer/utils.cc
        go/src/istio.io/proxy/src/envoy/mixer/tcp_filter.cc
        go/src/istio.io/proxy/src/envoy/mixer/mixer_control.cc
        go/src/istio.io/proxy/src/envoy/mixer/config.cc
        go/src/istio.io/proxy/src/envoy/mixer/grpc_transport.cc
        src/mixerclient/prefetch/quota_prefetch.cc
        src/mixerclient/prefetch/time_based_counter.cc

        genfiles/mixer/v1/attributes.pb.cc
        genfiles/mixer/v1/check.pb.cc
        genfiles/mixer/v1/report.pb.cc
        genfiles/mixer/v1/service.pb.cc
        genfiles/google/rpc/status.pb.cc
        genfiles/src/envoy/mixer/string_map.pb.cc
        genfiles/global_dictionary.cc
        )


# Must be linked in, so OBJECT. 'static' will not be loaded since there
# are no references.
add_library(istioproxy OBJECT ${ISTIOPROXY_SOURCES})
