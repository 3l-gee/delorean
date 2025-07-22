from qgis.core import QgsProject 
from qgis.utils import iface

import re
import json

# Source field to extract UUID from
source_parameters = {
    "name" : "",
    "field" : "responsibleorganisation",
    "key" : "theorganisationauthority_href"
}

# Target layer info
target_parameter = {
    "name" : "organisationauthority",
    "field" : "identifier",
    "key" : ""
}

data = [%to_json(responsibleorganisation)%]

# --------------------------------------------------------
# Function: extract UUID from JSON field
# --------------------------------------------------------
def get_source_value(data, param):
    raw_value = data.get(param["key"])
    if not raw_value:
        return None
    match = re.search(r'[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}', raw_value, re.IGNORECASE)
    return match.group(0) if match else None

# --------------------------------------------------------
# Function: get QGIS layer by name
# --------------------------------------------------------
def get_target_layer(param):
    layers = QgsProject.instance().mapLayersByName(param["name"])
    return layers[0] if layers else None

uuid = get_source_value(data, source_parameters)
if not uuid:
    print("UUID not found in source data.")

layer = get_target_layer(target_parameter)
if not layer:
    print(f"Layer '{target_parameter['name']}' not found.")

    # Query feature using UUID
expression = f'"{target_parameter["field"]}" = \'{uuid}\''
feature = next(layer.getFeatures(expression), None)

if feature:
    print(f"Found and opening feature with UUID: {uuid}")
    iface.openFeatureForm(layer, feature, False)
else:
    print(f"No feature found in layer with UUID: {uuid}")
