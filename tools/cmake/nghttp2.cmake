include_directories(
    ${ISTIO_NATIVE}/nghttp2/src/lib/includes
    ${ISTIO_DEP_GENFILES}/
)

set(NGHTTP2_SOURCES
        ${ISTIO_NATIVE}/nghttp2/src/lib/nghttp2_pq.c
        ${ISTIO_NATIVE}/nghttp2/src/lib/nghttp2_map.c
        ${ISTIO_NATIVE}/nghttp2/src/lib/nghttp2_queue.c
        ${ISTIO_NATIVE}/nghttp2/src/lib/nghttp2_frame.c
        ${ISTIO_NATIVE}/nghttp2/src/lib/nghttp2_buf.c
        ${ISTIO_NATIVE}/nghttp2/src/lib/nghttp2_stream.c
        ${ISTIO_NATIVE}/nghttp2/src/lib/nghttp2_outbound_item.c
        ${ISTIO_NATIVE}/nghttp2/src/lib/nghttp2_session.c
        ${ISTIO_NATIVE}/nghttp2/src/lib/nghttp2_submit.c
        ${ISTIO_NATIVE}/nghttp2/src/lib/nghttp2_helper.c
        ${ISTIO_NATIVE}/nghttp2/src/lib/nghttp2_npn.c
        ${ISTIO_NATIVE}/nghttp2/src/lib/nghttp2_hd.c
        ${ISTIO_NATIVE}/nghttp2/src/lib/nghttp2_hd_huffman.c
        ${ISTIO_NATIVE}/nghttp2/src/lib/nghttp2_hd_huffman_data.c
        ${ISTIO_NATIVE}/nghttp2/src/lib/nghttp2_version.c
        ${ISTIO_NATIVE}/nghttp2/src/lib/nghttp2_priority_spec.c
        ${ISTIO_NATIVE}/nghttp2/src/lib/nghttp2_option.c
        ${ISTIO_NATIVE}/nghttp2/src/lib/nghttp2_callbacks.c
        ${ISTIO_NATIVE}/nghttp2/src/lib/nghttp2_mem.c
        ${ISTIO_NATIVE}/nghttp2/src/lib/nghttp2_http.c
        ${ISTIO_NATIVE}/nghttp2/src/lib/nghttp2_rcbuf.c
        ${ISTIO_NATIVE}/nghttp2/src/lib/nghttp2_debug.c
        )

add_library(nghttp2 STATIC ${NGHTTP2_SOURCES})
set_target_properties(nghttp2 PROPERTIES COMPILE_FLAGS -DBUILDING_NGHTTP2)

