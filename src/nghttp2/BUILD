licenses(["permissive"])

cc_library(
    name = "nghttp2",
    testonly = 0,
    srcs = [
        "src/lib/nghttp2_buf.c",
        "src/lib/nghttp2_callbacks.c",
        "src/lib/nghttp2_debug.c",
        "src/lib/nghttp2_frame.c",
        "src/lib/nghttp2_hd.c",
        "src/lib/nghttp2_hd_huffman.c",
        "src/lib/nghttp2_hd_huffman_data.c",
        "src/lib/nghttp2_helper.c",
        "src/lib/nghttp2_http.c",
        "src/lib/nghttp2_map.c",
        "src/lib/nghttp2_mem.c",
        "src/lib/nghttp2_npn.c",
        "src/lib/nghttp2_option.c",
        "src/lib/nghttp2_outbound_item.c",
        "src/lib/nghttp2_pq.c",
        "src/lib/nghttp2_priority_spec.c",
        "src/lib/nghttp2_queue.c",
        "src/lib/nghttp2_rcbuf.c",
        "src/lib/nghttp2_session.c",
        "src/lib/nghttp2_stream.c",
        "src/lib/nghttp2_submit.c",
        "src/lib/nghttp2_version.c",
    ],
    hdrs = glob(["src/lib/*.h"]) + [
        "src/lib/includes/nghttp2/nghttp2.h",
        "include/nghttp2/nghttp2ver.h",
    ],
    includes = [
        "include",
        "src/lib/includes",
    ],
    visibility = ["//visibility:public"],
)
