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
from qgis.core import QgsPointXY, QgsProject
from qgis.gui import QgsMapToolIdentify

layer = QgsProject.instance().mapLayersByName('airportheliport_publisher_view')[0]
uuid = '[%regexp_substr(airportheliport_href,'([a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12})')%]'
geom = 
feature = next(layer.getFeatures(f'"identifier" = \'{uuid}\''), None)

if feature:
    point = feature.geometry().centroid().asPoint()
    identify_tool = QgsMapToolIdentify(iface.mapCanvas())
    results = identify_tool.identify(QgsPointXY(point), [layer], QgsMapToolIdentify.TopDownStopAtFirst)
    iface.identifyResultsDialog().addResults(results)
    iface.identifyResultsDialog().show()
