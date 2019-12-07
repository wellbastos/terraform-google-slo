## SLO Compact

The `slo-pipeline-compact` submodule is provided to ease up creating SLOs on GCP.

This module is **a simple wrapper** around the SLO [module](../slo) but
provides an easier interface for creation of SLOs, providing a pre-configured
`slo-exporter` configuration, in order to make it easier for users to quickly
create new SLOs.

The modules makes the following assumptions:

- **SLO reports** are exported to **Cloud Pub/Sub**.

- **Metrics backend** to fetch metrics from is `Stackdriver Monitoring`

- **Metrics backend method** is computed based on `metric_type` variable:
  - `metric_type = "gauge"` will trigger the `good_bad_ratio` method and require the `filter_good` (Stackdriver Monitoring filter for good events) and
    `filter_bad` (Stackdriver Monitoring filter for bad events).

  - `metric_type = "distribution"` will trigger the `exponential_distribution_cut` method and require the `filter` (Stackdriver Monitoring filter for the distribution metric) and `good_below_threshold` (to indicate whether good results are located above or below this threshold)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| bigquery\_dataset\_id | BigQuery dataset id (optional) | string | `"slo"` | no |
| bigquery\_delete\_contents\_on\_destroy | BigQuery delete contents on destroy (optional) | string | `"false"` | no |
| bigquery\_project\_id | BigQuery host project id (to write BQ tables) | string | n/a | yes |
| bigquery\_table\_id | BigQuery table id (optional) | string | `"reports"` | no |
| bucket\_name | Name of the bucket to create | string | n/a | yes |
| function\_memory | Memory in MB for the Cloud Function (increases with no. of SLOs) | string | `"128"` | no |
| function\_name | Cloud Function name | string | `"slo-exporter"` | no |
| project\_id | Project id to create SLO infrastructure | string | n/a | yes |
| pubsub\_topic\_name | Pub/Sub topic name | string | `"slo-export-topic"` | no |
| region | Region for the App Engine app | string | `"us-east1"` | no |
| service\_account\_name | Name of the service account to create | string | `"slo-exporter"` | no |
| stackdriver\_host\_project\_id | Stackdriver host project id (to write custom metrics) | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| exporters | Exporter config |
| function\_bucket\_name | Cloud Function bucket name |
| function\_bucket\_object\_name | Cloud Function code GCS object name |
| function\_name | Cloud Function name |
| project\_id | Project id |
| pubsub\_topic\_name | Ingress PubSub topic to SLO pipeline |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
