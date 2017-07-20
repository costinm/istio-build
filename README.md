# Using repo


```

$ repo init -u https://github.com/costinm/istio-repo -b [BRANCH]

$ repo sync -c



```

To use a workspace-local manifest, copy default.xml, edit and use "-m mymanifest.xml"

To start a branch in any repository, you can also use "repo start MYBRANCH directory ..."

To push changes, use "git add remote user git@github.com:USER/REPO.git" and
"git push user MYBRANCH:REMOTE_BRANCH"

You can switch branches by using the different manifest (a new repo init is needed),
but remember to work in a branch. "repo status" shows all changes across git trees.

See also https://source.android.com/source/downloading
