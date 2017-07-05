#add_definitions(-DBUILDING_NGHTTP2)

set(NGHTTP2_SOURCES
        src/nghttp2/lib/nghttp2_pq.c
        src/nghttp2/lib/nghttp2_map.c
        src/nghttp2/lib/nghttp2_queue.c
        src/nghttp2/lib/nghttp2_frame.c
        src/nghttp2/lib/nghttp2_buf.c
        src/nghttp2/lib/nghttp2_stream.c
        src/nghttp2/lib/nghttp2_outbound_item.c
        src/nghttp2/lib/nghttp2_session.c
        src/nghttp2/lib/nghttp2_submit.c
        src/nghttp2/lib/nghttp2_helper.c
        src/nghttp2/lib/nghttp2_npn.c
        src/nghttp2/lib/nghttp2_hd.c
        src/nghttp2/lib/nghttp2_hd_huffman.c
        src/nghttp2/lib/nghttp2_hd_huffman_data.c
        src/nghttp2/lib/nghttp2_version.c
        src/nghttp2/lib/nghttp2_priority_spec.c
        src/nghttp2/lib/nghttp2_option.c
        src/nghttp2/lib/nghttp2_callbacks.c
        src/nghttp2/lib/nghttp2_mem.c
        src/nghttp2/lib/nghttp2_http.c
        src/nghttp2/lib/nghttp2_rcbuf.c
        src/nghttp2/lib/nghttp2_debug.c
        )
add_library(nghttp2 STATIC ${NGHTTP2_SOURCES})
set_target_properties(nghttp2 PROPERTIES COMPILE_FLAGS -DBUILDING_NGHTTP2)
