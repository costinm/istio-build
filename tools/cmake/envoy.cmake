
include_directories(
    src/spdlog/include src/src/envoy/source
)

set(ENVOY_SOURCE_FILES
        # Problems compiling on android:
        src/envoy/source/common/common/to_lower_table.cc
        #src/envoy/source/common/filesystem/watcher_impl.cc
        src/envoy/source/common/runtime/runtime_impl.cc
        src/envoy/source/common/runtime/uuid_util.cc

        src/envoy/source/common/access_log/access_log_manager_impl.cc
        src/envoy/source/common/api/api_impl.cc

        src/envoy/source/common/buffer/buffer_impl.cc
        src/envoy/source/common/buffer/watermark_buffer.cc
        src/envoy/source/common/buffer/zero_copy_input_stream_impl.cc
        src/envoy/source/common/common/base64.cc
        src/envoy/source/common/common/hex.cc
        src/envoy/source/common/common/logger.cc
        src/envoy/source/common/common/thread.cc
        src/envoy/source/common/common/utility.cc
        src/envoy/source/common/common/version.cc
        src/envoy/source/common/common/version_linkstamp.cc
        #src/envoy/source/common/dynamo/dynamo_filter.cc
        #src/envoy/source/common/dynamo/dynamo_request_parser.cc
        #src/envoy/source/common/dynamo/dynamo_utility.cc
        #src/envoy/source/server/config/http/dynamo.cc
        #src/envoy/source/server/config/network/mongo_proxy.cc
        src/envoy/source/common/config/address_json.cc
        src/envoy/source/common/config/base_json.cc
        src/envoy/source/common/config/bootstrap_json.cc
        src/envoy/source/common/config/cds_json.cc
        src/envoy/source/common/config/filter_json.cc
        src/envoy/source/common/config/grpc_mux_impl.cc
        src/envoy/source/common/config/lds_json.cc
        src/envoy/source/common/config/protocol_json.cc
        src/envoy/source/common/config/rds_json.cc
        src/envoy/source/common/config/tls_context_json.cc

        src/envoy/source/common/config/metadata.cc
        src/envoy/source/common/config/utility.cc
        src/envoy/source/common/event/dispatched_thread.cc
        src/envoy/source/common/event/dispatcher_impl.cc
        src/envoy/source/common/event/event_impl_base.cc
        src/envoy/source/common/event/file_event_impl.cc
        src/envoy/source/common/event/libevent.cc
        src/envoy/source/common/event/signal_impl.cc
        src/envoy/source/common/event/timer_impl.cc
        src/envoy/source/common/filesystem/filesystem_impl.cc
        src/envoy/source/common/filesystem/inotify/watcher_impl.cc
        src/envoy/source/common/filter/auth/client_ssl.cc
        src/envoy/source/common/filter/echo.cc
        src/envoy/source/common/filter/ratelimit.cc
        src/envoy/source/common/filter/tcp_proxy.cc
        src/envoy/source/common/grpc/codec.cc
        src/envoy/source/common/grpc/common.cc
        src/envoy/source/common/grpc/http1_bridge_filter.cc
        src/envoy/source/common/grpc/rpc_channel_impl.cc
        src/envoy/source/common/grpc/grpc_web_filter.cc
        src/envoy/source/common/grpc/json_transcoder_filter.cc
        src/envoy/source/common/grpc/transcoder_input_stream_impl.cc
        src/envoy/source/common/http/access_log/access_log_formatter.cc
        src/envoy/source/common/http/access_log/access_log_impl.cc
        src/envoy/source/common/http/filter/buffer_filter.cc
        src/envoy/source/common/http/filter/fault_filter.cc
        src/envoy/source/common/http/filter/ip_tagging_filter.cc
        src/envoy/source/common/http/filter/ratelimit.cc
        src/envoy/source/common/http/http1/codec_impl.cc
        src/envoy/source/common/http/http1/conn_pool.cc
        src/envoy/source/common/http/http2/codec_impl.cc
        src/envoy/source/common/http/http2/conn_pool.cc
        src/envoy/source/common/http/websocket/ws_handler_impl.cc
        src/envoy/source/common/http/async_client_impl.cc
        src/envoy/source/common/http/codec_client.cc
        src/envoy/source/common/http/codes.cc
        src/envoy/source/common/http/filter_utility.cc
        src/envoy/source/common/http/conn_manager_impl.cc
        src/envoy/source/common/http/conn_manager_utility.cc
        src/envoy/source/common/http/date_provider_impl.cc
        src/envoy/source/common/http/header_map_impl.cc
        src/envoy/source/common/http/message_impl.cc
        src/envoy/source/common/http/rest_api_fetcher.cc
        src/envoy/source/common/http/user_agent.cc
        src/envoy/source/common/http/utility.cc
        src/envoy/source/common/json/config_schemas.cc
        src/envoy/source/common/json/json_loader.cc
        src/envoy/source/common/memory/stats.cc
        src/envoy/source/common/network/address_impl.cc
        src/envoy/source/common/network/cidr_range.cc
        src/envoy/source/common/network/connection_impl.cc
        src/envoy/source/common/network/dns_impl.cc
        src/envoy/source/common/network/filter_manager_impl.cc
        src/envoy/source/common/network/listen_socket_impl.cc
        src/envoy/source/common/network/listener_impl.cc
        src/envoy/source/common/network/proxy_protocol.cc
        src/envoy/source/common/network/utility.cc
        src/envoy/source/common/profiler/profiler.cc
        src/envoy/source/common/protobuf/utility.cc
        src/envoy/source/common/redis/codec_impl.cc
        src/envoy/source/common/redis/command_splitter_impl.cc
        src/envoy/source/common/redis/conn_pool_impl.cc
        src/envoy/source/common/redis/proxy_filter.cc
        src/envoy/source/common/router/config_impl.cc
        src/envoy/source/common/router/config_utility.cc
        src/envoy/source/common/router/rds_impl.cc
        src/envoy/source/common/router/rds_subscription.cc
        src/envoy/source/common/router/req_header_formatter.cc
        src/envoy/source/common/router/retry_state_impl.cc
        src/envoy/source/common/router/router.cc
        src/envoy/source/common/router/router_ratelimit.cc
        src/envoy/source/common/router/shadow_writer_impl.cc
        src/envoy/source/common/singleton/manager_impl.cc
        src/envoy/source/common/stats/stats_impl.cc
        src/envoy/source/common/stats/statsd.cc
        src/envoy/source/common/stats/thread_local_store.cc
        src/envoy/source/common/thread_local/thread_local_impl.cc
        src/envoy/source/common/tracing/zipkin/span_buffer.cc
        src/envoy/source/common/tracing/zipkin/span_context.cc
        src/envoy/source/common/tracing/zipkin/tracer.cc
        src/envoy/source/common/tracing/zipkin/util.cc
        src/envoy/source/common/tracing/zipkin/zipkin_core_types.cc
        src/envoy/source/common/tracing/zipkin/zipkin_tracer_impl.cc
        src/envoy/source/common/tracing/http_tracer_impl.cc
        src/envoy/source/common/upstream/cds_api_impl.cc
        src/envoy/source/common/upstream/cluster_manager_impl.cc
        src/envoy/source/common/upstream/health_checker_impl.cc
        src/envoy/source/common/upstream/host_utility.cc
        src/envoy/source/common/upstream/load_balancer_impl.cc
        src/envoy/source/common/upstream/logical_dns_cluster.cc
        src/envoy/source/common/upstream/outlier_detection_impl.cc
        src/envoy/source/common/upstream/ring_hash_lb.cc
        src/envoy/source/common/upstream/upstream_impl.cc
        src/envoy/source/common/upstream/cds_subscription.cc
        src/envoy/source/common/upstream/original_dst_cluster.cc

        src/envoy/source/common/upstream/eds.cc
        src/envoy/source/common/upstream/sds_subscription.cc
        src/envoy/source/common/ssl/connection_impl.cc
        src/envoy/source/common/ssl/context_config_impl.cc
        src/envoy/source/common/ssl/context_impl.cc
        src/envoy/source/common/ssl/context_manager_impl.cc
        src/envoy/source/common/ratelimit/ratelimit_impl.cc
        src/envoy/source/common/tracing/lightstep_tracer_impl.cc


        src/envoy/source/server/config/http/buffer.cc
        src/envoy/source/server/config/http/fault.cc
        src/envoy/source/server/config/http/grpc_http1_bridge.cc
        src/envoy/source/server/config/http/ratelimit.cc
        src/envoy/source/server/config/http/grpc_web.cc
        src/envoy/source/server/config/http/ip_tagging.cc
        src/envoy/source/server/config/http/router.cc
        src/envoy/source/server/config/network/client_ssl_auth.cc
        src/envoy/source/server/config/network/echo.cc
        src/envoy/source/server/config/network/http_connection_manager.cc
        src/envoy/source/server/config/network/ratelimit.cc
        src/envoy/source/server/config/network/redis_proxy.cc
        src/envoy/source/server/config/network/tcp_proxy.cc

        src/envoy/source/server/http/admin.cc
        src/envoy/source/server/http/health_check.cc
        src/envoy/source/server/connection_handler_impl.cc
        src/envoy/source/server/drain_manager_impl.cc
        src/envoy/source/server/guarddog_impl.cc
        src/envoy/source/server/server.cc
        src/envoy/source/server/init_manager_impl.cc
        src/envoy/source/server/lds_api.cc
        src/envoy/source/server/lds_subscription.cc
        src/envoy/source/server/worker_impl.cc
        src/envoy/source/server/listener_manager_impl.cc
        src/envoy/source/server/watchdog_impl.cc
        src/envoy/source/server/options_impl.cc
        src/envoy/source/server/configuration_impl.cc

        src/envoy/source/server/config_validation/api.cc
        src/envoy/source/server/config_validation/admin.cc
        src/envoy/source/server/config_validation/async_client.cc
        src/envoy/source/server/config_validation/cluster_manager.cc
        src/envoy/source/server/config_validation/dispatcher.cc
        src/envoy/source/server/config_validation/dns.cc
        src/envoy/source/server/config_validation/server.cc

        src/envoy/source/exe/main.cc
        src/envoy/source/exe/main_common.cc

        genfiles/api/address.pb.cc
        genfiles/api/bootstrap.pb.cc
        genfiles/api/cds.pb.cc
        genfiles/api/discovery.pb.cc
        genfiles/api/lds.pb.cc
        genfiles/api/protocol.pb.cc
        genfiles/api/rds.pb.cc
        genfiles/api/tls_context.pb.cc
        genfiles/api/filter/http_connection_manager.pb.cc

        genfiles/api/base.pb.cc
        genfiles/api/health_check.pb.cc
        genfiles/api/eds.pb.cc
        genfiles/common/ratelimit/ratelimit.pb.cc

        genfiles/gogoproto/gogo.pb.cc

        genfiles/google/api/annotations.pb.cc
        genfiles/google/api/http.pb.cc

        # Envoy deps
        src/grpc_transcoding/src/http_template.cc
        src/grpc_transcoding/src/json_request_translator.cc
        src/grpc_transcoding/src/message_reader.cc
        src/grpc_transcoding/src/message_stream.cc
        src/grpc_transcoding/src/path_matcher_node.cc
        src/grpc_transcoding/src/prefix_writer.cc
        src/grpc_transcoding/src/request_message_translator.cc
        src/grpc_transcoding/src/request_stream_translator.cc
        src/grpc_transcoding/src/request_weaver.cc
        src/grpc_transcoding/src/response_to_json_translator.cc
        src/grpc_transcoding/src/type_helper.cc

        )

# Not working/used on android or musl. The file installs a signal handler for backtraces.
if (NOT DEFINED ANDROID_TOOLCHAIN AND NOT DEFINED USE_MUSL)
   set(ENVOY_SOURCE_FILES
           ${ENVOY_SOURCE_FILES}
           src/envoy/source/common/api/os_sys_calls_impl.cc
           src/envoy/source/common/mongo/bson_impl.cc
           src/envoy/source/common/mongo/codec_impl.cc
           src/envoy/source/common/mongo/proxy.cc
           src/envoy/source/common/mongo/utility.cc
           src/envoy/source/exe/signal_action.cc
        )
else()
    set(ENVOY_SOURCE_FILES
            ${ENVOY_SOURCE_FILES}
            tools/cmake/os_sys_calls_impl.cc
            )
endif()

add_executable(envoy ${ENVOY_SOURCE_FILES} $<TARGET_OBJECTS:istioproxy>)

if (DEFINED ANDROID_TOOLCHAIN)
    target_link_libraries (envoy PUBLIC -llog -landroid)
endif()

target_link_libraries(envoy PUBLIC tracer)
target_link_libraries(envoy PUBLIC http-parser)

target_link_libraries(envoy PUBLIC cares)
target_link_libraries(envoy PUBLIC ssl)
target_link_libraries(envoy PUBLIC crypto)
target_link_libraries(envoy PUBLIC nghttp2)
#target_link_libraries(envoy PUBLIC ev)
target_link_libraries(envoy PUBLIC event_pthreads_static)
target_link_libraries(envoy PUBLIC event_core_static)
target_link_libraries(envoy PUBLIC libprotobuf)
target_link_libraries(envoy PUBLIC yaml-cpp)
target_link_libraries(envoy PUBLIC xxhash)


# src/envoy/source/common/common/version_linkstamp.cc:5:35:
# main.cc
set_target_properties(envoy PROPERTIES COMPILE_FLAGS "-DBUILD_SCM_STATUS=\\\"1\\\" -DBUILD_SCM_REVISION=\\\"2\\\" -D_GLIBCXX_REGEX_STATE_LIMIT")


# Envoy requires boring - will not work with platform openssl
#target_link_libraries(envoy -lssl -lcrypt)
