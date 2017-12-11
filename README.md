#

## Dependencies

Envoy uses bazel (envoy/bazel/repositories.bzl) with hardcoded SHA1 and git/http
URLs to download its deps.

Istio go can use either hardcoded SHA1, with the bazel build, or semantic versioning
using 'go dep' tool.

The cmake-based build system uses semantic versioning of deps, using the Android
'repo' tool.

To reproduce a build, 'repo manifest' will generate the SHA of each repository,
and it is possible to save the .repo/projects to preserve all the source
code that was used for the build.

You can customize the version and location of deps, or add more modules by
creating a 'repo' git tree with a modified manifest.

Usage:

```

$ repo init -u https://github.com/costinm/istio-repo -b [BRANCH]

$ repo sync -c

# create a manifest with the exact sha1 of each branch, to repro the current build
$ repo manifest -r -o build000.xml

```

- To use a workspace-local manifest, with custom versions:  copy default.xml, edit and
use "-m mymanifest.xml"

- To start a branch in any repository, you can use "repo start MYBRANCH directory ..."
or normal git commands.

- To push changes to your own git tree, use "git remote add user git@github.com:USER/REPO.git" and
"git push user MYBRANCH:REMOTE_BRANCH"

- You can switch branches by using the different manifest (a new repo init is needed),
but remember to work in a branch. "repo status" shows all changes across git trees.

- Getting repo: https://source.android.com/source/downloading

# IDEs

The workspace can be imported into CLion or other cmake-based IDEs.
Normal debug/breakpoints and code navigation should work as expected, it is
possible to develop using only the IDE without any command line.

# Generated files

We are using the golang style of checking in artifacts, but using a separate
git repo. They need to be re-generated after .proto updates or if the protobuf
branch is changed - 'make gen' can be used, but it still requires bazel.
Once the istio/istio project has full go-tools support we can reuse their
new code generation.


# Bazel

This project includes an experimental bazel build for Istio, using semantic
versioning for dependnecy management instead of manual SHA, and using
the standard go tool layout.

It is also using the google-style 'single tree' model, where version control
is used to manage versions and bazel only builds.

For example, it uses:

```
local_repository(
    name = "mixerclient_git",
    path = "src/mixerclient"
)
```

instead of

```
MIXER_CLIENT = "f2905d1209a4b739295ba686539e99e98fb6e2f9"

def mixer_client_repositories(bind=True):
    native.git_repository(
       name = "mixerclient_git",
        commit = MIXER_CLIENT,
        remote = "https://github.com/istio/mixerclient.git",
    )
```

This is a PoC, only few dependencies have been converted.

