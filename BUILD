load("@bazel_tools//tools/build_defs/pkg:pkg.bzl", "pkg_tar", "pkg_deb")

pkg_tar(
    name = "istio-bin",
    files = [
        "@proxy//src/envoy/mixer:envoy",
    ],
    mode = "0755",
    #    package_dir = "/opt/istio/bin",
    package_dir = "/usr/local/bin",
    strip_prefix = "/src/proxy/src/envoy/mixer",
)

pkg_tar(
    name = "pilot-bin",
    files = [
        "@pilot//cmd/istioctl:istioctl",
        "@pilot//cmd/pilot-agent:pilot-agent",
        "@pilot//cmd/pilot-discovery:pilot-discovery",
    ],
    mode = "0755",
    package_dir = "/usr/local/bin",
)

pkg_tar(
    name = "debian-data",
    extension = "tar.gz",
    deps = [
        ":istio-bin",
        ":pilot-bin",
        "@pilot//docker:prepare_proxy_tar",
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
