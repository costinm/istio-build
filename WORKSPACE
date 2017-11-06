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

local_repository(mixer
    name = "proxy",
    path = "src/proxy"
)

local_repository(
    name = "com_google_protobuf_cc",
    path = "src/protobuf"
)

load(
    "@proxy//src/envoy/mixer:repositories.bzl",
    "mixer_client_repositories",
)

mixer_client_repositories()

load(
    "@mixerclient_git//:repositories.bzl",
    "googleapis_repositories",
    "mixerapi_repositories",
)

googleapis_repositories()

mixerapi_repositories()

bind(
    name = "boringssl_crypto",
    actual = "//external:ssl",
)

bind(
      name = "protobuf",
      actual = "@com_google_protobuf//:protobuf",
)
bind(
      name = "protoc",
      actual = "@com_google_protobuf_cc//:protoc",
  )


local_repository(
    name = "envoy",
    path = "src/envoy"
)

load("@envoy//bazel:repositories.bzl", "envoy_dependencies")

envoy_dependencies(repository="@envoy")

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

#local_repository(
#    name = "com_github_istio_mixer",
#    path = "go/src/istio.io/mixer"
#)

load("@com_github_istio_mixer//test:repositories.bzl", "mixer_test_repositories")

mixer_test_repositories()
