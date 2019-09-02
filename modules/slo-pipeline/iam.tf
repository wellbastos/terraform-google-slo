resource "google_service_account" "main" {
  account_id   = "slo-exporter"
  project      = var.project_id
  display_name = "Service account for SLO export"
}

resource "google_project_iam_member" "bigquery" {
  project = var.bigquery_project_id
  role    = "roles/bigquery.dataEditor"
  member  = "serviceAccount:${google_service_account.main.email}"
}

resource "google_project_iam_member" "stackdriver" {
  project = var.stackdriver_host_project_id
  role    = "roles/monitoring.metricWriter"
  member  = "serviceAccount:${google_service_account.main.email}"
}
