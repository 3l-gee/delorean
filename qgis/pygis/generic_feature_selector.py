from qgis.utils import iface
# The layer to open
layer = QgsProject.instance().mapLayersByName('city_view')[0]

# The expression to select the features
expr = "\"name\" IN ('{}')".format('[%servedcity%]')

layer.setSubsetString(expr)
iface.showAttributeTable(layer)