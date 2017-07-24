load("@bazel_tools//tools/build_defs/pkg:pkg.bzl", "pkg_tar", "pkg_deb")

pkg_tar(
    name = "istio-bin",
    files = [
        "@proxy//src/envoy/mixer:envoy",
    ],
    mode = "0755",
    package_dir = "/opt/istio/bin",
    strip_prefix = "/src/proxy/src/envoy/mixer",
)

pkg_tar(
    name = "pilot-bin",
    files = [
        "@pilot//cmd/pilot:pilot",
    ],
    mode = "0755",
    package_dir = "/opt/istio/bin",
)

pkg_tar(
    name = "debian-data",
    extension = "tar.gz",
    deps = [
        ":istio-bin",
        ":pilot-bin",
    ],
)

pkg_deb(
    name = "istio-debian",
    architecture = "amd64",
    built_using = "bazel",
    data = ":debian-data",
    depends = [
    ],
    description_file = "tools/debian/description",
    homepage = "http://istio.io",
    maintainer = "The Istio Authors <istio-dev@googlegroups.com>",
    package = "istio",
    version = "0.2.1",
)
