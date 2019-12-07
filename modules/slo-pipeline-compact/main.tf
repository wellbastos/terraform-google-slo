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
  source               = "../slo-pipeline"
  project_id           = var.project_id
  function_name        = var.function_name
  function_memory      = var.function_memory
  service_account_name = var.service_account_name
  bucket_name          = var.bucket_name
  pubsub_topic_name    = var.pubsub_topic_name
  region               = var.region
  exporters = [
    {
      class      = "Stackdriver"
      project_id = var.stackdriver_host_project_id
    },
    {
      class                      = "Bigquery"
      project_id                 = var.bigquery_project_id
      dataset_id                 = var.bigquery_dataset_id
      table_id                   = var.bigquery_table_id
      delete_contents_on_destroy = var.bigquery_delete_contents_on_destroy
    }
  ]
}
