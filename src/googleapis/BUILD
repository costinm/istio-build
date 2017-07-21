load("@protobuf_bzl//:protobuf.bzl", "cc_proto_library", "py_proto_library")

filegroup(
    name = "http_api_protos_src",
    srcs = [
        "src/google/api/annotations.proto",
        "src/google/api/http.proto",
    ],
    visibility = ["//visibility:public"],
)

cc_proto_library(
    name = "http_api_protos",
    srcs = [
        "src/google/api/annotations.proto",
        "src/google/api/http.proto",
        "src/google/rpc/code.proto",
        "src/google/rpc/status.proto",
    ],
    default_runtime = "//external:protobuf",
    protoc = "//external:protoc",
    visibility = ["//visibility:public"],
    deps = ["@protobuf_bzl//:cc_wkt_protos"],
)

py_proto_library(
    name = "http_api_protos_py",
    srcs = [
        "src/google/api/annotations.proto",
        "src/google/api/http.proto",
    ],
    include = ".",
    default_runtime = "//external:protobuf_python",
    protoc = "//external:protoc",
    visibility = ["//visibility:public"],
    deps = ["//external:protobuf_python"],
)
