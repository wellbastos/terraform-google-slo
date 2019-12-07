## SLO Compact

The `slo-compact` submodule is provided as a way to simplify creating SLOs.

This module is **a simple wrapper** around the SLO [module](../slo) but
provides an easier interface to create SLOs, pre-filling big chunks of the `slo-exporter` configurations.

Unlike the [slo](../slo) module which makes no assumption on which exporters, metrics backend and metrics type you use (and thus is more configurable), the [slo-compact](../slo-compact) module makes the following assumptions:

- **SLO reports** are exported to **Cloud Pub/Sub**. Use `pubsub_topic_name` to name it.

- **Metrics backend** to fetch metrics from is `Stackdriver Monitoring`

- **Metrics backend method** is computed based on `metric_type` variable:
  - `metric_type = "gauge"` will trigger the `good_bad_ratio` method and require the `filter_good` (Stackdriver Monitoring filter for good events) and
    `filter_bad` (Stackdriver Monitoring filter for bad events).

  - `metric_type = "distribution"` will trigger the `exponential_distribution_cut` method and require the `filter` (Stackdriver Monitoring filter for the distribution metric) and `good_below_threshold` (to indicate whether good results are located above or below this threshold)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| description | SLO description | string | n/a | yes |
| feature\_name | SLO feature name | string | n/a | yes |
| filter\_bad | Filter for bad events (required if metric type: gauge) | string | `""` | no |
| filter\_good | Filter for good events (required if metric type: gauge) | string | `""` | no |
| filter\_valid | Filter for valid events (required if metric type: distribution) | string | `""` | no |
| good\_below\_threshold | Good events are located below threshold | bool | `"true"` | no |
| labels | Resource labels | map | `<map>` | no |
| metric\_type | SLO metric type | string | n/a | yes |
| name | SLO name | string | n/a | yes |
| project\_id | Project to deploy the SLO computation on | string | n/a | yes |
| pubsub\_project\_id | Pubsub project id | string | n/a | yes |
| pubsub\_topic\_name | Pubsub topic name | string | n/a | yes |
| region | Region | string | `"us-east1"` | no |
| schedule | SLO Compute Frequency | string | `"* * * * */1"` | no |
| service\_name | SLO service name | string | n/a | yes |
| stackdriver\_host\_project\_id | Stackdriver host project id | string | n/a | yes |
| target | SLO target | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| config | SLO Config |
| project\_id | Project id |
| scheduler\_job\_name | Cloud Scheduler job name |
| service\_account\_email | Service account email used to run the Cloud Function |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
