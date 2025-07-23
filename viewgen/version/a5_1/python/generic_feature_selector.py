from qgis.core import QgsProject 
from qgis.utils import iface

import re
import json

UUID_PATTERN = r'[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}'

# Source field to extract UUID from
source_parameters = {
    "name" : "",
    "field" : "responsibleorganisation",
    "key" : None
}

# Target layer info
target_parameter = {
    "name" : "organisationauthority",
    "field" : "identifier",
    "key" : ""
}

data = [%to_json(theorganisationauthority_href)%]

# --------------------------------------------------------
# Function: extract UUID from JSON field
# --------------------------------------------------------
def get_source_value(data, param):
    key = param.get("key", None)

    def extract_uuid(val):
        if isinstance(val, str):
            match = re.search(UUID_PATTERN, val, re.IGNORECASE)
            return match.group(0) if match else None
        elif isinstance(val, dict):
            for v in val.values():
                uuid = extract_uuid(v)
                if uuid:
                    return uuid
        elif isinstance(val, list):
            for item in val:
                uuid = extract_uuid(item)
                if uuid:
                    return uuid
        return None

    # If key is None, use data directly
    if key is None:
        return extract_uuid(data)

    # If key is set, look for that key in a dict
    if isinstance(data, dict):
        value = data.get(key)
        return extract_uuid(value)

    return None

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
