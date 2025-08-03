from qgis.core import QgsProject 
from qgis.utils import iface
import re
import json

def get_target_layer(name):
    layers = QgsProject.instance().mapLayersByName(name)
    return layers[0] if layers else None

UUID_PATTERN = r'[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}'

# Target parameters defines the name of the layers in wich the matching uuid / id must be searched
target_parameters = YYYY

# Data is the uuid / id source
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
    iface.messageBar().pushInfo("Info", f"No valid UUID found in: XXXX")

else :
    uuid_list_str = ', '.join(f"'{u}'" for u in uuid)

    for param in target_parameters:
        layer = get_target_layer(param["name"])
        if not layer:
            iface.messageBar().pushWarning("Warning", f"Layer '{param['name']}' not found")
            continue
            
        # Build the expression to filter features by UUID
        expression = f'"{param["field"]}" IN ({uuid_list_str})'

        # Apply selection
        layer.removeSelection()
        layer.selectByExpression(expression)
        iface.showAttributeTable(layer)
