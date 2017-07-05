
load("@protobuf_bzl//:protobuf.bzl", "cc_proto_library")

cc_library(
    name = "lightstep_core",
    srcs = [
        "src/c++11/impl.cc",
        "src/c++11/span.cc",
        "src/c++11/tracer.cc",
        "src/c++11/util.cc",
    ],
    hdrs = [
        "src/c++11/lightstep/impl.h",
        "src/c++11/lightstep/options.h",
        "src/c++11/lightstep/propagation.h",
        "src/c++11/lightstep/carrier.h",
        "src/c++11/lightstep/span.h",
        "src/c++11/lightstep/tracer.h",
        "src/c++11/lightstep/util.h",
        "src/c++11/lightstep/value.h",
        "src/c++11/mapbox_variant/recursive_wrapper.hpp",
        "src/c++11/mapbox_variant/variant.hpp",
    ],
    copts = [
        "-DPACKAGE_VERSION='\"0.36\"'",
        "-Iexternal/lightstep_git/src/c++11/lightstep",
        "-Iexternal/lightstep_git/src/c++11/mapbox_variant",
    ],
    includes = [
        "src/c++11",
    ],
    visibility = ["//visibility:public"],
    deps = [
        "@lightstep_common_git//:collector_proto",
        "@lightstep_common_git//:lightstep_carrier_proto",
        "//external:protobuf",
    ],
)
