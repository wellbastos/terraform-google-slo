variable "project_id" {
  description = "SLO project id"
}

variable "name" {
  description = "SLO name"
}

variable "description" {
  description = "SLO description"
}

variable "service_name" {
  description = "Name of monitored service"
}

variable "feature_name" {
  description = "Name of monitored feature"
}

variable "target" {
  description = "Target for this SLO"
}

variable "backend_class" {
  description = "SLO backend class"
  default     = "Stackdriver"
}

variable "backend_project_id" {
  description = "Project id for the metrics backend"
}

variable "backend_method" {
  description = "SLO computation method"
}

variable "backend_measurement" {
  description = "SLO measurement config"
  type = map(string)
}

variable "region" {
  description = "Region"
}

variable "schedule" {
  description = "Cron-like schedule"
  default     = "* * * * */1"
}

variable "pubsub_project_id" {
  description = "Pub/Sub project id to send results to"
}

variable "pubsub_topic_name" {
  description = "Pub/Sub topic name to send results to"
}

variable "labels" {
  description = "Labels to apply to all resources created"
}
