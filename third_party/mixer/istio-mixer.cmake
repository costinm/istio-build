include_directories(
        third_party/mixerapi
        third_party/mixer
)

set(ISTIOPROXY_SOURCES
        src/mixerclient/src/attribute.cc
        src/mixerclient/src/cache_key_set.cc
        src/mixerclient/src/check_cache.cc
        src/mixerclient/src/client_impl.cc
        src/mixerclient/src/quota_cache.cc
        src/mixerclient/src/signature.cc
        src/mixerclient/utils/md5.cc
        src/mixerclient/utils/protobuf.cc
        src/mixerclient/src/attribute_converter.cc
        src/proxy/src/envoy/mixer/http_control.cc
        src/proxy/src/envoy/mixer/http_filter.cc
        src/proxy/src/envoy/mixer/utils.cc
        src/proxy/src/envoy/mixer/config.cc
        src/proxy/src/envoy/mixer/grpc_transport.cc
        src/mixerclient/prefetch/quota_prefetch.cc
        src/mixerclient/prefetch/time_based_counter.cc

        third_party/mixerapi/mixer/v1/attributes.pb.cc
        third_party/mixerapi/mixer/v1/check.pb.cc
        third_party/mixerapi/mixer/v1/quota.pb.cc
        third_party/mixerapi/mixer/v1/report.pb.cc
        third_party/mixerapi/mixer/v1/service.pb.cc
        third_party/mixer/src/envoy/mixer/string_map.pb.cc
        )


# Must be linked in, so OBJECT. 'static' will not be loaded since there
# are no references.
add_library(istioproxy OBJECT ${ISTIOPROXY_SOURCES})
