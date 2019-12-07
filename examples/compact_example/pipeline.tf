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

module "slo-pipeline" {
  source                              = "../../modules/slo-pipeline-compact"
  project_id                          = var.project_id
  bigquery_project_id                 = var.project_id
  bigquery_dataset_id                 = var.bigquery_dataset_id
  bigquery_delete_contents_on_destroy = var.bigquery_delete_contents_on_destroy
  stackdriver_host_project_id         = var.stackdriver_host_project_id
  pubsub_topic_name                   = var.pubsub_topic_name
  service_account_name                = var.service_account_name
  function_name                       = var.function_name
  bucket_name                         = var.bucket_name
  region                              = var.region
}
