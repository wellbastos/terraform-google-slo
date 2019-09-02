variable "project_id" {
  description = "Project id to create SLO infrastructure"
}

variable "stackdriver_host_project_id" {
  description = "Stackdriver host project id (to write custom metrics)"
}

variable "bigquery_project_id" {
  description = "BigQuery host project id (to write BQ tables)"
}

variable "bigquery_dataset_name" {
  description = "BigQuery dataset name (optional)"
  default     = "slo"
}

variable "bigquery_table_name" {
  description = "BigQuery table name (optional)"
  default     = "reports"
}

variable "function_name" {
  description = "Cloud Function name"
  default     = "slo-exporter"
}

variable "function_memory" {
  description = "Memory in MB for the Cloud Function (increases with no. of SLOs)"
  default     = 128
}

variable "region" {
  description = "Region for the App Engine app"
  default     = "us-west"
}
