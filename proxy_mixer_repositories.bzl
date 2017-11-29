# Copyright 2016 Istio Authors. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
################################################################################
#

MIXER_CLIENT = "f2905d1209a4b739295ba686539e99e98fb6e2f9"

def mixer_client_repositories(bind=True):
    #native.git_repository(
    #   name = "mixerclient_git",
    #    commit = MIXER_CLIENT,
    #    remote = "https://github.com/istio/mixerclient.git",
    #)

    if bind:
        native.bind(
            name = "mixer_client_lib",
            actual = "@mixerclient_git//:mixer_client_lib",
        )
        native.bind(
            name = "mixer_http_control_lib",
            actual = "@mixerclient_git//control/src/http:control_lib",
        )
        native.bind(
            name = "mixer_tcp_control_lib",
            actual = "@mixerclient_git//control/src/tcp:control_lib",
        )
