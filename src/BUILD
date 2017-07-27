# This file has rules for projects/components not using bazel.
# If it gets too big it can be split.

# Some components using bazel (ex. mixerclient) use includes based on their own
# root, like "src/foo/bar", and don't work nicely if they're not the root workspace.
# They need local_repository() rules to build.

cc_library(
    name = "rapidjson",
    hdrs = glob(["rapidjson/include/**/*.h"]),
    includes = ["rapidjson/include"],
    visibility = ["//visibility:public"],
)

cc_library(
    name = "backward",
    srcs = ["backward/backward.cpp"],
    hdrs = [
        "backward/backward.hpp",
    ],
    strip_include_prefix = "backward",
    visibility = ["//visibility:public"],
)

load("@protobuf_bzl//:protobuf.bzl", "cc_proto_library")

cc_proto_library(
    name = "cc_gogoproto",
    srcs = ["github.com/gogo/protobuf/gogoproto/gogo.proto"],
    default_runtime = "//external:protobuf",
    protoc = "//external:protoc",
    visibility = ["//visibility:public"],
    deps = [
        "@googleapis//:http_api_protos",
        "@protobuf_bzl//:cc_wkt_protos",
    ],
)

cc_library(
    name = "lightstep_core",
    testonly = 0,
    srcs = [
        "lightstep/src/c++11/impl.cc",
        "lightstep/src/c++11/span.cc",
        "lightstep/src/c++11/tracer.cc",
        "lightstep/src/c++11/util.cc",
    ],
    hdrs = [
        "lightstep/src/c++11/lightstep/carrier.h",
        "lightstep/src/c++11/lightstep/impl.h",
        "lightstep/src/c++11/lightstep/options.h",
        "lightstep/src/c++11/lightstep/propagation.h",
        "lightstep/src/c++11/lightstep/span.h",
        "lightstep/src/c++11/lightstep/tracer.h",
        "lightstep/src/c++11/lightstep/util.h",
        "lightstep/src/c++11/lightstep/value.h",
        "lightstep/src/c++11/mapbox_variant/recursive_wrapper.hpp",
        "lightstep/src/c++11/mapbox_variant/variant.hpp",
    ],
    copts = [
        "-DPACKAGE_VERSION='\"0.36\"'",
    ],
    includes = [
        "lightstep-tracer-common",
        "lightstep/lightstep-tracer-common",
        "lightstep/src/c++11",
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
    srcs = ["lightstep/lightstep-tracer-common/collector.proto"],
    default_runtime = "//external:protobuf",
    protoc = "//external:protoc",
    visibility = ["//visibility:public"],
    deps = [
        "//external:cc_wkt_protos",
    ],
)

cc_proto_library(
    name = "lightstep_carrier_proto",
    srcs = ["lightstep/lightstep-tracer-common/lightstep_carrier.proto"],
    default_runtime = "//external:protobuf",
    protoc = "//external:protoc",
    visibility = ["//visibility:public"],
    deps = [
        "//external:cc_wkt_protos",
    ],
)

cc_library(
    name = "tcmalloc_and_profiler",
    srcs = [],
    hdrs = glob(["gperftools/**/*.h"]),
    strip_include_prefix = "gperftools",
)
