licenses(["permissive"])

load("@protobuf_bzl//:protobuf.bzl", "cc_proto_library")

cc_library(
    name = "lightstep_core",
    testonly = 0,
    srcs = [
        "src/src/c++11/impl.cc",
        "src/src/c++11/span.cc",
        "src/src/c++11/tracer.cc",
        "src/src/c++11/util.cc",
    ],
    hdrs = [
        "src/src/c++11/lightstep/carrier.h",
        "src/src/c++11/lightstep/impl.h",
        "src/src/c++11/lightstep/options.h",
        "src/src/c++11/lightstep/propagation.h",
        "src/src/c++11/lightstep/span.h",
        "src/src/c++11/lightstep/tracer.h",
        "src/src/c++11/lightstep/util.h",
        "src/src/c++11/lightstep/value.h",
        "src/src/c++11/mapbox_variant/recursive_wrapper.hpp",
        "src/src/c++11/mapbox_variant/variant.hpp",
    ],
    copts = [
        "-DPACKAGE_VERSION='\"0.36\"'",
    ],
    includes = [
        "lightstep-tracer-common",
        "src/src/c++11",
        "third_party/lightstep-tracer/lightstep-tracer-common",
    ],
    visibility = ["//visibility:public"],
    deps = [
        ":collector_proto",
        ":lightstep_carrier_proto",
        "//external:protobuf",
    ],
)

cc_proto_library(
    name = "collector_proto",
    srcs = ["lightstep-tracer-common/collector.proto"],
    default_runtime = "//external:protobuf",
    protoc = "//external:protoc",
    visibility = ["//visibility:public"],
    deps = [
        "//external:cc_wkt_protos",
    ],
)

cc_proto_library(
    name = "lightstep_carrier_proto",
    srcs = ["lightstep-tracer-common/lightstep_carrier.proto"],
    default_runtime = "//external:protobuf",
    protoc = "//external:protoc",
    visibility = ["//visibility:public"],
    deps = [
        "//external:cc_wkt_protos",
    ],
)
