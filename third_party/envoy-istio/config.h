/* Copyright 2017 Istio Authors. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#pragma once

#include <map>
#include <string>
#include <vector>

#include "envoy/json/json_object.h"
#include "include/attribute.h"

namespace Envoy {
namespace Http {
namespace IstioMixer {

// A config for mixer filter
struct MixerConfig {
  // the mixer server address
  std::string mixer_server;

  // These static attributes will be send to mixer in both
  // Check and Report.
  std::map<std::string, std::string> mixer_attributes;

  // These attributes will be forwarded to upstream.
  std::map<std::string, std::string> forward_attributes;

  // Quota attributes.
  std::string quota_name;
  std::string quota_amount;
  std::string quota_cache;

  // The attribute names for check cache.
  std::vector<std::string> check_cache_keys;
  std::string check_cache_expiration;

  // valid values are: [open|close]
  std::string network_fail_policy;

  // Load the config from envoy config.
  void Load(const Json::Object& json);

  // Extract quota attributes.
  void ExtractQuotaAttributes(::istio::mixer_client::Attributes* attr) const;
};

}  // namespace Mixer
}  // namespace Http
}  // namespace Envoy
