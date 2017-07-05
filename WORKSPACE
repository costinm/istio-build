############### Envoy module requirements.
new_local_repository(
    name = "envoy",
    path = "envoy",
    build_file = "src/envoy.BUILD"
)

# load("@envoy//bazel:repositories.bzl", "envoy_dependencies")
# load("@envoy//bazel:cc_configure.bzl", "cc_configure")

# From original proxy WORKSPACE
#envoy_dependencies(skip_protobuf_bzl = True, skip_targets=["googletest", "protobuf", "protoc", "lightstep", "ssl"])
# envoy_dependencies(skip_protobuf_bzl = True)

# Envoy BUILD files use things like:
# //include/envoy/ssl:context_interface
# The 'deps' do clone and copy all includes to THIRDPARTY_BUILD/include, lib
#
# Problems
# envoy_build_system doesn't allow caller to override anything
# defines a separate namespace

# Envoy overrides everything to use G++ and some pre-defined flags. Zlib doesn't like that
#cc_configure()

############### Proxy and mixer

# Using the protobuf_bzl name, to make envoy happy (since it's hardcoding @protobuf_bzl in envoy_build_system)

bind(
    name = "mixer_client_lib",
    actual = "//src/mixerclient:mixer_client_lib",
)

bind(
    name = "spdlog",
    actual = "@spdlog_git//:spdlog",
)

bind(
    name = "protoc",
    actual = "@protobuf_bzl//:protoc",
)

bind(
    name = "protobuf",
    actual = "@protobuf_bzl//:protobuf",
)

bind(
    name = "cc_wkt_protos",
    actual = "@protobuf_bzl//:cc_wkt_protos",
)

bind(
    name = "cc_wkt_protos_genproto",
    actual = "@protobuf_bzl//:cc_wkt_protos_genproto",
)

bind(
    name = "protobuf_compiler",
    actual = "@protobuf_bzl//:protoc_lib",
)

bind(
    name = "protobuf_clib",
    actual = "@protobuf_bzl//:protoc_lib",
)
bind(
    name = "boringssl_crypto",
    actual = "@boringssl//:crypto",
)
bind(
    name = "crypto",
    actual = "@boringssl//:crypto",
)

bind(
    name = "libssl",
    actual = "@boringssl//:ssl",
)

bind(
    name = "ssl",
    actual = "@boringssl//:ssl",
)

bind(
    name = "mixer_api_cc_proto",
    actual = "@mixerapi_git//:mixer_api_cc_proto",
)

bind(
            name = "cc_wkt_protos",
            actual = "@protobuf_bzl//:cc_wkt_protos",
)

bind(
            name = "lightstep",
            actual = "@lightstep_git//:lightstep_core",
)
################ Protobuf dependencies
bind(
    name = "nanopb",
    actual = "//third_party/nanopb",
)

bind(
    name = "zlib",
    actual = "@submodule_zlib//:z",
)

bind(
    name = "protobuf",
    actual = "@protobuf_bzl//:protobuf",
)

bind(
    name = "protobuf_clib",
    actual = "@protobuf_bzl//:protoc_lib",
)

bind(
    name = "protocol_compiler",
    actual = "@protobuf_bzl//:protoc",
)

bind(
    name = "cares",
    actual = "@submodule_cares//:ares",
)

bind(
    name = "gtest",
    actual = "@submodule_gtest//:gtest",
)

bind(
    name = "benchmark",
    actual = "@submodule_benchmark//:benchmark",
)

bind(
    name = "gflags",
    actual = "@com_github_gflags_gflags//:gflags",
)

new_local_repository(
    name = "boringssl",
    build_file = "third_party/boringssl-with-bazel/BUILD",
    path = "third_party/boringssl-with-bazel",
)

new_local_repository(
    name = "submodule_zlib",
    build_file = "third_party/zlib.BUILD",
    path = "third_party/zlib",
)

new_local_repository(
    name = "protobuf_bzl",
    build_file = "third_party/protobuf/BUILD",
    path = "third_party/protobuf",
)

new_local_repository(
    name = "submodule_gtest",
    build_file = "third_party/gtest.BUILD",
    path = "third_party/googletest",
)

local_repository(
    name = "com_github_gflags_gflags",
    path = "third_party/gflags",
)

new_local_repository(
    name = "submodule_benchmark",
    path = "third_party/benchmark",
    build_file = "third_party/benchmark.BUILD",
)

new_local_repository(
    name = "submodule_cares",
    path = "third_party/cares",
    build_file = "third_party/cares/cares.BUILD",
)

new_local_repository(
    name = "mixerapi_git",
    path = "src/api",
    build_file = "src/api.BUILD",
)

local_repository(
    name = "grpc_git",
    path = "src/grpc",
)

new_local_repository(
    name = "lightstep_git",
    path = "src/lightstep-tracer",
    build_file = "src/lightstep.BUILD"
)

new_local_repository(
    name = "lightstep_common_git",
    path = "src/lightstep-tracer-common",
    build_file = "src/lightstep_common.BUILD"
)

new_local_repository(
    name = "spdlog_git",
    path = "src/spdlog",
    build_file = "src/spdlog.BUILD"
)