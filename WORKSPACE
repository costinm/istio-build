# Copyright 2016 Google Inc. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
################################################################################
#
local_repository(
    name = "com_google_protobuf",
    path = "src/protobuf"
)

local_repository(
    name = "proxy",
    path = "src/proxy"
)
#git_repository(
#        name = "org_pubref_rules_protobuf",
#        commit = "563b674a2ce6650d459732932ea2bc98c9c9a9bf",
#        remote = "https://github.com/pubref/rules_protobuf",
#    )
#local_repository(
#    name = "com_google_protobuf_cc",
#    path = "src/protobuf"
#)
local_repository(
    name = "mixerapi_git",
    path = "go/src/istio.io/api"
)
local_repository(
    name = "mixerclient_git",
    path = "src/mixerclient"
)
local_repository(
    name = "build_contrib",
    path = "build/contrib"
)

load(
    "@build_contrib//bazel:proxy_mixer_repositories.bzl",
    "mixer_client_repositories",
)

mixer_client_repositories()

load(
    "@build_contrib//bazel:mixerclient_repositories.bzl",
    "mixerapi_repositories",
)

mixerapi_repositories()

bind(
    name = "boringssl_crypto",
    actual = "//external:ssl",
)

#bind(
#      name = "protobuf",
#      actual = "@com_google_protobuf//:protobuf",
#)
#bind(
#      name = "protoc",
#      actual = "@com_google_protobuf_cc//:protoc",
#  )


local_repository(
    name = "envoy",
    path = "src/envoy"
)

load("@envoy//bazel:repositories.bzl", "envoy_dependencies")

envoy_dependencies(skip_targets = ['com_google_protobuf'])

bind(
    name = "cc_wkt_protos",
    actual = "@com_google_protobuf_cc//:cc_wkt_protos",
)

bind(
    name = "cc_wkt_protos_genproto",
    actual = "@com_google_protobuf_cc//:cc_wkt_protos_genproto",
)

load("@envoy//bazel:cc_configure.bzl", "cc_configure")

cc_configure()

load("@envoy_api//bazel:repositories.bzl", "api_dependencies")

api_dependencies()

# Following go repositories are for building go integration test for mixer filter.
#git_repository(
#    name = "io_bazel_rules_go",
#    commit = "9cf23e2aab101f86e4f51d8c5e0f14c012c2161c",  # Oct 12, 2017 (Add `build_external` option to `go_repository`)
#    remote = "https://github.com/bazelbuild/rules_go.git",
#)

load("@io_bazel_rules_go//go:def.bzl", "go_rules_dependencies", "go_register_toolchains")
go_rules_dependencies()
go_register_toolchains()

load("@io_bazel_rules_go//proto:def.bzl", "proto_register_toolchains")
proto_register_toolchains()

MIXER = "ba8ad5ca8ae77b946366e423d28b47cf3c8e1550"

git_repository(
    name = "com_github_istio_mixer",
    commit = MIXER,
    remote = "https://github.com/istio/mixer",
)

local_repository(
    name = "io_istio_istio",
    path = "go/src/istio.io/istio"
)

load("@io_istio_istio//mixer:adapter_author_deps.bzl", "mixer_adapter_repositories")
mixer_adapter_repositories()

load("@mixerapi_git//:api_dependencies.bzl", "mixer_api_for_proxy_dependencies")
mixer_api_for_proxy_dependencies()

