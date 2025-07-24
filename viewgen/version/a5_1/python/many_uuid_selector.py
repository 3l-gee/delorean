from qgis.core import QgsProject 
from qgis.utils import iface
import re
import json

UUID_PATTERN = r'[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}'

target_parameters = YYYY

# data can be one of:
# - str: a raw string possibly containing a UUID
# - dict: a JSON-like object with nested structures
# - list[dict]: a list of such dicts, each potentially containing a UUID
data = '[% to_json(XXXX) %]'

data = json.loads(data)

# Extract UUIDs from href
uuid = []
for item in data:
    if "href" in item:
        match = re.search(UUID_PATTERN, item["href"], re.IGNORECASE)
        if match:
            uuid.append(match.group())

if not uuid:
    iface.messageBar().pushInfo("Info", f"UUID not found in: {data}")
    exit()

uuid_list_str = ', '.join(f"'{u}'" for u in uuid)

def get_target_layer(name):
    layers = QgsProject.instance().mapLayersByName(name)
    return layers[0] if layers else None

for param in target_parameters:
    layer = get_target_layer(param["name"])
    if not layer:
        iface.messageBar().pushWarning("Warning", f"Layer '{param['name']}' not found")
        continue
        
    if not uuid:
        continue

    # Build the expression to filter features by UUID
    expression = f'"{param["field"]}" IN ({uuid_list_str})'

    features_found = False
    for feature in layer.getFeatures(expression):
        features_found = True
        iface.openFeatureForm(layer, feature, False)

    if not features_found:
        iface.messageBar().pushInfo("Info", f"No feature found in layer '{param['name']}' with UUID(s): {uuid_list_str}")
