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

locals {
  gauge_settings = {
    filter_good = var.filter_good
    filter_bad  = var.filter_bad
  }
  distribution_settings = {
    filter_valid         = var.filter_valid
    good_below_threshold = var.good_below_threshold
  }
  backend_measurement = var.metric_type == "gauge" ? local.gauge_settings : local.distribution_settings
  backend_method      = var.metric_type == "gauge" ? "good_bad_ratio" : "exponential_distribution_cut"
}

module "slo" {
  source     = "../slo"
  schedule   = var.schedule
  project_id = var.project_id
  region     = var.region
  labels     = var.labels
  config = {
    slo_name        = var.name
    slo_target      = var.target
    slo_description = var.description
    service_name    = var.service_name
    feature_name    = var.feature_name
    backend = {
      class       = "Stackdriver"
      method      = local.backend_method
      measurement = local.backend_measurement
      project_id  = var.stackdriver_host_project_id
    }
    exporters = [
      {
        class      = "Pubsub"
        project_id = var.pubsub_project_id
        topic_name = var.pubsub_topic_name
      }
    ]
  }
}
