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

output "project_id" {
  value       = var.project_id
  description = "Project id"
}

output "exporters" {
  description = "Exporter config"
  value       = module.slo-pipeline.exporters
}

output "function_name" {
  description = "Cloud Function name"
  value       = module.slo-pipeline.function_name
}

output "function_bucket_name" {
  description = "Cloud Function bucket name"
  value       = module.slo-pipeline.function_bucket_name
}

output "function_bucket_object_name" {
  description = "Cloud Function code GCS object name"
  value       = module.slo-pipeline.function_bucket_object_name
}

output "pubsub_topic_name" {
  description = "Ingress PubSub topic to SLO pipeline"
  value       = module.slo-pipeline.pubsub_topic_name
}
