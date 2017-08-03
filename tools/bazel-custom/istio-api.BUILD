load("@protobuf_bzl//:protobuf.bzl", "cc_proto_library")

cc_proto_library(
    name = "mixer_api_cc_proto",
    srcs =
        [
            "mixer/v1/attributes.proto",
            "mixer/v1/check.proto",
            "mixer/v1/report.proto",
            "mixer/v1/service.proto",
        ],
    default_runtime = "//external:protobuf",
    protoc = "//external:protoc",
    visibility = ["//visibility:public"],
    deps = [
        "@googleapis//:http_api_protos",
        "@protobuf_bzl//:cc_wkt_protos",
    ],
)

load("@io_bazel_rules_go//go:def.bzl", "go_prefix")
load("@io_bazel_rules_go//proto:go_proto_library.bzl", "go_proto_library")
package(default_visibility = ["//visibility:public"])
go_prefix("istio.io/api/proxy/v1/config")
go_proto_library(
    name = "go_default_library",
    srcs = glob(["proxy/v1/config/*.proto"]),
    deps = [
        "@com_github_golang_protobuf//ptypes/any:go_default_library",
        "@com_github_golang_protobuf//ptypes/duration:go_default_library",
        "@com_github_golang_protobuf//ptypes/wrappers:go_default_library",
    ],
)

