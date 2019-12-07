/**
 * Copyright 2019 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "schedule" {
  description = "SLO Compute Frequency"
  default     = "* * * * */1"
}

variable "project_id" {
  description = "Project to deploy the SLO computation on"
}

variable "region" {
  description = "Region"
  default     = "us-east1"
}

variable "labels" {
  description = "Resource labels"
  type        = map
  default     = {}
}

variable "name" {
  description = "SLO name"
}

variable "description" {
  description = "SLO description"
}

variable "target" {
  description = "SLO target"
}

variable "service_name" {
  description = "SLO service name"
}

variable "feature_name" {
  description = "SLO feature name"
}

variable "pubsub_project_id" {
  description = "Pubsub project id"
}

variable "pubsub_topic_name" {
  description = "Pubsub topic name"
}

variable "stackdriver_host_project_id" {
  description = "Stackdriver host project id"
}

variable "metric_type" {
  description = "SLO metric type"
}

variable "filter_good" {
  description = "Filter for good events (required if metric type: gauge)"
  default     = ""
}

variable "filter_bad" {
  description = "Filter for bad events (required if metric type: gauge)"
  default     = ""
}

variable "filter_valid" {
  description = "Filter for valid events (required if metric type: distribution)"
  default     = ""
}

variable "good_below_threshold" {
  description = "Good events are located below threshold"
  type        = bool
  default     = true
}
