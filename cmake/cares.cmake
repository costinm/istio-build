set(CARES_SOURCE
        ${ISTIO_NATIVE}/cares/ares__close_sockets.c
        ${ISTIO_NATIVE}/cares/ares__get_hostent.c
        ${ISTIO_NATIVE}/cares/ares__read_line.c
        ${ISTIO_NATIVE}/cares/ares__timeval.c
        ${ISTIO_NATIVE}/cares/ares_cancel.c
        ${ISTIO_NATIVE}/cares/ares_create_query.c
        ${ISTIO_NATIVE}/cares/ares_data.c
        ${ISTIO_NATIVE}/cares/ares_destroy.c
        ${ISTIO_NATIVE}/cares/ares_expand_name.c
        ${ISTIO_NATIVE}/cares/ares_expand_string.c
        ${ISTIO_NATIVE}/cares/ares_fds.c
        ${ISTIO_NATIVE}/cares/ares_free_hostent.c
        ${ISTIO_NATIVE}/cares/ares_free_string.c
        ${ISTIO_NATIVE}/cares/ares_getenv.c
        ${ISTIO_NATIVE}/cares/ares_gethostbyaddr.c
        ${ISTIO_NATIVE}/cares/ares_gethostbyname.c
        ${ISTIO_NATIVE}/cares/ares_getnameinfo.c
        ${ISTIO_NATIVE}/cares/ares_getopt.c
        ${ISTIO_NATIVE}/cares/ares_getsock.c
        ${ISTIO_NATIVE}/cares/ares_init.c
        ${ISTIO_NATIVE}/cares/ares_library_init.c
        ${ISTIO_NATIVE}/cares/ares_llist.c
        ${ISTIO_NATIVE}/cares/ares_mkquery.c
        ${ISTIO_NATIVE}/cares/ares_nowarn.c
        ${ISTIO_NATIVE}/cares/ares_options.c
        ${ISTIO_NATIVE}/cares/ares_parse_a_reply.c
        ${ISTIO_NATIVE}/cares/ares_parse_aaaa_reply.c
        ${ISTIO_NATIVE}/cares/ares_parse_mx_reply.c
        ${ISTIO_NATIVE}/cares/ares_parse_naptr_reply.c
        ${ISTIO_NATIVE}/cares/ares_parse_ns_reply.c
        ${ISTIO_NATIVE}/cares/ares_parse_ptr_reply.c
        ${ISTIO_NATIVE}/cares/ares_parse_soa_reply.c
        ${ISTIO_NATIVE}/cares/ares_parse_srv_reply.c
        ${ISTIO_NATIVE}/cares/ares_parse_txt_reply.c
        ${ISTIO_NATIVE}/cares/ares_platform.c
        ${ISTIO_NATIVE}/cares/ares_process.c
        ${ISTIO_NATIVE}/cares/ares_query.c
        ${ISTIO_NATIVE}/cares/ares_search.c
        ${ISTIO_NATIVE}/cares/ares_send.c
        ${ISTIO_NATIVE}/cares/ares_strcasecmp.c
        ${ISTIO_NATIVE}/cares/ares_strdup.c
        ${ISTIO_NATIVE}/cares/ares_strerror.c
        ${ISTIO_NATIVE}/cares/ares_timeout.c
        ${ISTIO_NATIVE}/cares/ares_version.c
        ${ISTIO_NATIVE}/cares/ares_writev.c
        ${ISTIO_NATIVE}/cares/bitncmp.c
        ${ISTIO_NATIVE}/cares/inet_net_pton.c
        ${ISTIO_NATIVE}/cares/inet_ntop.c
        ${ISTIO_NATIVE}/cares/windows_port.c
        )

add_library(cares STATIC ${CARES_SOURCE})
set_target_properties(cares PROPERTIES COMPILE_FLAGS -DHAVE_CONFIG_H=1)

target_include_directories(cares PRIVATE
        ${ISTIO_DEP_GENFILES}/cares/config_linux
        ${ISTIO_DEP_GENFILES}/cares/
)

