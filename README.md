# Using repo


```

$ repo init -u https://github.com/costinm/istio-repo -b [BRANCH]

$ repo sync -c

# Build istio envoy
$ bazel build @proxy//src/envoy/mixer:envoy

# create a manifest with the exact sha1 of each branch, to repro the current build
$ repo manifest -r -o build000.xml


```

To use a workspace-local manifest, with custom versions:  copy default.xml, edit and use "-m mymanifest.xml"

To start a branch in any repository, you can also use "repo start MYBRANCH directory ..."

To push changes to your own git tree, use "git remote add user git@github.com:USER/REPO.git" and
"git push user MYBRANCH:REMOTE_BRANCH"

You can switch branches by using the different manifest (a new repo init is needed),
but remember to work in a branch. "repo status" shows all changes across git trees.

See also https://source.android.com/source/downloading

# cmake

The workspace can be imported into CLion or other cmake-based IDEs. The tools/gen.sh will
copy the bazel generated files - we are using the golang style of checking in artifacts.
They need to be re-generated after .proto updates or if the protobuf branch is changed.

Normal debug/breakpoints should work.


