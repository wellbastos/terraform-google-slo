from slo_generator import compute
import json
import pprint
import base64

with open("exporters.json") as f:
    exporters = json.load(f)['exporters']

def main(data, context):
    data = json.loads(base64.b64decode(data['data']))
    compute.export(data, exporters)
