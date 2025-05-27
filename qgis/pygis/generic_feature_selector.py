from qgis.utils import iface
# The layer to open
layer = QgsProject.instance().mapLayersByName('city_view')[0]

# The expression to select the features
expr = "\"id\" IN ('{}')".format('[%servedcityid%]')

layer.setSubsetString(expr)
iface.showAttributeTable(layer)



from qgis.utils import iface
from PyQt5.QtCore import QTimer
layer = QgsProject.instance().mapLayersByName('airportheliport_publisher_view')[0]

expr = "\"identifier\" IN ('{}')".format('[%regexp_substr(airportheliport_href,'([a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12})')%]')

layer.setSubsetString(expr)
iface.showAttributeTable(layer)

def clear_filter():
    layer.setSubsetString("")

QTimer.singleShot(2000, clear_filter)


from qgis.utils import iface
from qgis.core import QgsProject

layer = QgsProject.instance().mapLayersByName('airportheliport_publisher_view')[0]
uuid = '[%regexp_substr(airportheliport_href,'([a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12})')%]'
feature = next(layer.getFeatures(f'"identifier" = \'{uuid}\''), None)

if feature:
    print(feature)
    iface.openFeatureForm(layer, feature, False)
