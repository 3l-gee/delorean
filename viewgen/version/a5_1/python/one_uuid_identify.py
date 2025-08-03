from qgis.core import QgsProject 
from qgis.utils import iface
import re

def get_target_layer(name):
    layers = QgsProject.instance().mapLayersByName(name)
    return layers[0] if layers else None

UUID_PATTERN = r'[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}'

# Target parameters defines the name of the layers in wich the matching uuid / id must be searched
target_parameters = YYYY

# Data is the uuid / id source
data = '[% XXXX %]'

uuid = re.findall(UUID_PATTERN, data, re.IGNORECASE)

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

        features_found = False
        for feature in layer.getFeatures(expression):
            features_found = True
            iface.openFeatureForm(layer, feature, False)

        if not features_found:
            iface.messageBar().pushInfo("Info", f"No feature found in layer '{param['name']}' with UUID(s): {uuid_list_str}")
