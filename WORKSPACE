workspace(name= "istio")

# Style:
# - assume repo or godep will download the repositories, in a layout compatible
#   with golang.
# - try to stay close to the envoy style for envoy sources
#
# Dependencies in BUILD files:
# //src/project/foo - preferred style
# @envoy -> envoy defined as a repository - WORKSPACE "local_repository" rule mapping to actual directory
# //external/ -> a binding to a specific rule, may point to a repository or a //src/.. target.
#

# Useful queries
#  bazel query 'somepath(:istio-debian, @mixer//template/sample/report:go_default_library)'
#  bazel query 'deps(:istio-debian)'

# Bazel rules that we use - please avoid any rule that defines repositories or bindings !!!

# Downloads latest golang
local_repository(name = "io_bazel_rules_go", path = "tools/bazelbuild/rules_go")
load("@io_bazel_rules_go//go:def.bzl", "go_repositories", "go_repository")
go_repositories()

# Docker repos - python repos and binaries used to build docker with bazel.
local_repository(name = "io_bazel_rules_docker",path = "tools/bazelbuild/rules_docker",)
load("@io_bazel_rules_docker//docker:docker.bzl", "docker_repositories")
docker_repositories()


# Bindings - used with //external:BINDING_NAME.

bind( name = "mixer_client_lib", actual = "@mixerclient//:mixer_client_lib",)
bind(name = "cc_gogoproto", actual ="//src:cc_gogoproto")
bind(name = "cc_gogoproto_genproto", actual ="//src:cc_gogoproto_genproto")


# External projects without BUILD files
bind(name = "lightstep", actual = "//src:lightstep_core",)
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

bind(name = "six", actual = "@six_archive//:six",)


bind(
    name = "mixer_api_cc_proto",
    actual = "@io_istio_api//:mixer_api_cc_proto",
)



bind(
            name = "cc_wkt_protos",
            actual = "@com_google_protobuf//:cc_wkt_protos",
)

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

bind(name = "tcmalloc_and_profiler", actual="//src:tcmalloc_and_profiler")
# envoy/baze/repositories.bzl uses a macro, this workspace has explicit deps
bind(name = "envoy_address", actual = "@envoy_api//api:address_cc")
bind(name = "envoy_base", actual = "@envoy_api//api:base_cc")
bind(name = "envoy_cds", actual = "@envoy_api//api:cds_cc")
bind(name = "envoy_eds", actual = "@envoy_api//api:eds_cc")
bind(name = "envoy_health_check", actual = "@envoy_api//api:health_check_cc")
bind(name = "envoy_protocol", actual = "@envoy_api//api:protocol_cc")
bind(name = "envoy_tls_context", actual = "@envoy_api//api:tls_context_cc")


bind(name = "http_api_protos", actual = "@googleapis//:http_api_protos")

bind(name = "grpc_transcoding", actual = "//src/grpc_transcoding/src:transcoding")
bind(name = "path_matcher", actual = "//src/grpc_transcoding/src:path_matcher")

bind(
    name = "protobuf_python",
    actual = "@protobuf_bzl//:protobuf_python",
)

bind(
    name = "protobuf_python_genproto",
    actual = "@protobuf_bzl//:protobuf_python_genproto",
)


## Repositories (used with @foo ) - first deps that use bazel already

local_repository(name = "envoy", path = "envoy")

local_repository(name = "envoy_api", path = "src/envoy-api")

local_repository(
    name = "protobuf_bzl",
    path = "src/protobuf",
)

local_repository(
    name = "protobuf_git",
    path = "src/protobuf",
)

# Required for proto_library
local_repository(
    name = "com_google_protobuf",
    path = "src/protobuf",
)

local_repository(
    name="com_github_google_protobuf",
    path="src/protobuf",
)

local_repository(
  name = "mixerclient",
  path = "src/mixerclient",
)

local_repository(
  name = "mixer",
  path = "go/src/istio.io/mixer",
)

local_repository(
  name = "proxy",
  path = "src/proxy",
)

local_repository(
    name = "pilot",
    path = "go/src/istio.io/pilot",
)

# Custom fork of org.pubref.rules
local_repository(name="org_pubref_rules_protobuf", path="tools/bazelbuild/pubref")

## Repositories not using Bazel, with a custom build file.
# TODO: only new_local_repositories, with repo controlling the version

# Mixer variant - using gogo
new_git_repository(
    name = "com_github_googleapis_googleapis",
    build_file = "tools/bazel-custom/googleapis-gogo.BUILD",
    commit = "13ac2436c5e3d568bd0e938f6ed58b77a48aba15",  # Oct 21, 2016 (only release pre-dates sha)
    remote = "https://github.com/googleapis/googleapis.git",
)

new_git_repository(
    name = "org_golang_x_tools_imports",
    build_file = "go/src/istio.io/mixer/BUILD.goimports",
    commit = "e6cb469339aef5b7be0c89de730d5f3cc8e47e50",  # Jun 23, 2017 (no releases)
    remote = "https://github.com/golang/tools.git",
)

# Dependency of protobuf
new_http_archive(
    name = "six_archive",
    build_file = "@protobuf_bzl//:six.BUILD",
    sha256 = "105f8d68616f8248e24bf0e9372ef04d3cc10104f1980f54d57b2ce73a5ad56a",
    url = "https://pypi.python.org/packages/source/s/six/six-1.10.0.tar.gz#md5=34eed507548117b2ab523ab14b2f8b55",
)

# Used by Envoy - cc rules
new_local_repository(
    name = "googleapis",
    path = "src/googleapis/src",
    build_file = "tools/bazel-custom/googleapis.BUILD",
)

new_local_repository(
    name = "spdlog_git",
    path = "src/spdlog",
    build_file = "tools/bazel-custom/spdlog.BUILD"
)

new_local_repository(
    name = "io_istio_api",
    build_file = "tools/bazel-custom/istio-api.BUILD",
    path = "src/istio.io/api"
)

new_local_repository(
    name = "com_github_istio_api",
    build_file = "tools/bazel-custom/BUILD.api",
    path = "go/src/istio.io/api",
)

new_local_repository(
    name = "mixerapi_git",
    path = "src/istio.io/api",
    build_file = "tools/bazel-custom/istio-api.BUILD",
)



##### go repositories ######
# Gazel uses specific names
# TODO: integrate with godep or other tool to auto-generate this part
# TODO: tool to annotate each dep with the packages using it, remove unused

# Mar 7, 2017
go_repository(name="com_github_gogo_protobuf",  commit="100ba4e885062801d56799d78530b73b178a78f3",  importpath= "github.com/gogo/protobuf")

go_repository(
    name = "com_google_cloud_go",
    commit = "57377bad3486b37af17b47230a61603794c798ae",
    importpath = "cloud.google.com/go",
)

go_repository(
    name = "com_github_PuerkitoBio_purell",
    commit = "8a290539e2e8629dbc4e6bad948158f790ec31f4",
    importpath = "github.com/PuerkitoBio/purell",
)

go_repository(
    name = "com_github_PuerkitoBio_urlesc",
    commit = "5bd2802263f21d8788851d5305584c82a5c75d7e",
    importpath = "github.com/PuerkitoBio/urlesc",
)

go_repository(
    name = "com_github_coreos_go_oidc",
    commit = "c797a55f1c1001ec3169f1d0fbb4c5523563bec6",
    importpath = "github.com/coreos/go-oidc",
)

go_repository(
    name = "com_github_coreos_pkg",
    commit = "1c941d73110817a80b9fa6e14d5d2b00d977ce2a",  # darwin build: delete shell file called build
    importpath = "github.com/coreos/pkg",
)

go_repository(
    name = "com_github_davecgh_go_spew",
    commit = "5215b55f46b2b919f50a1df0eaa5886afe4e3b3d",
    importpath = "github.com/davecgh/go-spew",
)

go_repository(
    name = "com_github_docker_distribution",
    commit = "cd27f179f2c10c5d300e6d09025b538c475b0d51",
    importpath = "github.com/docker/distribution",
)

go_repository(
    name = "com_github_emicklei_go_restful",
    commit = "09691a3b6378b740595c1002f40c34dd5f218a22",
    importpath = "github.com/emicklei/go-restful",
)

go_repository(
    name = "com_github_ghodss_yaml",
    commit = "73d445a93680fa1a78ae23a5839bad48f32ba1ee",
    importpath = "github.com/ghodss/yaml",
)

go_repository(
    name = "com_github_go_openapi_jsonpointer",
    commit = "46af16f9f7b149af66e5d1bd010e3574dc06de98",
    importpath = "github.com/go-openapi/jsonpointer",
)

go_repository(
    name = "com_github_go_openapi_jsonreference",
    commit = "13c6e3589ad90f49bd3e3bbe2c2cb3d7a4142272",
    importpath = "github.com/go-openapi/jsonreference",
)

go_repository(
    name = "com_github_go_openapi_spec",
    commit = "6aced65f8501fe1217321abf0749d354824ba2ff",
    importpath = "github.com/go-openapi/spec",
)

go_repository(
    name = "com_github_go_openapi_swag",
    commit = "1d0bd113de87027671077d3c71eb3ac5d7dbba72",
    importpath = "github.com/go-openapi/swag",
)

go_repository(
    name = "com_github_golang_glog",
    commit = "44145f04b68cf362d9c4df2182967c2275eaefed",
    importpath = "github.com/golang/glog",
)

go_repository(
    name = "com_github_golang_groupcache",
    commit = "02826c3e79038b59d737d3b1c0a1d937f71a4433",
    importpath = "github.com/golang/groupcache",
)

go_repository(
    name = "com_github_google_gofuzz",
    commit = "44d81051d367757e1c7c6a5a86423ece9afcf63c",
    importpath = "github.com/google/gofuzz",
)

go_repository(
    name = "com_github_howeyc_fsnotify",
    commit = "f0c08ee9c60704c1879025f2ae0ff3e000082c13",
    importpath = "github.com/howeyc/fsnotify",
)

go_repository(
    name = "com_github_howeyc_gopass",
    commit = "3ca23474a7c7203e0a0a070fd33508f6efdb9b3d",
    importpath = "github.com/howeyc/gopass",
)

go_repository(
    name = "com_github_imdario_mergo",
    commit = "6633656539c1639d9d78127b7d47c622b5d7b6dc",
    importpath = "github.com/imdario/mergo",
)

go_repository(
    name = "com_github_jonboulle_clockwork",
    commit = "72f9bd7c4e0c2a40055ab3d0f09654f730cce982",
    importpath = "github.com/jonboulle/clockwork",
)

go_repository(
    name = "com_github_juju_ratelimit",
    commit = "77ed1c8a01217656d2080ad51981f6e99adaa177",
    importpath = "github.com/juju/ratelimit",
)

go_repository(
    name = "com_github_mailru_easyjson",
    commit = "d5b7844b561a7bc640052f1b935f7b800330d7e0",
    importpath = "github.com/mailru/easyjson",
)

go_repository(
    name = "com_github_pmezard_go_difflib",
    commit = "d8ed2627bdf02c080bf22230dbb337003b7aba2d",
    importpath = "github.com/pmezard/go-difflib",
)

go_repository(
    name = "com_github_spf13_pflag",
    commit = "9ff6c6923cfffbcd502984b8e0c80539a94968b7",
    importpath = "github.com/spf13/pflag",
)

go_repository(
    name = "com_github_stretchr_testify",
    commit = "e3a8ff8ce36581f87a15341206f205b1da467059",
    importpath = "github.com/stretchr/testify",
)

go_repository(
    name = "com_github_ugorji_go",
    commit = "ded73eae5db7e7a0ef6f55aace87a2873c5d2b74",
    importpath = "github.com/ugorji/go",
)

go_repository(
    name = "org_golang_x_crypto",
    commit = "d172538b2cfce0c13cee31e647d0367aa8cd2486",
    importpath = "golang.org/x/crypto",
)

go_repository(
    name = "org_golang_x_net",
    commit = "e90d6d0afc4c315a0d87a568ae68577cc15149a0",
    importpath = "golang.org/x/net",
)

go_repository(
    name = "org_golang_x_oauth2",
    commit = "3c3a985cb79f52a3190fbc056984415ca6763d01",
    importpath = "golang.org/x/oauth2",
)

go_repository(
    name = "org_golang_x_sys",
    commit = "8f0908ab3b2457e2e15403d3697c9ef5cb4b57a9",
    importpath = "golang.org/x/sys",
)

go_repository(
    name = "org_golang_x_text",
    build_file_name = "BUILD.bazel",  # darwin build: case insensitive file system problem
    commit = "2910a502d2bf9e43193af9d68ca516529614eed3",
    importpath = "golang.org/x/text",
)

go_repository(
    name = "org_golang_google_appengine",
    commit = "4f7eeb5305a4ba1966344836ba4af9996b7b4e05",
    importpath = "google.golang.org/appengine",
)

go_repository(
    name = "in_gopkg_inf_v0",
    commit = "3887ee99ecf07df5b447e9b00d9c0b2adaa9f3e4",
    importpath = "gopkg.in/inf.v0",
)

go_repository(
    name = "in_gopkg_yaml_v2",
    commit = "53feefa2559fb8dfa8d81baad31be332c97d6c77",
    importpath = "gopkg.in/yaml.v2",
)

go_repository(
    name = "io_k8s_apimachinery",
    build_file_name = "BUILD.bazel",
    build_file_generation = "on",
    commit = "6134cb2da6d90597b0434e349f90f94fafc9ae51",
    importpath = "k8s.io/apimachinery",
)

go_repository(
    name = "com_github_googleapis_gnostic",
    commit = "68f4ded48ba9414dab2ae69b3f0d69971da73aa5",
    importpath = "github.com/googleapis/gnostic",
)

go_repository(
    name = "io_k8s_client_go",
    commit = "7c69e980210777a6292351ac6873de083526f08e",  # Jul 18, 2017
    importpath = "k8s.io/client-go",
)

go_repository(
    name = "com_github_pkg_errors",
    commit = "a22138067af1c4942683050411a841ade67fe1eb",
    importpath = "github.com/pkg/errors",
)


go_repository(
    name = "io_k8s_ingress",
    commit = "3495bfb4aca9d34c97ad0cd3915965a79831fc9c",
    importpath = "k8s.io/ingress",
)

go_repository(
    name = "com_github_satori_go_uuid",
    commit = "5bf94b69c6b68ee1b541973bb8e1144db23a194b",
    importpath = "github.com/satori/go.uuid",
)

go_repository(
    name = "com_github_hashicorp_errwrap",
    commit = "7554cd9344cec97297fa6649b055a8c98c2a1e55",
    importpath = "github.com/hashicorp/errwrap",
)

go_repository(
    name = "com_github_hashicorp_go_multierror",
    commit = "8484912a3b9987857bac52e0c5fec2b95f419628",
    importpath = "github.com/hashicorp/go-multierror",
)

go_repository(
    name = "com_github_spf13_cobra",
    commit = "9c28e4bbd74e5c3ed7aacbc552b2cab7cfdfe744",
    importpath = "github.com/spf13/cobra",
)

go_repository(
    name = "com_github_inconshreveable_mousetrap",
    commit = "76626ae9c91c4f2a10f34cad8ce83ea42c93bb75",
    importpath = "github.com/inconshreveable/mousetrap",
)

go_repository(
    name = "com_github_cpuguy83_go_md2man",
    commit = "648eed146d3f3beacb64063cd0daae908015eebd",  # Mar 19, 2017 (no releases)
    importpath = "github.com/cpuguy83/go-md2man",
)

go_repository(
    name = "com_github_russross_blackfriday",
    commit = "35eb537633d9950afc8ae7bdf0edb6134584e9fc",  # Mar 19, 2017 (no releases)
    importpath = "github.com/russross/blackfriday",
)

go_repository(
    name = "com_github_shurcooL_sanitized_anchor_name",
    commit = "10ef21a441db47d8b13ebcc5fd2310f636973c77",  # Mar 19, 2017 (no releases)
    importpath = "github.com/shurcooL/sanitized_anchor_name",
)

go_repository(
    name = "com_github_golang_sync",
    commit = "450f422ab23cf9881c94e2db30cac0eb1b7cf80c",
    importpath = "github.com/golang/sync",
)

go_repository(
    name = "org_golang_google_api",
    commit = "48e49d1645e228d1c50c3d54fb476b2224477303",
    importpath = "google.golang.org/api",
)

go_repository(
    name = "org_golang_google_genproto",
    commit = "411e09b969b1170a9f0c467558eb4c4c110d9c77",
    importpath = "google.golang.org/genproto",
)

go_repository(
    name = "com_github_golang_protobuf",
    commit = "8ee79997227bf9b34611aee7946ae64735e6fd93",
    importpath = "github.com/golang/protobuf",
)

go_repository(
    name = "org_golang_google_grpc",
    commit = "8050b9cbc271307e5a716a9d782803d09b0d6f2d",  # v1.2.1
    importpath = "google.golang.org/grpc",
)

go_repository(
    name = "org_golang_x_time",
    commit = "8be79e1e0910c292df4e79c241bb7e8f7e725959",
    importpath = "golang.org/x/time",
)

go_repository(
    name = "com_github_prometheus_client_golang",
    commit = "c5b7fccd204277076155f10851dad72b76a49317",  # Aug 17, 2016 (v0.8.0)
    importpath = "github.com/prometheus/client_golang",
)

go_repository(
    name = "com_github_prometheus_common",
    commit = "dd2f054febf4a6c00f2343686efb775948a8bff4",  # Jan 8, 2017 (no releases)
    importpath = "github.com/prometheus/common",
)

go_repository(
    name = "com_github_matttproud_golang_protobuf_extensions",
    commit = "c12348ce28de40eed0136aa2b644d0ee0650e56c",  # Apr 24, 2016 (v1.0.0)
    importpath = "github.com/matttproud/golang_protobuf_extensions",
)

go_repository(
    name = "com_github_prometheus_procfs",
    commit = "1878d9fbb537119d24b21ca07effd591627cd160",  # Jan 28, 2017 (no releases)
    importpath = "github.com/prometheus/procfs",
)

go_repository(
    name = "com_github_beorn7_perks",
    commit = "4c0e84591b9aa9e6dcfdf3e020114cd81f89d5f9",  # Aug 4, 2016 (no releases)
    importpath = "github.com/beorn7/perks",
)

go_repository(
    name = "com_github_prometheus_client_model",
    commit = "fa8ad6fec33561be4280a8f0514318c79d7f6cb6",  # Feb 12, 2015 (only release too old)
    importpath = "github.com/prometheus/client_model",
)

go_repository(
    name = "com_github_cactus_statsd_client",
    commit = "91c326c3f7bd20f0226d3d1c289dd9f8ce28d33d",  # release 3.1.0, 5/30/2016
    importpath = "github.com/cactus/go-statsd-client",
)

go_repository(
    name = "com_github_redis_client",
    commit = "1ac54a28f5934ea5e08f588647e734aba2383cb8",  # Jan 28, 2017 (no releases)
    importpath = "github.com/mediocregopher/radix.v2",
)

go_repository(
    name = "com_github_mini_redis",
    commit = "e9169f14d501184b6cc94e270e5a93e4bab203d7",  # release 2.0.0, 4/15/2017
    importpath = "github.com/alicebob/miniredis",
)

go_repository(
    name = "com_github_bsm_redeo",
    commit = "1ce09fc76693fb3c1ca9b529c66f38920beb6fb8",  # Aug 17, 2016 (no releases)
    importpath = "github.com/bsm/redeo",
)


go_repository(
    name = "com_github_ugorji_go",
    commit = "708a42d246822952f38190a8d8c4e6b16a0e600c",  # Mar 12, 2017 (no releases)
    importpath = "github.com/ugorji/go",
)

go_repository(
    name = "in_gopkg_inf_v0",
    commit = "3887ee99ecf07df5b447e9b00d9c0b2adaa9f3e4",  # Sep 11, 2015 (latest commit)
    importpath = "gopkg.in/inf.v0",
)

go_repository(
    name = "com_github_docker_distribution",
    commit = "a25b9ef0c9fe242ac04bb20d3a028442b7d266b6",  # Apr 5, 2017 (v2.6.1)
    importpath = "github.com/docker/distribution",
)

go_repository(
    name = "com_github_go_openapi_spec",
    commit = "6aced65f8501fe1217321abf0749d354824ba2ff",  # Aug 8, 2016 (no releases)
    importpath = "github.com/go-openapi/spec",
)

go_repository(
    name = "com_github_google_gofuzz",
    commit = "44d81051d367757e1c7c6a5a86423ece9afcf63c",  # Nov 22, 2016 (no releases)
    importpath = "github.com/google/gofuzz",
)

go_repository(
    name = "com_github_emicklei_go_restful",
    commit = "09691a3b6378b740595c1002f40c34dd5f218a22",  # Dec 12, 2016 (k8s deps)
    importpath = "github.com/emicklei/go-restful",
)

go_repository(
    name = "com_github_go_openapi_jsonpointer",
    commit = "46af16f9f7b149af66e5d1bd010e3574dc06de98",  # Jul 4, 2016 (no releases)
    importpath = "github.com/go-openapi/jsonpointer",
)

go_repository(
    name = "com_github_go_openapi_jsonreference",
    commit = "13c6e3589ad90f49bd3e3bbe2c2cb3d7a4142272",  # Jul 4, 2016 (no releases)
    importpath = "github.com/go-openapi/jsonreference",
)

go_repository(
    name = "com_github_go_openapi_swag",
    commit = "1d0bd113de87027671077d3c71eb3ac5d7dbba72",  # Jul 4, 2016 (no releases)
    importpath = "github.com/go-openapi/swag",
)

go_repository(
    name = "com_github_emicklei_go_restful_swagger12",
    commit = "dcef7f55730566d41eae5db10e7d6981829720f6",
    importpath = "github.com/emicklei/go-restful-swagger12",
)

go_repository(
    name = "org_golang_x_oauth2",
    commit = "3c3a985cb79f52a3190fbc056984415ca6763d01",  # Aug 26, 2016 (no releases)
    importpath = "golang.org/x/oauth2",
)

go_repository(
    name = "com_github_juju_ratelimit",
    commit = "5b9ff866471762aa2ab2dced63c9fb6f53921342",
    importpath = "github.com/juju/ratelimit",
)

go_repository(
    name = "com_github_opencontainers_go_digest",
    commit = "aa2ec055abd10d26d539eb630a92241b781ce4bc",  # Jan 31, 2017 (v1.0.0-rc0)
    importpath = "github.com/opencontainers/go-digest",
)

go_repository(
    name = "com_github_blang_semver",
    commit = "b38d23b8782a487059e8fc8773e9a5b228a77cb6",  # Jan 30, 2017 (v3.5.0)
    importpath = "github.com/blang/semver",
)

go_repository(
    name = "com_github_coreos_go_oidc",
    commit = "be73733bb8cc830d0205609b95d125215f8e9c70",  # Mar 7, 2017 (no releases)
    importpath = "github.com/coreos/go-oidc",
)

go_repository(
    name = "com_github_mailru_easyjson",
    commit = "2af9a745a611440bab0528e5ac19b2805a1c50eb",  # Mar 28, 2017 (no releases)
    importpath = "github.com/mailru/easyjson",
)

go_repository(
    name = "com_github_PuerkitoBio_purell",
    commit = "0bcb03f4b4d0a9428594752bd2a3b9aa0a9d4bd4",  # Nov 14, 2016 (v1.1.0)
    importpath = "github.com/PuerkitoBio/purell",
)

go_repository(
    name = "org_golang_x_text",
    build_file_name = "BUILD.bazel",
    commit = "f4b4367115ec2de254587813edaa901bc1c723a8",  # Mar 31, 2017 (no releases)
    importpath = "golang.org/x/text",
)

go_repository(
    name = "com_github_PuerkitoBio_urlesc",
    commit = "bbf7a2afc14f93e1e0a5c06df524fbd75e5031e5",  # Mar 24, 2017 (no releases)
    importpath = "github.com/PuerkitoBio/urlesc",
)

go_repository(
    name = "com_github_pborman_uuid",
    commit = "a97ce2ca70fa5a848076093f05e639a89ca34d06",  # Feb 9, 2016 (v1.0)
    importpath = "github.com/pborman/uuid",
)

go_repository(
    name = "com_google_cloud_go",
    commit = "a5913b3f7deecba45e98ff33cefbac4fd204ddd7",  # Jun 27, 2017 (v0.10.0)
    importpath = "cloud.google.com/go",
)

go_repository(
    name = "com_github_coreos_pkg",
    commit = "1c941d73110817a80b9fa6e14d5d2b00d977ce2a",  # Feb 6, 2017 (fix for build dir bazel issue)
    importpath = "github.com/coreos/pkg",
)

go_repository(
    name = "com_github_jonboulle_clockwork",
    commit = "2eee05ed794112d45db504eb05aa693efd2b8b09",  # Jul 6, 2016 (v0.1.0)
    importpath = "github.com/jonboulle/clockwork",
)

go_repository(
    name = "com_github_imdario_mergo",
    commit = "3e95a51e0639b4cf372f2ccf74c86749d747fbdc",  # Feb 16, 2016 (v0.2.2)
    importpath = "github.com/imdario/mergo",
)

go_repository(
    name = "com_github_howeyc_gopass",
    commit = "bf9dde6d0d2c004a008c27aaee91170c786f6db8",  # Jan 9, 2017 (no releases)
    importpath = "github.com/howeyc/gopass",
)

go_repository(
    name = "org_golang_x_crypto",
    commit = "cbc3d0884eac986df6e78a039b8792e869bff863",  # Apr 8, 2017 (no releases)
    importpath = "golang.org/x/crypto",
)

go_repository(
    name = "com_github_googleapis_gax_go",
    commit = "9af46dd5a1713e8b5cd71106287eba3cefdde50b",  # Mar 20, 2017 (no releases)
    importpath = "github.com/googleapis/gax-go",
)

go_repository(
    name = "com_github_hashicorp_golang_lru",
    commit = "0a025b7e63adc15a622f29b0b2c4c3848243bbf6",  # Aug 13, 2016 (no releases)
    importpath = "github.com/hashicorp/golang-lru",
)

go_repository(
    name = "com_github_grpcecosystem_opentracing",
    commit = "c94552f01d20ad74ec45a8cd967833a9d0b106cf",  # Feb 24, 2017 (no releases)
    importpath = "github.com/grpc-ecosystem/grpc-opentracing",
)

go_repository(
    name = "com_github_grpcecosystem_middleware",
    commit = "f63a7dfb64c138bd93d5c5b896d8b33c4b08e000",  # Jun 11, 2017 (no releases)
    importpath = "github.com/grpc-ecosystem/go-grpc-middleware",
)

go_repository(
    name = "com_github_grpcecosystem_prometheus",
    commit = "2500245aa6110c562d17020fb31a2c133d737799",  # Mar 30, 2017 (only 1 release)
    importpath = "github.com/grpc-ecosystem/go-grpc-prometheus",
)

go_repository(
    name = "org_golang_google_api",
    commit = "1faa39f42f12a54fa82ca5902a7ab642d5b09ad1",  # Jun 5, 2017 (no releases)
    importpath = "google.golang.org/api",
)

go_repository(
    name = "org_golang_google_genproto",
    commit = "411e09b969b1170a9f0c467558eb4c4c110d9c77",  # Apr 4, 2017 (no release)
    importpath = "google.golang.org/genproto",
)

go_repository(
    name = "org_golang_x_tools",
    commit = "e6cb469339aef5b7be0c89de730d5f3cc8e47e50",  # Jun 23, 2017 (no releases)
    importpath = "golang.org/x/tools",
)

go_repository(
    name = "org_uber_go_zap",
    commit = "9cabc84638b70e564c3dab2766efcb1ded2aac9f",  # Jun 8, 2017 (v1.4.1)
    importpath = "go.uber.org/zap",
)

go_repository(
    name = "org_uber_go_atomic",
    commit = "4e336646b2ef9fc6e47be8e21594178f98e5ebcf",  # Apr 12, 2017 (v1.2.0)
    importpath = "go.uber.org/atomic",
)

go_repository(
    name = "com_github_Shopify_sarama",
    commit = "c01858abb625b73a3af51d0798e4ad42c8147093",  # May 8, 2017 (1.12.0)
    importpath = "github.com/Shopify/sarama",
)

go_repository(
    name = "com_github_apache_thrift",
    build_file_name = "BUILD.bazel",
    commit = "b2a4d4ae21c789b689dd162deb819665567f481c",  # Jan 6, 2017 (0.10.0)
    importpath = "github.com/apache/thrift",
)

go_repository(
    name = "com_github_go_logfmt_logfmt",
    commit = "390ab7935ee28ec6b286364bba9b4dd6410cb3d5",  # Nov 15, 2016 (0.3.0)
    importpath = "github.com/go-logfmt/logfmt",
)

go_repository(
    name = "com_github_eapache_queue",
    commit = "ded5959c0d4e360646dc9e9908cff48666781367",  # June 6, 2017 (1.0.2)
    importpath = "github.com/eapache/queue",
)

go_repository(
    name = "com_github_eapache_go_resiliency",
    commit = "6800482f2c813e689c88b7ed3282262385011890",  # Feb 13, 2015 (1.0.0)
    importpath = "github.com/eapache/go-resiliency",
)

go_repository(
    name = "com_github_eapache_go_xerial_snappy",
    commit = "bb955e01b9346ac19dc29eb16586c90ded99a98c",  # June 9, 2016 (no releases)
    importpath = "github.com/eapache/go-xerial-snappy",
)

go_repository(
    name = "com_github_rcrowley_go_metrics",
    commit = "1f30fe9094a513ce4c700b9a54458bbb0c96996c",  # Nov 28, 2016 (no releases)
    importpath = "github.com/rcrowley/go-metrics",
)

go_repository(
    name = "com_github_davecgh_go_spew",
    commit = "346938d642f2ec3594ed81d874461961cd0faa76",  # Nov 14, 2016 (1.1.0)
    importpath = "github.com/davecgh/go-spew",
)

go_repository(
    name = "com_github_pierrec_lz4",
    commit = "88df27974e3644957507a1ca1866edc8e98d4897",  # May 11, 2017 (no releases)
    importpath = "github.com/pierrec/lz4",
)

go_repository(
    name = "com_github_pierrec_xxHash",
    commit = "f051bb7f1d1aaf1b5a665d74fb6b0217712c69f7",  # March 20, 2016 (0.1.1)
    importpath = "github.com/pierrec/xxHash",
)

go_repository(
    name = "com_github_golang_snappy",
    commit = "553a641470496b2327abcac10b36396bd98e45c9",  # Feb 15, 2017 (no releases)
    importpath = "github.com/golang/snappy",
)

go_repository(
    name = "com_github_opentracing_contrib_go_observer",
    commit = "a52f2342449246d5bcc273e65cbdcfa5f7d6c63c",  # June 20, 2017 (no release)
    importpath = "github.com/opentracing-contrib/go-observer",
)

go_repository(
    name = "com_github_pmezard_go_difflib",
    commit = "792786c7400a136282c1664665ae0a8db921c6c2",  # August 8, 2016 (1.0.0)
    importpath = "github.com/pmezard/go-difflib",
)

go_repository(
    name = "com_github_stretchr_testify",
    commit = "69483b4bd14f5845b5a1e55bca19e954e827f1d0",  # September 24, 2016 (1.1.4)
    importpath = "github.com/stretchr/testify",
)

go_repository(
    name = "com_github_openzipkin_zipkin_go_opentracing",
    commit = "90d57f421daae5e385ce2429580f0d695c41823b",  # Jul 5, 2017 (has releases but we need a newer commit)
    importpath = "github.com/openzipkin/zipkin-go-opentracing",
)
go_repository(
    name = "org_golang_google_grpc",
    commit = "8050b9cbc271307e5a716a9d782803d09b0d6f2d",  # Apr 7, 2017 (v1.2.1)
    importpath = "google.golang.org/grpc",
)

go_repository(
    name = "com_github_spf13_cobra",
    commit = "35136c09d8da66b901337c6e86fd8e88a1a255bd",  # Jan 30, 2017 (no releases)
    importpath = "github.com/spf13/cobra",
)

go_repository(
    name = "com_github_spf13_pflag",
    commit = "9ff6c6923cfffbcd502984b8e0c80539a94968b7",  # Jan 30, 2017 (no releases)
    importpath = "github.com/spf13/pflag",
)

go_repository(
    name = "com_github_cpuguy83_go_md2man",
    commit = "648eed146d3f3beacb64063cd0daae908015eebd",  # Mar 19, 2017 (no releases)
    importpath = "github.com/cpuguy83/go-md2man",
)

go_repository(
    name = "com_github_russross_blackfriday",
    commit = "35eb537633d9950afc8ae7bdf0edb6134584e9fc",  # Mar 19, 2017 (no releases)
    importpath = "github.com/russross/blackfriday",
)

go_repository(
    name = "com_github_shurcooL_sanitized_anchor_name",
    commit = "10ef21a441db47d8b13ebcc5fd2310f636973c77",  # Mar 19, 2017 (no releases)
    importpath = "github.com/shurcooL/sanitized_anchor_name",
)

go_repository(
    name = "com_github_hashicorp_go_multierror",
    commit = "ed905158d87462226a13fe39ddf685ea65f1c11f",  # Dec 16, 2016 (no releases)
    importpath = "github.com/hashicorp/go-multierror",
)

go_repository(
    name = "com_github_hashicorp_errwrap",
    commit = "7554cd9344cec97297fa6649b055a8c98c2a1e55",  # Oct 27, 2014 (no releases)
    importpath = "github.com/hashicorp/errwrap",
)

go_repository(
    name = "com_github_opentracing_opentracing_go",
    commit = "1949ddbfd147afd4d964a9f00b24eb291e0e7c38",  # May 3, 2017 (v1.0.2)
    importpath = "github.com/opentracing/opentracing-go",
)

go_repository(
    name = "com_github_opentracing_basictracer",
    commit = "1b32af207119a14b1b231d451df3ed04a72efebf",  # Sep 29, 2016 (no releases)
    importpath = "github.com/opentracing/basictracer-go",
)


go_repository(
    name = "com_github_grpc_ecosystem_grpc_opentracing",
    commit = "c94552f01d20ad74ec45a8cd967833a9d0b106cf",  # Feb 24, 2017 (no releases)
    importpath = "github.com/grpc-ecosystem/grpc-opentracing",
)

go_repository(
    name = "com_github_grpc_ecosystem_go_grpc_middleware",
    commit = "f63a7dfb64c138bd93d5c5b896d8b33c4b08e000",  # Jun 11, 2017 (no releases)
    importpath = "github.com/grpc-ecosystem/go-grpc-middleware",
)

go_repository(
    name = "com_github_grpc_ecosystem_go_grpc_prometheus",
    commit = "2500245aa6110c562d17020fb31a2c133d737799",  # Mar 30, 2017 (only 1 release)
    importpath = "github.com/grpc-ecosystem/go-grpc-prometheus",
)

go_repository(
    name = "io_k8s_api",
    build_file_generation = "on",
    build_file_name = "BUILD.bazel",
    commit = "4d5cc6efc5e84aa19fb1bd3f911c16a6723c1bb7",  # Jul 19, 2017 (no releases)
    importpath = "k8s.io/api",
)

go_repository(
    name = "com_github_cactus_go_statsd_client",
    commit = "91c326c3f7bd20f0226d3d1c289dd9f8ce28d33d",  # release 3.1.0, 5/30/2016
    importpath = "github.com/cactus/go-statsd-client",
)

go_repository(
    name = "com_github_mediocregopher_radix_v2",
    commit = "1ac54a28f5934ea5e08f588647e734aba2383cb8",  # Jan 28, 2017 (no releases)
    importpath = "github.com/mediocregopher/radix.v2",
)
