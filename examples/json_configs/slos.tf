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

locals {
  // Load JSON files to Terraform format and pass them directly to the SLO
  // module. Allows to keep configs and code separated, and simplifies code.
  configs = [
    for number in [1, 2, 3] :
    jsonencode(file("${path.module}/configs/slo_test${number}.json"))
  ]
}

module "slo-1" {
  source     = "../../modules/slo"
  project_id = var.project_id
  config     = local.configs[0]
}
#
# module "slo-2" {
#   source     = "../../modules/slo"
#   project_id = var.project_id
#   config     = local.configs[1]
# }
#
# module "slo-3" {
#   source     = "../../modules/slo"
#   project_id = var.project_id
#   config     = local.configs[2]
# }
