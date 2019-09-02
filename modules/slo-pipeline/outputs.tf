output "project_id" {
  value = var.project_id
}

output "pubsub_topic_name" {
  value = google_pubsub_topic.stream.name
}
