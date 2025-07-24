from qgis.core import QgsProject 
from qgis.utils import iface
import re

target_parameters = YYYY

# data can be one of:
# - str: a raw string possibly containing a UUID
# - dict: a JSON-like object with nested structures
# - list[dict]: a list of such dicts, each potentially containing a UUID
id = '[% array_to_string(XXXX) %]'

id_list = [i.strip() for i in id.split(',') if i.strip().isdigit()]

if not id_list:
    iface.messageBar().pushInfo("Info", f"No valid ID found in: {id}")
    exit()

id_list_str = ', '.join(id_list)

def get_target_layer(name):
    layers = QgsProject.instance().mapLayersByName(name)
    return layers[0] if layers else None

for param in target_parameters:
    layer = get_target_layer(param["name"])
    if not layer:
        iface.messageBar().pushWarning("Warning", f"Layer '{param['name']}' not found")
        continue
        
    if not id:
        continue
    
    # Build the expression to filter features by UUID
    expression = f'"{param["field"]}" IN ({id_list_str})'

    features_found = False
    for feature in layer.getFeatures(expression):
        features_found = True
        iface.openFeatureForm(layer, feature, False)

    if not features_found:
        iface.messageBar().pushInfo("Info", f"No feature found in layer '{param['name']}' with ID(s): {id_list_str}")
