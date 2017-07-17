workspace(name= "istio")

# Style:
# - assume repo or godep will download the repositories, in a format compatible
#   with golang.
# - try to stay close to the envoy style for envoy sources
#
# Ok:
# @envoy -> envoy defined as a repository
# //external/ -> a binding
#
#

# External projects without BUILD files
bind(name = "lightstep", actual = "//third_party/lightstep-tracer:lightstep_core",)
bind(name = "nghttp2", actual = "//third_party/nghttp2:nghttp2",)
bind(name = "http_parser", actual = "//third_party:http_parser",
)

# Cleaned up Envoy build file, without 'binary build' blobs
new_local_repository(
    name = "envoy",
    path = "envoy",
    build_file = "third_party/envoy/envoy.BUILD"
)

# Naming conflicts:
# mixerclient: @com_google_protobuf (for cc_proto_library )


# load("@envoy//bazel:repositories.bzl", "envoy_dependencies")
# load("@envoy//bazel:cc_configure.bzl", "cc_configure")

# From original proxy WORKSPACE
#envoy_dependencies(skip_com_google_protobuf = True, skip_targets=["googletest", "protobuf", "protoc", "lightstep", "ssl"])
# envoy_dependencies(skip_com_google_protobuf = True)

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

# Using the com_google_protobuf name, to make envoy happy (since it's hardcoding @com_google_protobuf in envoy_build_system)

bind( name = "mixer_client_lib", actual = "//src/mixerclient:mixer_client_lib",)

bind(
    name = "spdlog",
    actual = "@spdlog_git//:spdlog",
)

bind(
    name = "protoc",
    actual = "@com_google_protobuf//:protoc",
)

bind(
    name = "protobuf",
    actual = "@com_google_protobuf//:protobuf",
)

bind(
    name = "cc_wkt_protos",
    actual = "@com_google_protobuf//:cc_wkt_protos",
)

bind(
    name = "cc_wkt_protos_genproto",
    actual = "@com_google_protobuf//:cc_wkt_protos_genproto",
)

bind(
    name = "protobuf_compiler",
    actual = "@com_google_protobuf//:protoc_lib",
)

bind(
    name = "protobuf_clib",
    actual = "@com_google_protobuf//:protoc_lib",
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
            actual = "@com_google_protobuf//:cc_wkt_protos",
)

################ Protobuf dependencies
bind(
    name = "nanopb", actual = "//third_party/nanopb",
)

bind(
    name = "zlib",
    actual = "@submodule_zlib//:z",
)

bind(
    name = "protobuf",
    actual = "@com_google_protobuf//:protobuf",
)

bind(
    name = "protobuf_clib",
    actual = "@com_google_protobuf//:protoc_lib",
)

bind(
    name = "protocol_compiler",
    actual = "@com_google_protobuf//:protoc",
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

### Mixer

## Repositories (used with @foo )

local_repository(
    name = "boringssl",
    path = "src/boringssl",
)

# Envoy uses this name in its WORKSPACE - and has static @protobuf_bzl//
local_repository(
    name = "protobuf_bzl",
    path = "src/protobuf",
)

# Required for proto_library
local_repository(
    name = "com_google_protobuf",
    path = "src/protobuf",
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

bind(
    name = "ares",
    actual = "//third_party/cares:ares",
)

new_local_repository(
    name = "mixerapi_git",
    path = "src/istio.io/api",
    build_file = "third_party/api/api.BUILD",
)

#local_repository(
#    name = "mixerapi_git",
#    path = "src/api",
#)


#bind(name = "lightstep", actual = "@lightstep//:lightstep_core",)
#new_local_repository(
#    name = "lightstep",
#    path = "src/lightstep-tracer",
#    build_file = "third_party/lightstep-tracer/BUILD"
#)

new_local_repository(
    name = "lightstep_common_git",
    path = "src/lightstep-tracer-common",
    build_file = "src/lightstep_common.BUILD"
)

new_local_repository(
    name = "spdlog_git",
    path = "src/spdlog",
    build_file = "third_party/spdlog/spdlog.BUILD"
)

bind(name="event", actual="@libevent_bzl//:event")
bind(name="event_pthreads", actual="@libevent_bzl//:event_pthreads")

local_repository(
    name = "libevent_bzl",
    path = "third_party/libevent",
)

bind(name="backward", actual="@backward//:backward")
new_local_repository(
    name = "backward",
    path = "src/backward",
    build_file = "third_party/backward/BUILD"
)

bind(name="tclap", actual="//third_party:tclap")

bind(name="rapidjson", actual="//src:rapidjson")
