Custom bazel BUILD files, for projects that don't use bazel.

Example:

```
new_local_repository(
    name = "spdlog_git",
    path = "src/spdlog",
    build_file = "tools/bazel-custom/spdlog.BUILD"
)
```

