from qgis.core import QgsProject 
from qgis.utils import iface
import re

def get_target_layer(name):
    layers = QgsProject.instance().mapLayersByName(name)
    return layers[0] if layers else None

# Target parameters defines the name of the layers in wich the matching uuid / id must be searched
target_parameters = YYYY

# Data is the uuid / id source
id = '[% XXXX %]'

if not id:
    iface.messageBar().pushInfo("Info", f"No valid ID found in: XXXX")

else :
    for param in target_parameters:
        layer = get_target_layer(param["name"])
        if not layer:
            iface.messageBar().pushWarning("Warning", f"Layer '{param['name']}' not found")
            continue
        
        # Build the expression to filter features by UUID
        expression = f'"{param["field"]}" IN ({id})'

        # Apply selection
        layer.removeSelection()
        layer.selectByExpression(expression)
        iface.showAttributeTable(layer)
