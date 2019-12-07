/**
 * Copyright 2018 Google LLC
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
variable "credentials_path" {
  description = "Credentials path"
}

variable "project_id" {
  description = "Project id"
}

variable "bucket_name" {
  description = "GCS bucket name to create"
}

variable "bigquery_dataset_id" {
  description = "BigQuery dataset id (optional)"
  default     = "slo"
}

variable "bigquery_delete_contents_on_destroy" {
  description = "BigQuery delete contents on destroy (optional)"
  default     = false
}

variable "pubsub_topic_name" {
  description = "Pub/Sub topic name"
  default     = "slo-export-topic"
}

variable "function_name" {
  description = "Name of the Cloud Function running the SLO pipeline"
  default     = "slo-shared-export"
}

variable "stackdriver_host_project_id" {
  description = "Stackdriver host project id"
}

variable "service_account_name" {
  description = "Name of the service account to create"
  default     = "slo-exporter"
}

variable "region" {
  description = "Region"
  default     = "us-east1"
}
