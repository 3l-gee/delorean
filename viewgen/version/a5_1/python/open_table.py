from qgis.core import QgsProject, QgsExpression, QgsFeatureRequest

layer_id = '[% @layer_id %]'
fid = [% id %] 

layer = QgsProject.instance().mapLayer(layer_id)

expr = QgsExpression(f'"id" = {fid}')
request = QgsFeatureRequest(expr)

features = layer.getFeatures(request)
ids = [f.id() for f in features]

layer.removeSelection()
layer.selectByIds(ids)

iface.showAttributeTable(layer)