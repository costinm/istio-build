licenses(["notice"])


load("@protobuf_bzl//:protobuf.bzl", "cc_proto_library")

cc_proto_library(
    name = "mixer_api_cc_proto",
    srcs = glob(
        ["mixer/v1/*.proto"],
    ),
    default_runtime = "//external:protobuf",
    protoc = "//external:protoc",
    visibility = ["//visibility:public"],
    deps = [
       "//external:cc_wkt_protos",
#        "//external:cc_gogoproto",
#        "//external:servicecontrol",
    ],
)
