load("@bazel_tools//tools/build_defs/pkg:pkg.bzl", "pkg_tar", "pkg_deb")

pkg_tar(
    name = "istio-bin",
    files = [
        "@mixer//cmd/server:mixs",
        "@pilot//cmd/pilot-agent:pilot-agent",
        "@pilot//cmd/pilot-discovery:pilot-discovery",
        "@pilot//docker:prepare_proxy",
        "@proxy//src/envoy/mixer:envoy",
    ],
    mode = "0755",
    package_dir = "/usr/local/bin",
)

pkg_tar(
    name = "istio-systemd",
    files = ["tools/deb/istio.service"],
    mode = "644",
    package_dir = "/lib/systemd/system",
)

pkg_tar(
    name = "debian-data",
    extension = "tar.gz",
    deps = [
        ":istio-bin",
        ":istio-systemd",
    ],
)

pkg_deb(
    name = "istio-debian",
    architecture = "amd64",
    built_using = "bazel",
    data = ":debian-data",
    depends = [
        "uuid-runtime",  # Envoy/proxy dep
    ],
    description_file = "tools/deb/description",
    homepage = "http://istio.io",
    maintainer = "The Istio Authors <istio-dev@googlegroups.com>",
    package = "istio",
    postinst = "tools/deb/postinst.sh",
    version = "0.2.1",
)
