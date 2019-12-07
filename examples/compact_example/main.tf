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

provider "google" {
  credentials = file(var.credentials_path)
  version     = "~> 2.0"
}

module "slo-gauge" {
  source                      = "../../modules/slo-compact"
  project_id                  = var.project_id
  pubsub_project_id           = var.project_id
  pubsub_topic_name           = module.slo-pipeline.pubsub_topic_name
  stackdriver_host_project_id = var.stackdriver_host_project_id
  region                      = var.region
  name                        = "ps-acked-msg"
  target                      = "0.9"
  description                 = "Acked Pub/Sub messages over total number of Pub/Sub messages"
  service_name                = "svc"
  feature_name                = "feature"
  metric_type                 = "gauge"
  filter_good                 = "project=\"${var.project_id}\" AND metric.type=\"pubsub.googleapis.com/subscription/ack_message_count\""
  filter_bad                  = "project=\"${var.project_id}\" AND metric.type=\"pubsub.googleapis.com/subscription/num_outstanding_messages\""
}

module "slo-distribution" {
  source                      = "../../modules/slo-compact"
  pubsub_project_id           = var.project_id
  project_id                  = var.project_id
  pubsub_topic_name           = module.slo-pipeline.pubsub_topic_name
  stackdriver_host_project_id = var.stackdriver_host_project_id
  region                      = var.region
  name                        = "ps-req-latency"
  target                      = "10" # bucket number
  description                 = "Pub/Sub messages push latency"
  service_name                = "svc"
  feature_name                = "feature"
  metric_type                 = "distribution"
  filter_valid                = "project=\"${var.project_id}\" AND metric.type=\"pubsub.googleapis.com/subscription/push_request_latencies\""
  good_below_threshold        = true
}
