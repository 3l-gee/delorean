from qgis.utils import iface
from qgis.core import QgsProject

layer = QgsProject.instance().mapLayersByName('airportheliport_publisher_view')[0]
uuid = '[%regexp_substr(airportheliport_href,'([a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12})')%]'
feature = next(layer.getFeatures(f'"identifier" = \'{uuid}\''), None)

if feature:
    iface.openFeatureForm(layer, feature, False)
