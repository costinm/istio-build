#add_definitions(-DBUILDING_NGHTTP2)

set(NGHTTP2_SOURCES
        third_party/nghttp2/src/lib/nghttp2_pq.c
        third_party/nghttp2/src/lib/nghttp2_map.c
        third_party/nghttp2/src/lib/nghttp2_queue.c
        third_party/nghttp2/src/lib/nghttp2_frame.c
        third_party/nghttp2/src/lib/nghttp2_buf.c
        third_party/nghttp2/src/lib/nghttp2_stream.c
        third_party/nghttp2/src/lib/nghttp2_outbound_item.c
        third_party/nghttp2/src/lib/nghttp2_session.c
        third_party/nghttp2/src/lib/nghttp2_submit.c
        third_party/nghttp2/src/lib/nghttp2_helper.c
        third_party/nghttp2/src/lib/nghttp2_npn.c
        third_party/nghttp2/src/lib/nghttp2_hd.c
        third_party/nghttp2/src/lib/nghttp2_hd_huffman.c
        third_party/nghttp2/src/lib/nghttp2_hd_huffman_data.c
        third_party/nghttp2/src/lib/nghttp2_version.c
        third_party/nghttp2/src/lib/nghttp2_priority_spec.c
        third_party/nghttp2/src/lib/nghttp2_option.c
        third_party/nghttp2/src/lib/nghttp2_callbacks.c
        third_party/nghttp2/src/lib/nghttp2_mem.c
        third_party/nghttp2/src/lib/nghttp2_http.c
        third_party/nghttp2/src/lib/nghttp2_rcbuf.c
        third_party/nghttp2/src/lib/nghttp2_debug.c
        )
add_library(nghttp2 STATIC ${NGHTTP2_SOURCES})
set_target_properties(nghttp2 PROPERTIES COMPILE_FLAGS -DBUILDING_NGHTTP2)
