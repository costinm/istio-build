#!/bin/bash

# Script to sync generated artifacts, following golang style of checking in
# generated files. Both golang and cc generated files will be synced.
# Uses the bazel build output.

cp -a -f bazel-out/local-fastbuild/genfiles/external/envoy_api/api/ genfiles/
cp -a -f bazel-out/local-fastbuild/genfiles/external/googleapis/google genfiles/
cp -a -f bazel-out/local-fastbuild/genfiles/external/envoy/source genfiles/
cp -a -f bazel-out/local-fastbuild/genfiles/external/mixerapi_git/mixer genfiles/
cp -a -f bazel-out/local-fastbuild/genfiles/external/proxy/src genfiles/
