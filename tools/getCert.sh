# Get a cert, for GCloud DNS
# https://github.com/xenolf/lego/blob/master/providers/dns/googlecloud/googlecloud.go

# GCE_PROJECT = require by lego
# GCE_SERVICE_ACCOUNT_FILE = account with DNS permissions

function getCert() {
    go get -u github.com/xenolf/lego

    echo y | $GOPATH/bin/lego --email $EMAIL run

    GCE_SERVICE_ACCOUNT_FILE=$ISTIOENV/dns.json \
    lego --email $EMAIL --domains productpage.release02.istio.webinf.info --dns=gcloud run
}