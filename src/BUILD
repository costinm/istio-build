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
