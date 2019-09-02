from slo_generator import compute
import json
import pprint

with open("error_budget_policy.json") as f:
    error_budget_policy = json.load(f)

with open("slo_config.json") as f:
    slo_config = json.load(f)

def main(data, context):
    print("Running SLO computations:")
    print("SLO Config: %s" % pprint.pformat(slo_config))
    print("Error Budget Policy: %s" % pprint.pformat(error_budget_policy))
    compute.compute(slo_config, error_budget_policy, timestamp=None, client=None)
