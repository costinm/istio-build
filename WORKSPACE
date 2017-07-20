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

local_repository(
    name = "io_bazel_rules_go",
    path = "tools/bazelbuild/rules_go",
)
load("@io_bazel_rules_go//go:def.bzl", "go_repositories", "new_go_repository", "go_repository")

go_repositories()


# External projects without BUILD files
bind(name = "lightstep", actual = "//third_party/lightstep-tracer:lightstep_core",)
bind(name = "nghttp2", actual = "//third_party/nghttp2:nghttp2")
bind(name = "http_parser", actual = "//third_party:http_parser")


bind(name = "spdlog",actual = "@spdlog_git//:spdlog")

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
    actual = "//src/boringssl:crypto",
)

bind(
    name = "crypto",
    actual = "//src/boringssl:crypto",
)

bind(
    name = "libssl",
    actual = "//src/boringssl:ssl",
)

bind(
    name = "ssl",
    actual = "//src/boringssl:ssl",
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

bind(name="event", actual="//third_party/libevent:event")

bind(name="event_pthreads", actual="//third_party/libevent:event_pthreads")

bind(name="backward", actual="//src:backward")

bind(name="tclap", actual="//third_party:tclap")

bind(name="rapidjson", actual="//src:rapidjson")

bind(name = "ares", actual = "//third_party/cares:ares")

## Repositories (used with @foo )

# Hardcoded @envoy in mixer
local_repository(name = "envoy", path = "envoy")

bind(name = "envoy_eds", actual = "@envoy_api//api:eds")
# latest uses eds_cc - but removed 'canary'
#bind(name = "envoy_eds", actual = "@envoy_api//api:eds_cc")
local_repository(name = "envoy_api", path = "src/envoy-api")


bind(
    name = "protobuf_python",
    actual = "@protobuf_bzl//:protobuf_python",
)

bind(
    name = "protobuf_python_genproto",
    actual = "@protobuf_bzl//:protobuf_python_genproto",
)

#local_repository(
#    name = "boringssl",
#    path = "src/boringssl",
#)

# Envoy uses this name in its WORKSPACE - and has static @protobuf_bzl//
local_repository(
    name = "protobuf_bzl",
    path = "src/protobuf",
)
local_repository(
    name = "protobuf_git",
    path = "src/protobuf",
)

new_local_repository(
    name = "googleapis",
    path = "src/googleapis/src",
    build_file_content = """
load("@protobuf_bzl//:protobuf.bzl", "cc_proto_library", "py_proto_library")

filegroup(
    name = "http_api_protos_src",
    srcs = [
        "google/api/annotations.proto",
        "google/api/http.proto",
    ],
    visibility = ["//visibility:public"],
)

cc_proto_library(
    name = "http_api_protos",
    srcs = [
        "google/api/annotations.proto",
        "google/api/http.proto",
        "google/rpc/code.proto",
        "google/rpc/error_details.proto",
        "google/rpc/status.proto",
    ],
    default_runtime = "//external:protobuf",
    protoc = "//external:protoc",
    visibility = ["//visibility:public"],
    deps = ["@protobuf_bzl//:cc_wkt_protos"],
)

py_proto_library(
    name = "http_api_protos_py",
    srcs = [
        "google/api/annotations.proto",
        "google/api/http.proto",
    ],
    include = ".",
    default_runtime = "//external:protobuf_python",
    protoc = "//external:protoc",
    visibility = ["//visibility:public"],
    deps = ["//external:protobuf_python"],
)
            """,
)

# Required for proto_library
local_repository(
    name = "com_google_protobuf",
    path = "src/protobuf",
)

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

# Hardcoded in pilot

## Pilot repositories - in process of moving the deps to godep or repo
local_repository(
    name = "pilot",
    path = "src/istio.io/pilot",
)

new_go_repository(
    name = "com_google_cloud_go",
    commit = "57377bad3486b37af17b47230a61603794c798ae",
    importpath = "cloud.google.com/go",
)

new_go_repository(
    name = "com_github_PuerkitoBio_purell",
    commit = "8a290539e2e8629dbc4e6bad948158f790ec31f4",
    importpath = "github.com/PuerkitoBio/purell",
)

new_go_repository(
    name = "com_github_PuerkitoBio_urlesc",
    commit = "5bd2802263f21d8788851d5305584c82a5c75d7e",
    importpath = "github.com/PuerkitoBio/urlesc",
)

new_go_repository(
    name = "com_github_coreos_go_oidc",
    commit = "c797a55f1c1001ec3169f1d0fbb4c5523563bec6",
    importpath = "github.com/coreos/go-oidc",
)

new_go_repository(
    name = "com_github_coreos_pkg",
    commit = "1c941d73110817a80b9fa6e14d5d2b00d977ce2a",  # darwin build: delete shell file called build
    importpath = "github.com/coreos/pkg",
)

new_go_repository(
    name = "com_github_davecgh_go_spew",
    commit = "5215b55f46b2b919f50a1df0eaa5886afe4e3b3d",
    importpath = "github.com/davecgh/go-spew",
)

new_go_repository(
    name = "com_github_docker_distribution",
    commit = "cd27f179f2c10c5d300e6d09025b538c475b0d51",
    importpath = "github.com/docker/distribution",
)

new_go_repository(
    name = "com_github_emicklei_go_restful",
    commit = "09691a3b6378b740595c1002f40c34dd5f218a22",
    importpath = "github.com/emicklei/go-restful",
)

new_go_repository(
    name = "com_github_ghodss_yaml",
    commit = "73d445a93680fa1a78ae23a5839bad48f32ba1ee",
    importpath = "github.com/ghodss/yaml",
)

new_go_repository(
    name = "com_github_go_openapi_jsonpointer",
    commit = "46af16f9f7b149af66e5d1bd010e3574dc06de98",
    importpath = "github.com/go-openapi/jsonpointer",
)

new_go_repository(
    name = "com_github_go_openapi_jsonreference",
    commit = "13c6e3589ad90f49bd3e3bbe2c2cb3d7a4142272",
    importpath = "github.com/go-openapi/jsonreference",
)

new_go_repository(
    name = "com_github_go_openapi_spec",
    commit = "6aced65f8501fe1217321abf0749d354824ba2ff",
    importpath = "github.com/go-openapi/spec",
)

new_go_repository(
    name = "com_github_go_openapi_swag",
    commit = "1d0bd113de87027671077d3c71eb3ac5d7dbba72",
    importpath = "github.com/go-openapi/swag",
)

new_go_repository(
    name = "com_github_gogo_protobuf",
    commit = "e18d7aa8f8c624c915db340349aad4c49b10d173",
    importpath = "github.com/gogo/protobuf",
)

new_go_repository(
    name = "com_github_golang_glog",
    commit = "44145f04b68cf362d9c4df2182967c2275eaefed",
    importpath = "github.com/golang/glog",
)

new_go_repository(
    name = "com_github_golang_groupcache",
    commit = "02826c3e79038b59d737d3b1c0a1d937f71a4433",
    importpath = "github.com/golang/groupcache",
)

new_go_repository(
    name = "com_github_google_gofuzz",
    commit = "44d81051d367757e1c7c6a5a86423ece9afcf63c",
    importpath = "github.com/google/gofuzz",
)

new_go_repository(
    name = "com_github_howeyc_fsnotify",
    commit = "f0c08ee9c60704c1879025f2ae0ff3e000082c13",
    importpath = "github.com/howeyc/fsnotify",
)

new_go_repository(
    name = "com_github_howeyc_gopass",
    commit = "3ca23474a7c7203e0a0a070fd33508f6efdb9b3d",
    importpath = "github.com/howeyc/gopass",
)

new_go_repository(
    name = "com_github_imdario_mergo",
    commit = "6633656539c1639d9d78127b7d47c622b5d7b6dc",
    importpath = "github.com/imdario/mergo",
)

new_go_repository(
    name = "com_github_jonboulle_clockwork",
    commit = "72f9bd7c4e0c2a40055ab3d0f09654f730cce982",
    importpath = "github.com/jonboulle/clockwork",
)

new_go_repository(
    name = "com_github_juju_ratelimit",
    commit = "77ed1c8a01217656d2080ad51981f6e99adaa177",
    importpath = "github.com/juju/ratelimit",
)

new_go_repository(
    name = "com_github_mailru_easyjson",
    commit = "d5b7844b561a7bc640052f1b935f7b800330d7e0",
    importpath = "github.com/mailru/easyjson",
)

new_go_repository(
    name = "com_github_pmezard_go_difflib",
    commit = "d8ed2627bdf02c080bf22230dbb337003b7aba2d",
    importpath = "github.com/pmezard/go-difflib",
)

new_go_repository(
    name = "com_github_spf13_pflag",
    commit = "9ff6c6923cfffbcd502984b8e0c80539a94968b7",
    importpath = "github.com/spf13/pflag",
)

new_go_repository(
    name = "com_github_stretchr_testify",
    commit = "e3a8ff8ce36581f87a15341206f205b1da467059",
    importpath = "github.com/stretchr/testify",
)

new_go_repository(
    name = "com_github_ugorji_go",
    commit = "ded73eae5db7e7a0ef6f55aace87a2873c5d2b74",
    importpath = "github.com/ugorji/go",
)

new_go_repository(
    name = "org_golang_x_crypto",
    commit = "d172538b2cfce0c13cee31e647d0367aa8cd2486",
    importpath = "golang.org/x/crypto",
)

new_go_repository(
    name = "org_golang_x_net",
    commit = "e90d6d0afc4c315a0d87a568ae68577cc15149a0",
    importpath = "golang.org/x/net",
)

new_go_repository(
    name = "org_golang_x_oauth2",
    commit = "3c3a985cb79f52a3190fbc056984415ca6763d01",
    importpath = "golang.org/x/oauth2",
)

new_go_repository(
    name = "org_golang_x_sys",
    commit = "8f0908ab3b2457e2e15403d3697c9ef5cb4b57a9",
    importpath = "golang.org/x/sys",
)

new_go_repository(
    name = "org_golang_x_text",
    build_file_name = "BUILD.bazel",  # darwin build: case insensitive file system problem
    commit = "2910a502d2bf9e43193af9d68ca516529614eed3",
    importpath = "golang.org/x/text",
)

new_go_repository(
    name = "org_golang_google_appengine",
    commit = "4f7eeb5305a4ba1966344836ba4af9996b7b4e05",
    importpath = "google.golang.org/appengine",
)

new_go_repository(
    name = "in_gopkg_inf_v0",
    commit = "3887ee99ecf07df5b447e9b00d9c0b2adaa9f3e4",
    importpath = "gopkg.in/inf.v0",
)

new_go_repository(
    name = "in_gopkg_yaml_v2",
    commit = "53feefa2559fb8dfa8d81baad31be332c97d6c77",
    importpath = "gopkg.in/yaml.v2",
)

new_go_repository(
    name = "io_k8s_apimachinery",
    commit = "20e10d54608f05c3059443a6c0afb9979641e88d",
    importpath = "k8s.io/apimachinery",
)

new_go_repository(
    name = "io_k8s_client_go",
    commit = "4e221f82e2ad6e61bd6190602de9c3400d79f1aa",  # Apr 4, 2017
    importpath = "k8s.io/client-go",
)

new_go_repository(
    name = "com_github_pkg_errors",
    commit = "a22138067af1c4942683050411a841ade67fe1eb",
    importpath = "github.com/pkg/errors",
)

new_go_repository(
    name = "io_k8s_ingress",
    commit = "7f3763590a681011eedc4b14a80a97240dea644c",
    importpath = "k8s.io/ingress",
)

new_go_repository(
    name = "com_github_satori_go_uuid",
    commit = "5bf94b69c6b68ee1b541973bb8e1144db23a194b",
    importpath = "github.com/satori/go.uuid",
)

new_go_repository(
    name = "com_github_hashicorp_errwrap",
    commit = "7554cd9344cec97297fa6649b055a8c98c2a1e55",
    importpath = "github.com/hashicorp/errwrap",
)

new_go_repository(
    name = "com_github_hashicorp_go_multierror",
    commit = "8484912a3b9987857bac52e0c5fec2b95f419628",
    importpath = "github.com/hashicorp/go-multierror",
)

new_go_repository(
    name = "com_github_spf13_cobra",
    commit = "9c28e4bbd74e5c3ed7aacbc552b2cab7cfdfe744",
    importpath = "github.com/spf13/cobra",
)

new_go_repository(
    name = "com_github_inconshreveable_mousetrap",
    commit = "76626ae9c91c4f2a10f34cad8ce83ea42c93bb75",
    importpath = "github.com/inconshreveable/mousetrap",
)

new_go_repository(
    name = "com_github_cpuguy83_go_md2man",
    commit = "648eed146d3f3beacb64063cd0daae908015eebd",  # Mar 19, 2017 (no releases)
    importpath = "github.com/cpuguy83/go-md2man",
)

new_go_repository(
    name = "com_github_russross_blackfriday",
    commit = "35eb537633d9950afc8ae7bdf0edb6134584e9fc",  # Mar 19, 2017 (no releases)
    importpath = "github.com/russross/blackfriday",
)

new_go_repository(
    name = "com_github_shurcooL_sanitized_anchor_name",
    commit = "10ef21a441db47d8b13ebcc5fd2310f636973c77",  # Mar 19, 2017 (no releases)
    importpath = "github.com/shurcooL/sanitized_anchor_name",
)

new_go_repository(
    name = "com_github_golang_sync",
    commit = "450f422ab23cf9881c94e2db30cac0eb1b7cf80c",
    importpath = "github.com/golang/sync",
)

new_go_repository(
    name = "org_golang_google_api",
    commit = "48e49d1645e228d1c50c3d54fb476b2224477303",
    importpath = "google.golang.org/api",
)

new_go_repository(
    name = "com_github_googleapis_gax_go",
    commit = "9af46dd5a1713e8b5cd71106287eba3cefdde50b",
    importpath = "github.com/googleapis/gax-go",
)

new_go_repository(
    name = "org_golang_google_genproto",
    commit = "411e09b969b1170a9f0c467558eb4c4c110d9c77",
    importpath = "google.golang.org/genproto",
)

new_local_repository(
    name = "io_istio_api",
    build_file_content = """
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
    """,
    path = "src/istio.io/api"
)

new_go_repository(
    name = "com_github_golang_protobuf",
    commit = "8ee79997227bf9b34611aee7946ae64735e6fd93",
    importpath = "github.com/golang/protobuf",
)

new_go_repository(
    name = "org_golang_google_grpc",
    commit = "8050b9cbc271307e5a716a9d782803d09b0d6f2d",  # v1.2.1
    importpath = "google.golang.org/grpc",
)

# Dependency of protobuf
new_http_archive(
    name = "six_archive",
    build_file = "@protobuf_bzl//:six.BUILD",
    sha256 = "105f8d68616f8248e24bf0e9372ef04d3cc10104f1980f54d57b2ce73a5ad56a",
    url = "https://pypi.python.org/packages/source/s/six/six-1.10.0.tar.gz#md5=34eed507548117b2ab523ab14b2f8b55",
)


bind(
    name = "six",
    actual = "@six_archive//:six",
)

##### Proxy
# Can't be used directly - include "src/envoy/.../ must be fixed.

local_repository(
  name = "proxy",
  path = "src/proxy",
)


##### Mixerclient
# depends on uuid-dev for platform uuid.h

# Doesn't work - src/includes not found. Should move BUILD to directory, or
# find how to specify it.
#bind( name = "mixer_client_lib", actual = "//src/mixerclient:mixer_client_lib",)
bind( name = "mixer_client_lib", actual = "@mixerclient//:mixer_client_lib",)

local_repository(
  name = "mixerclient",
  path = "src/mixerclient",
)

new_local_repository(
    name = "mixerapi_git",
    path = "src/istio.io/api",
    build_file = "third_party/api/api.BUILD",
)

