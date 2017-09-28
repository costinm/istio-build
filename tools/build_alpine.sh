
# docker run -it -v /ws/istio:/workspace alpine

apk update

apk add  g++ gcc make cmake git bash go libnetfilter_acct-dev libnetfilter_cttimeout-dev 	libexecinfo-dev
# For uuid dep
#apk add util-linux-dev libuuid

cd /workspace
mkdir cmake-alpine
cd cmake-alpine
cmake ..

make