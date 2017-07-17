cc_library(
    name = "http_parser",
    srcs = ["http-parser/src/http_parser.c"],
    hdrs = glob([
        "http-parser/src/http_parser.h",
    ]),
    includes = ["http-parser/src"],
    visibility = ["//visibility:public"],
)

cc_library(
    name = "tclap",
    testonly = 0,
    hdrs = glob(["tclap/include/**/*.h"]),
    includes = ["tclap/include"],
    visibility = ["//visibility:public"],
)
