ogr2ogr -f "GeoJSON" output.geojson cadas-aimdb-export-20250312084513.aixm5.xml -dsco FORMAT=GMLAS
ogr2ogr -f "GeoJSON" output.geojson GMLAS:cadas-aimdb-export-20250312084513.aixm5.xml
ogr2ogr -f "GPKG" output.gpkg GMLAS:cadas-aimdb-export-20250312084513.aixm5.xml

ogrinfo GMLAS:cadas-aimdb-export-20250312084513.aixm5.xml

ogr2ogr -f "GeoJSON" heliports.geojson GMLAS:cadas-aimdb-export-20250312084513.aixm5.xml airportheliport
ogr2ogr -f "GPKG" output.gpkg GMLAS:cadas-aimdb-export-20250312084513.aixm5.xml -skipfailures

ogr2ogr -f "PostgreSQL" PG:"host=localhost dbname=gdal_aixm  user=postgres password=postgres" GMLAS:cadas-aimdb-export-20250312084513.aixm5.xml -skipfailures
