<?xml version='1.0' encoding='utf-8'?>
<qgis saveDateTime="2025-05-24T10:35:00" projectname="" version="3.34.8-Prizren" saveUser="3l-gee" saveUserFull="Raphael Gerth">
	<homePath path="" />
	
	<title>${ProjectConfig.title}</title>
	<transaction mode="Disabled" />
	<projectFlags set="" />
	<projectCrs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>PROJCRS["WGS 84 / Pseudo-Mercator",BASEGEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],ID["EPSG",4326]],CONVERSION["Popular Visualisation Pseudo-Mercator",METHOD["Popular Visualisation Pseudo Mercator",ID["EPSG",1024]],PARAMETER["Latitude of natural origin",0,ANGLEUNIT["degree",0.0174532925199433],ID["EPSG",8801]],PARAMETER["Longitude of natural origin",0,ANGLEUNIT["degree",0.0174532925199433],ID["EPSG",8802]],PARAMETER["False easting",0,LENGTHUNIT["metre",1],ID["EPSG",8806]],PARAMETER["False northing",0,LENGTHUNIT["metre",1],ID["EPSG",8807]]],CS[Cartesian,2],AXIS["easting (X)",east,ORDER[1],LENGTHUNIT["metre",1]],AXIS["northing (Y)",north,ORDER[2],LENGTHUNIT["metre",1]],USAGE[SCOPE["Web mapping and visualisation."],AREA["World between 85.06°S and 85.06°N."],BBOX[-85.06,-180,85.06,180]],ID["EPSG",3857]]</wkt>
			<proj4>+proj=merc +a=6378137 +b=6378137 +lat_ts=0 +lon_0=0 +x_0=0 +y_0=0 +k=1 +units=m +nadgrids=@null +wktext +no_defs</proj4>
			<srsid>3857</srsid>
			<srid>3857</srid>
			<authid>EPSG:3857</authid>
			<description>WGS 84 / Pseudo-Mercator</description>
			<projectionacronym>merc</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>false</geographicflag>
		</spatialrefsys>
	</projectCrs>
	<layer-tree-group>
		<customproperties>
			<Option />
		</customproperties>
		<layer-tree-layer expanded="1" patch_size="-1,-1" legend_split_behavior="0" source="crs=EPSG:3857&amp;format&amp;type=xyz&amp;url=https://tile.openstreetmap.org/%7Bz%7D/%7Bx%7D/%7By%7D.png&amp;zmax=19&amp;zmin=0" legend_exp="" id="_556bb755_1006_4e99_869c_27c4a486ea49" providerKey="wms" checked="Qt::Checked" name="OpenStreetMap">
			<customproperties>
				<Option />
			</customproperties>
		</layer-tree-layer>
		<custom-order enabled="0">
			<item>_556bb755_1006_4e99_869c_27c4a486ea49</item>
		</custom-order>
	</layer-tree-group>
	<snapping-settings minScale="0" tolerance="12" maxScale="0" mode="2" intersection-snapping="0" self-snapping="0" scaleDependencyMode="0" unit="1" enabled="0" type="1">
		<individual-layer-settings />
	</snapping-settings>
	<mapcanvas name="theMapCanvas" annotationsVisible="1">
		<units>degrees</units>
		<extent>
			<xmin>-48571049.74950133264064789</xmin>
			<ymin>-24770245.39856681972742081</ymin>
			<xmax>75886778.52223052084445953</xmax>
			<ymax>22594549.50639381259679794</ymax>
		</extent>
		<rotation>0</rotation>
		<destinationsrs>
			<spatialrefsys nativeFormat="Wkt">
				<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
				<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
				<srsid>3452</srsid>
				<srid>4326</srid>
				<authid>EPSG:4326</authid>
				<description>WGS 84</description>
				<projectionacronym>longlat</projectionacronym>
				<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
				<geographicflag>true</geographicflag>
			</spatialrefsys>
		</destinationsrs>
		<rendermaptile>0</rendermaptile>
		<expressionContextScope />
	</mapcanvas>
	<legend updateDrawingOrder="true">
		<legendlayer open="true" showFeatureCount="0" drawingOrder="-1" checked="Qt::Checked" name="OpenStreetMap">
			<filegroup open="true" hidden="false">
				<legendlayerfile layerid="_556bb755_1006_4e99_869c_27c4a486ea49" isInOverview="0" visible="1" />
			</filegroup>
		</legendlayer>
	</legend>
	<projectlayers>
		<maplayer legendPlaceholderImage="" styleCategories="AllStyleCategories" minScale="1e+08" maxScale="0" hasScaleBasedVisibilityFlag="0" autoRefreshMode="Disabled" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" type="raster" autoRefreshTime="0">
			<extent>
				<xmin>-20037508.34278924390673637</xmin>
				<ymin>-20037508.34278924763202667</ymin>
				<xmax>20037508.34278924390673637</xmax>
				<ymax>20037508.34278924763202667</ymax>
			</extent>
			<wgs84extent>
				<xmin>-180</xmin>
				<ymin>-85.05112877980660357</ymin>
				<xmax>179.99999999999997158</xmax>
				<ymax>85.05112877980660357</ymax>
			</wgs84extent>
			<id>_556bb755_1006_4e99_869c_27c4a486ea49</id>
			<datasource>crs=EPSG:3857&amp;format&amp;type=xyz&amp;url=https://tile.openstreetmap.org/%7Bz%7D/%7Bx%7D/%7By%7D.png&amp;zmax=19&amp;zmin=0</datasource>
			<keywordList>
				<value />
			</keywordList>
			<layername>OpenStreetMap</layername>
			<srs>
				<spatialrefsys nativeFormat="Wkt">
					<wkt>PROJCRS["WGS 84 / Pseudo-Mercator",BASEGEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],ID["EPSG",4326]],CONVERSION["Popular Visualisation Pseudo-Mercator",METHOD["Popular Visualisation Pseudo Mercator",ID["EPSG",1024]],PARAMETER["Latitude of natural origin",0,ANGLEUNIT["degree",0.0174532925199433],ID["EPSG",8801]],PARAMETER["Longitude of natural origin",0,ANGLEUNIT["degree",0.0174532925199433],ID["EPSG",8802]],PARAMETER["False easting",0,LENGTHUNIT["metre",1],ID["EPSG",8806]],PARAMETER["False northing",0,LENGTHUNIT["metre",1],ID["EPSG",8807]]],CS[Cartesian,2],AXIS["easting (X)",east,ORDER[1],LENGTHUNIT["metre",1]],AXIS["northing (Y)",north,ORDER[2],LENGTHUNIT["metre",1]],USAGE[SCOPE["Web mapping and visualisation."],AREA["World between 85.06°S and 85.06°N."],BBOX[-85.06,-180,85.06,180]],ID["EPSG",3857]]</wkt>
					<proj4>+proj=merc +a=6378137 +b=6378137 +lat_ts=0 +lon_0=0 +x_0=0 +y_0=0 +k=1 +units=m +nadgrids=@null +wktext +no_defs</proj4>
					<srsid>3857</srsid>
					<srid>3857</srid>
					<authid>EPSG:3857</authid>
					<description>WGS 84 / Pseudo-Mercator</description>
					<projectionacronym>merc</projectionacronym>
					<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
					<geographicflag>false</geographicflag>
				</spatialrefsys>
			</srs>
			<resourceMetadata>
				<identifier>OpenStreetMap tiles</identifier>
				<parentidentifier />
				<language />
				<type>dataset</type>
				<title>OpenStreetMap tiles</title>
				<abstract>OpenStreetMap is built by a community of mappers that contribute and maintain data about roads, trails, cafés, railway stations, and much more, all over the world.</abstract>
				<links>
					<link mimeType="" size="" description="" name="Source" type="WWW:LINK" format="" url="https://www.openstreetmap.org/" />
				</links>
				<dates />
				<fees />
				<rights>Base map and data from OpenStreetMap and OpenStreetMap Foundation (CC-BY-SA). © https://www.openstreetmap.org and contributors.</rights>
				<license>Open Data Commons Open Database License (ODbL)</license>
				<license>Creative Commons Attribution-ShareAlike (CC-BY-SA)</license>
				<encoding />
				<crs>
					<spatialrefsys nativeFormat="Wkt">
						<wkt>PROJCRS["WGS 84 / Pseudo-Mercator",BASEGEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],ID["EPSG",4326]],CONVERSION["Popular Visualisation Pseudo-Mercator",METHOD["Popular Visualisation Pseudo Mercator",ID["EPSG",1024]],PARAMETER["Latitude of natural origin",0,ANGLEUNIT["degree",0.0174532925199433],ID["EPSG",8801]],PARAMETER["Longitude of natural origin",0,ANGLEUNIT["degree",0.0174532925199433],ID["EPSG",8802]],PARAMETER["False easting",0,LENGTHUNIT["metre",1],ID["EPSG",8806]],PARAMETER["False northing",0,LENGTHUNIT["metre",1],ID["EPSG",8807]]],CS[Cartesian,2],AXIS["easting (X)",east,ORDER[1],LENGTHUNIT["metre",1]],AXIS["northing (Y)",north,ORDER[2],LENGTHUNIT["metre",1]],USAGE[SCOPE["Web mapping and visualisation."],AREA["World between 85.06°S and 85.06°N."],BBOX[-85.06,-180,85.06,180]],ID["EPSG",3857]]</wkt>
						<proj4>+proj=merc +a=6378137 +b=6378137 +lat_ts=0 +lon_0=0 +x_0=0 +y_0=0 +k=1 +units=m +nadgrids=@null +wktext +no_defs</proj4>
						<srsid>3857</srsid>
						<srid>3857</srid>
						<authid>EPSG:3857</authid>
						<description>WGS 84 / Pseudo-Mercator</description>
						<projectionacronym>merc</projectionacronym>
						<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
						<geographicflag>false</geographicflag>
					</spatialrefsys>
				</crs>
				<extent>
					<spatial minz="nan" miny="-85.05112877980660357" crs="EPSG:4326" minx="-180" maxy="85.05112877980660357" dimensions="2" maxx="180" maxz="nan" />
				</extent>
			</resourceMetadata>
			<provider>wms</provider>
			<noData>
				<noDataList bandNo="1" useSrcNoData="0" />
			</noData>
			<map-layer-style-manager current="default">
				<map-layer-style name="default" />
			</map-layer-style-manager>
			<metadataUrls />
			<flags>
				<Identifiable>1</Identifiable>
				<Removable>1</Removable>
				<Searchable>0</Searchable>
				<Private>0</Private>
			</flags>
			<temporal fetchMode="0" mode="0" enabled="0">
				<fixedRange>
					<start />
					<end />
				</fixedRange>
			</temporal>
			<elevation zoffset="0" symbology="Line" zscale="1" band="1" enabled="0">
				<data-defined-properties>
					<Option type="Map">
						<Option name="name" type="QString" value="" />
						<Option name="properties" />
						<Option name="type" type="QString" value="collection" />
					</Option>
				</data-defined-properties>
				<profileLineSymbol>
					<symbol alpha="1" frame_rate="10" clip_to_extent="1" name="" is_animated="0" type="line" force_rhr="0">
						<data_defined_properties>
							<Option type="Map">
								<Option name="name" type="QString" value="" />
								<Option name="properties" />
								<Option name="type" type="QString" value="collection" />
							</Option>
						</data_defined_properties>
						<layer locked="0" id="{274c1acb-b92f-4cd1-9b6d-d6d6dde97eb1}" pass="0" class="SimpleLine" enabled="1">
							<Option type="Map">
								<Option name="align_dash_pattern" type="QString" value="0" />
								<Option name="capstyle" type="QString" value="square" />
								<Option name="customdash" type="QString" value="5;2" />
								<Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0" />
								<Option name="customdash_unit" type="QString" value="MM" />
								<Option name="dash_pattern_offset" type="QString" value="0" />
								<Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0" />
								<Option name="dash_pattern_offset_unit" type="QString" value="MM" />
								<Option name="draw_inside_polygon" type="QString" value="0" />
								<Option name="joinstyle" type="QString" value="bevel" />
								<Option name="line_color" type="QString" value="243,166,178,255" />
								<Option name="line_style" type="QString" value="solid" />
								<Option name="line_width" type="QString" value="0.6" />
								<Option name="line_width_unit" type="QString" value="MM" />
								<Option name="offset" type="QString" value="0" />
								<Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0" />
								<Option name="offset_unit" type="QString" value="MM" />
								<Option name="ring_filter" type="QString" value="0" />
								<Option name="trim_distance_end" type="QString" value="0" />
								<Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0" />
								<Option name="trim_distance_end_unit" type="QString" value="MM" />
								<Option name="trim_distance_start" type="QString" value="0" />
								<Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0" />
								<Option name="trim_distance_start_unit" type="QString" value="MM" />
								<Option name="tweak_dash_pattern_on_corners" type="QString" value="0" />
								<Option name="use_custom_dash" type="QString" value="0" />
								<Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0" />
							</Option>
							<data_defined_properties>
								<Option type="Map">
									<Option name="name" type="QString" value="" />
									<Option name="properties" />
									<Option name="type" type="QString" value="collection" />
								</Option>
							</data_defined_properties>
						</layer>
					</symbol>
				</profileLineSymbol>
				<profileFillSymbol>
					<symbol alpha="1" frame_rate="10" clip_to_extent="1" name="" is_animated="0" type="fill" force_rhr="0">
						<data_defined_properties>
							<Option type="Map">
								<Option name="name" type="QString" value="" />
								<Option name="properties" />
								<Option name="type" type="QString" value="collection" />
							</Option>
						</data_defined_properties>
						<layer locked="0" id="{10bffc71-c5eb-489e-b31b-97f0143ab092}" pass="0" class="SimpleFill" enabled="1">
							<Option type="Map">
								<Option name="border_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0" />
								<Option name="color" type="QString" value="243,166,178,255" />
								<Option name="joinstyle" type="QString" value="bevel" />
								<Option name="offset" type="QString" value="0,0" />
								<Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0" />
								<Option name="offset_unit" type="QString" value="MM" />
								<Option name="outline_color" type="QString" value="35,35,35,255" />
								<Option name="outline_style" type="QString" value="no" />
								<Option name="outline_width" type="QString" value="0.26" />
								<Option name="outline_width_unit" type="QString" value="MM" />
								<Option name="style" type="QString" value="solid" />
							</Option>
							<data_defined_properties>
								<Option type="Map">
									<Option name="name" type="QString" value="" />
									<Option name="properties" />
									<Option name="type" type="QString" value="collection" />
								</Option>
							</data_defined_properties>
						</layer>
					</symbol>
				</profileFillSymbol>
			</elevation>
			<customproperties>
				<Option type="Map">
					<Option name="identify/format" type="QString" value="Undefined" />
				</Option>
			</customproperties>
			<mapTip enabled="1" />
			<pipe-data-defined-properties>
				<Option type="Map">
					<Option name="name" type="QString" value="" />
					<Option name="properties" />
					<Option name="type" type="QString" value="collection" />
				</Option>
			</pipe-data-defined-properties>
			<pipe>
				<provider>
					<resampling maxOversampling="2" zoomedOutResamplingMethod="nearestNeighbour" enabled="false" zoomedInResamplingMethod="nearestNeighbour" />
				</provider>
				<rasterrenderer nodataColor="" alphaBand="-1" band="1" opacity="1" type="singlebandcolordata">
					<rasterTransparency />
					<minMaxOrigin>
						<limits>None</limits>
						<extent>WholeRaster</extent>
						<statAccuracy>Estimated</statAccuracy>
						<cumulativeCutLower>0.02</cumulativeCutLower>
						<cumulativeCutUpper>0.98</cumulativeCutUpper>
						<stdDevFactor>2</stdDevFactor>
					</minMaxOrigin>
				</rasterrenderer>
				<brightnesscontrast gamma="1" contrast="0" brightness="0" />
				<huesaturation colorizeOn="0" colorizeBlue="128" invertColors="0" colorizeStrength="100" colorizeRed="255" colorizeGreen="128" saturation="0" grayscaleMode="0" />
				<rasterresampler maxOversampling="2" />
				<resamplingStage>resamplingFilter</resamplingStage>
			</pipe>
			<blendMode>0</blendMode>
		</maplayer>
	<maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>aerialrefuellingtrack_43300762-6739-41e1-8ce6-959a14f8eb1c</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="aerial_refuelling"."aerialrefuellingtrack"" (geometry_curve_view_wjduhr)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>proceduretransition_19af2d42-12b1-41fb-868c-d3aa36d05110</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="procedure"."proceduretransition"" (geometry_curve_view_hqolvu)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>lightelement_47782b0b-0bab-488e-bcce-2287e46173b6</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="shared"."lightelement"" (geometry_elevatedpoint_view_fwtxva)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>reflector_9da361a9-907e-47d0-9378-6803649fafa3</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="surveillance"."reflector"" (geometry_elevatedpoint_view_duuqof)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>markingelement_cabf6aeb-fb58-4db0-8075-f4520a3d6047</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="airport_heliport"."markingelement"" (geometry_elevatedsurface_view_jqjrjd)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>markingelement_8bb64008-e4c9-482d-a68b-1d1eec2fe279</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="airport_heliport"."markingelement"" (geometry_elevatedcurve_view_wryzec)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>markingelement_8514e7f2-8195-45c0-8a6b-a54e967ffdc5</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="airport_heliport"."markingelement"" (geometry_elevatedpoint_view_yzammv)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>surfacecontaminationlayer_b8e8c15e-ab93-4c4c-b279-2704c69f9fc6</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="airport_heliport"."surfacecontaminationlayer"" (geometry_elevatedsurface_view_odjatt)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>aerialrefuellingpoint_c1018a27-4380-498b-8747-1b859872507b</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="aerial_refuelling"."aerialrefuellingpoint"" (geometry_point_view_lwdurs)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>directflightsegment_b1a3b98b-9f5a-4a44-9ad8-1c51bfd74845</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="routes"."directflightsegment"" (geometry_point_view_nqmuzy)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>directflightsegment_fa099205-3e2b-4a02-8d76-4c99eff18e90</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="routes"."directflightsegment"" (geometry_point_view_sacifr)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>enroutesegmentpoint_a80ba2a9-c7bb-40a0-9f99-878644245dbe</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="navaids_points"."enroutesegmentpoint"" (geometry_point_view_vgpvzc)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>flightconditionelement_dce56464-e0b9-4ab5-aa6f-e33ca7af6b68</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="routes"."flightconditionelement"" (geometry_point_view_ziukli)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>flightroutingelement_1852997b-535c-4602-ba15-b88eac2da6dd</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="routes"."flightroutingelement"" (geometry_point_view_iogwlt)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>routeportion_7458b6a5-535c-42ff-a1e7-4cb1a4407734</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="routes"."routeportion"" (geometry_point_view_iijtiw)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>routeportion_2d2cb64b-abbc-4ba1-9e4f-3f987cfd20e2</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="routes"."routeportion"" (geometry_point_view_evnijc)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>routeportion_3095e052-477a-46ed-a7a1-8e5e90ddaa29</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="routes"."routeportion"" (geometry_point_view_ogtwhp)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>terminalsegmentpoint_df55a7b1-f367-4f96-8158-088acebd0dcf</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="navaids_points"."terminalsegmentpoint"" (geometry_point_view_fecsbf)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>aerialrefuellinganchor_15c480d4-1bfd-4b8c-befc-4d937151d0d3</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="aerial_refuelling"."aerialrefuellinganchor"" (geometry_surface_view_fpiqov)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>airspacevolume_8af93bf9-10f8-4636-9086-fed6c4d2f5d4</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="airspace"."airspacevolume"" (geometry_surface_view_mdybjn)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>airspacevolume_9de7e8c1-54c5-4bb7-ad84-392320bd5367</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="airspace"."airspacevolume"" (geometry_curve_view_pbxmzt)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>navigationareasector_c33bbb56-63b3-474d-80be-47810c3901ff</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="procedure"."navigationareasector"" (geometry_surface_view_oouqxy)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>obstacleassessmentarea_8266ab13-6685-470c-9630-c07d31176715</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="shared"."obstacleassessmentarea"" (geometry_surface_view_znzbzy)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>obstacleassessmentarea_5aacb239-88be-475c-9baa-95f0ed4dc302</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="shared"."obstacleassessmentarea"" (geometry_curve_view_mkukhi)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>pointreference_efc51308-4af4-4264-88d6-876c2be7fafc</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="navaids_points"."pointreference"" (geometry_surface_view_qbdcce)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>safealtitudeareasector_0daa94be-c5c5-49ae-ad92-cbf9dc7e73b6</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="procedure"."safealtitudeareasector"" (geometry_surface_view_cmcyse)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>terminalarrivalareasector_7693c8be-8292-430c-9e0e-e3683c4c69dc</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="procedure"."terminalarrivalareasector"" (geometry_surface_view_gbqczq)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>circlingrestriction_86cbc22f-46b3-4ffe-a04a-d4a1e5d647b9</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="procedure"."circlingrestriction"" (geometry_surface_view_peuymk)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>verticalstructurepart_a98c0fab-5a43-4d37-a1ed-80a92050a86c</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="obstacles"."verticalstructurepart"" (geometry_elevatedpoint_view_tfxufm)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>verticalstructurepart_fd036416-8999-4a9b-8b8b-098d6fa18b7d</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="obstacles"."verticalstructurepart"" (geometry_elevatedcurve_view_gbcfer)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>verticalstructurepart_24ccc869-4bbf-4dc8-ad71-4c560a3c8f29</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="obstacles"."verticalstructurepart"" (geometry_elevatedsurface_view_yzydoy)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>aeronauticalgroundlight_01531dd6-4be6-49b5-b10f-787174e205f2</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="navaids_points"."aeronauticalgroundlight"" (geometry_elevatedpoint_view_ypihgt)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>aircraftgroundservice_68e2b2fd-7550-4c64-b71d-cead36023c45</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="service"."aircraftgroundservice"" (geometry_elevatedpoint_view_iuhplc)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>aircraftstand_e519fb89-bce8-4ce3-90fd-dfb3dd7be8e1</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="airport_heliport"."aircraftstand"" (geometry_elevatedpoint_view_fnlygy)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>aircraftstand_6bb954be-7502-4585-bd0b-bc4273696240</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="airport_heliport"."aircraftstand"" (geometry_elevatedsurface_view_ovktsp)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>airportclearanceservice_60e7ad86-574b-40bd-89fc-8675a7ca9637</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="service"."airportclearanceservice"" (geometry_elevatedpoint_view_muifvh)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>airportheliport_4ff25942-be9f-49eb-aa25-c3e0842e9021</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="airport_heliport"."airportheliport"" (geometry_elevatedpoint_view_tiodbt)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>airportheliport_47cdd89f-c1f4-49ed-a4e7-345d7a9518cb</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="airport_heliport"."airportheliport"" (geometry_elevatedsurface_view_hghxle)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>airporthotspot_e61c555c-9fa4-4ab0-a6e9-adfbbf2cff33</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="airport_heliport"."airporthotspot"" (geometry_elevatedsurface_view_kmtpcf)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>airportsuppliesservice_59b9923f-5c78-40fc-a058-00c911231baf</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="service"."airportsuppliesservice"" (geometry_elevatedpoint_view_bjyusl)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>airtrafficcontrolservice_a2324957-d351-4ad0-919b-73b0baeb19f0</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="service"."airtrafficcontrolservice"" (geometry_elevatedpoint_view_kxrume)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>airtrafficmanagementservice_e3d64f16-0285-43d7-a812-7a2943248341</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="service"."airtrafficmanagementservice"" (geometry_elevatedpoint_view_mxxvdi)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>angleindication_6620f697-fc14-413c-af38-caaed8cb5d8d</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="navaids_points"."angleindication"" (geometry_point_view_rbmkgw)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>apronelement_ef797e52-3269-4d92-a776-6500894a1942</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="airport_heliport"."apronelement"" (geometry_elevatedsurface_view_sdmpqs)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>arrestinggear_ea1ff72b-640d-44a4-86ea-09a14ac247c7</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="airport_heliport"."arrestinggear"" (geometry_elevatedcurve_view_hevufp)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>arrestinggear_9ce4bed4-1c3f-499e-9603-e420747bb438</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="airport_heliport"."arrestinggear"" (geometry_elevatedsurface_view_vaoglw)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>arrestinggear_f439d0f0-ee07-4a80-a136-d3fcc645c6a0</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="airport_heliport"."arrestinggear"" (geometry_elevatedpoint_view_fxumaq)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>arrivalfeederleg_48540f3a-d6d1-4030-891b-97ecc1977531</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="procedure"."arrivalfeederleg"" (geometry_curve_view_ixjugu)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>arrivalleg_25033bb2-15a1-43fa-a4e7-614c40222bd4</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="procedure"."arrivalleg"" (geometry_curve_view_arjkuv)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>azimuth_266d5427-4cce-4240-8b16-2568a5b607b6</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="navaids_points"."azimuth"" (geometry_elevatedpoint_view_kvjbff)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>changeoverpoint_b2032a3b-68f2-48ef-89bd-d60e2c98b79e</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="routes"."changeoverpoint"" (geometry_point_view_skntxw)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>checkpointins_54dcf38c-c24b-4feb-999d-c998e00c7120</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="navaids_points"."checkpointins"" (geometry_elevatedpoint_view_hopsro)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>checkpointvor_fe5b626b-20d8-48fc-8816-e3e1f2319ba9</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="navaids_points"."checkpointvor"" (geometry_elevatedpoint_view_vtmmqy)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>circlingarea_c9b15402-f2d5-400c-8cdf-0be81a3cfc73</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="public"."circlingarea"" (geometry_surface_view_aycluw)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>deicingarea_7a6075ec-04a1-49a4-8fb5-938d4bbae2d6</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="airport_heliport"."deicingarea"" (geometry_elevatedsurface_view_qgzbtn)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>departureleg_a560756c-740e-4cab-9dea-a744583a5f09</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="procedure"."departureleg"" (geometry_curve_view_xmfhcv)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>designatedpoint_90723e41-5f88-412c-b147-3710d66b5642</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="navaids_points"."designatedpoint"" (geometry_point_view_xwiyup)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>directionfinder_fe0328eb-1f27-48ee-be1f-88c0c3a63542</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="navaids_points"."directionfinder"" (geometry_elevatedpoint_view_hzsktz)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>distanceindication_6e92b568-1f05-4493-a6cd-cced93bb3ab2</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="navaids_points"."distanceindication"" (geometry_point_view_syyrjc)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>dme_c783341a-838b-4310-99fc-d65029acb6c9</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="navaids_points"."dme"" (geometry_elevatedpoint_view_eyexeg)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>elevation_49eb02e3-10d6-4d6a-81e7-aac6da3bf5fb</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="navaids_points"."elevation"" (geometry_elevatedpoint_view_kywqpg)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>finalleg_f36bc34a-68d6-4a69-9f34-320e235abf9b</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="procedure"."finalleg"" (geometry_curve_view_evugsr)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>finalleg_ec26ea9a-42b3-4799-84cc-47279c56befe</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="procedure"."finalleg"" (geometry_point_view_xcugmt)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>firefightingservice_2a121b5a-68e0-4d0f-a6ec-32f6d6e112b5</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="service"."firefightingservice"" (geometry_elevatedpoint_view_kknnsb)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>floatingdocksite_7f49a631-d15e-4730-b356-c19a3a8f1cf4</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="airport_heliport"."floatingdocksite"" (geometry_elevatedsurface_view_nhsqyy)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>geoborder_9504f481-b01d-451f-842a-8a655b5ffa99</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="airspace"."geoborder"" (geometry_curve_view_ghgepi)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>glidepath_c0bbf482-1142-4712-bf80-5eb8db0c5c45</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="navaids_points"."glidepath"" (geometry_elevatedpoint_view_obirza)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>groundtrafficcontrolservice_608950a0-ad4b-468a-8ca4-354686744353</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="service"."groundtrafficcontrolservice"" (geometry_elevatedpoint_view_afkvmz)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>guidanceline_8ce37e82-b9eb-4fb4-9f7c-9350416afdc7</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="airport_heliport"."guidanceline"" (geometry_elevatedcurve_view_iqanmv)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>holdingpattern_ff70489d-f71b-40a7-a38d-8fa50a3041f5</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="holding"."holdingpattern"" (geometry_curve_view_ijiwuk)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>informationservice_ca9e82f6-e351-40fc-a7d5-88db6e00ddad</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="service"."informationservice"" (geometry_elevatedpoint_view_pamfwf)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>initialleg_5482b580-3381-4d90-8951-f46c26698cef</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="procedure"."initialleg"" (geometry_curve_view_kjegjf)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>intermediateleg_97963d87-f7e8-4e56-adeb-789fc74ca39c</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="procedure"."intermediateleg"" (geometry_curve_view_cacfcc)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>localizer_75ac5a14-cc90-4a10-8cee-91c0fe459a60</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="navaids_points"."localizer"" (geometry_elevatedpoint_view_kjvzjb)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>markerbeacon_49265efd-7976-4517-a241-0ed5c5180e98</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="navaids_points"."markerbeacon"" (geometry_elevatedpoint_view_zbqxab)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>markingbuoy_09b809b0-9f59-4edc-940b-5ac81b5d37a8</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="airport_heliport"."markingbuoy"" (geometry_elevatedpoint_view_mpvjzq)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>missedapproachleg_13dba6de-e478-46f8-85ee-936f1076f46a</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="procedure"."missedapproachleg"" (geometry_curve_view_ibahia)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>navaid_670aae55-169d-4f1a-a2ab-2a761fcb9269</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="navaids_points"."navaid"" (geometry_elevatedpoint_view_aptpju)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>navigationarea_29eb19f9-5df1-46c5-9f88-29e44b2beb3f</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="procedure"."navigationarea"" (geometry_point_view_hniryp)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>ndb_95b79346-f3a5-45d9-be09-b4f7e7c9995e</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="navaids_points"."ndb"" (geometry_elevatedpoint_view_tsnkfm)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>nonmovementarea_40586af7-0b22-47e6-9cbc-a3ef457ab167</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="airport_heliport"."nonmovementarea"" (geometry_elevatedsurface_view_bwxmhd)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>obstaclearea_ab61ea09-c7d7-4463-b3c8-7c0dd525fde2</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="obstacles"."obstaclearea"" (geometry_surface_view_nuyowm)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>passengerloadingbridge_62751018-fded-4677-afef-1befd7e1f2a3</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="airport_heliport"."passengerloadingbridge"" (geometry_elevatedsurface_view_gmgaif)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>passengerservice_5d0605e7-56f6-4dc7-8ee1-a4ebf4139ab3</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="service"."passengerservice"" (geometry_elevatedpoint_view_frmoyt)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>precisionapproachradar_ea52b1a6-07cc-4f05-874e-384d534d1216</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="surveillance"."precisionapproachradar"" (geometry_elevatedpoint_view_acjymu)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>primarysurveillanceradar_2e1a2729-9992-4590-8dd5-9b929a3fbb88</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="surveillance"."primarysurveillanceradar"" (geometry_elevatedpoint_view_yuyekn)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>radarsystem_2bdc7144-8a18-4551-8a4a-51b9549e4d3e</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="surveillance"."radarsystem"" (geometry_elevatedpoint_view_poqqrm)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>radiocommunicationchannel_6a171fb5-f1ee-401c-be68-f4e8b95cb92e</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="service"."radiocommunicationchannel"" (geometry_elevatedpoint_view_fydueh)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>radiofrequencyarea_200e41e5-9ed5-44bf-8874-ac5f1e9be47c</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="shared"."radiofrequencyarea"" (geometry_surface_view_sgprkc)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>road_3692b21a-909b-4ff4-8c20-68301916188e</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="airport_heliport"."road"" (geometry_elevatedsurface_view_gxmgqs)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>routesegment_c97f3074-a615-43e7-9081-dafedceb64cf</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="routes"."routesegment"" (geometry_curve_view_dtlvvb)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>runwayblastpad_6dd9d821-5f7c-464b-b063-36128ae6bb21</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="airport_heliport"."runwayblastpad"" (geometry_elevatedsurface_view_ilixig)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>runwaycentrelinepoint_c12574f5-78ad-4a2c-9e2a-145e20c9cfb9</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="airport_heliport"."runwaycentrelinepoint"" (geometry_elevatedpoint_view_eedyio)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>runwayelement_8537dab9-671a-4f30-9598-d676d4696b03</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="airport_heliport"."runwayelement"" (geometry_elevatedsurface_view_poyrrl)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>runwayprotectarea_dcf597e1-5438-498f-90ae-db0adc7a2eb8</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="airport_heliport"."runwayprotectarea"" (geometry_elevatedsurface_view_copnpl)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>runwayvisualrange_ced01b3d-fdb2-4859-86ef-b0077366f8c2</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="airport_heliport"."runwayvisualrange"" (geometry_elevatedpoint_view_yyxtan)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>safealtitudearea_da915adf-2a98-42ce-b64e-1c8dac82711a</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="procedure"."safealtitudearea"" (geometry_point_view_qhitrs)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>sdf_cbac5852-23ec-4736-817d-771e4e5c0f78</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="navaids_points"."sdf"" (geometry_elevatedpoint_view_brmakt)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>seaplanelandingarea_fa5e914c-d447-4b78-acd4-caa4c9abdc87</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="airport_heliport"."seaplanelandingarea"" (geometry_elevatedsurface_view_kalhql)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>seaplanerampsite_baf83d76-0ca0-4dec-9025-1fc1a60d4270</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="airport_heliport"."seaplanerampsite"" (geometry_elevatedsurface_view_vkvuyv)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>seaplanerampsite_e7b36ceb-6153-4fba-9694-342440ccaaa8</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="airport_heliport"."seaplanerampsite"" (geometry_elevatedcurve_view_itzdbr)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>searchrescueservice_bdfc9996-bdda-4561-867d-2bf2e2f87428</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="service"."searchrescueservice"" (geometry_elevatedpoint_view_pqetwv)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>secondarysurveillanceradar_3295252d-88d9-4823-9aca-59be44c1c08e</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="surveillance"."secondarysurveillanceradar"" (geometry_elevatedpoint_view_klocsq)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>significantpointinairspace_9136ccb2-50f8-409e-a374-1426631a04e0</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="navaids_points"."significantpointinairspace"" (geometry_point_view_pbozfz)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>specialnavigationstation_11694942-abf4-4faa-91b3-afd99646a024</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="navaids_points"."specialnavigationstation"" (geometry_elevatedpoint_view_hayuwh)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>surveycontrolpoint_0c9f655c-7551-46fe-b5ec-a559246a0143</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="airport_heliport"."surveycontrolpoint"" (geometry_elevatedpoint_view_yaumkd)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>tacan_1a42177f-48d6-4272-b430-1c2ca5b4204b</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="navaids_points"."tacan"" (geometry_elevatedpoint_view_enhhkb)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>taxiholdingposition_22d9cd5e-2617-41f4-a19f-57693b50cb97</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="airport_heliport"."taxiholdingposition"" (geometry_elevatedpoint_view_sbqpcm)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>taxiwayelement_89c40980-2664-4f11-90be-4f674546cd28</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="airport_heliport"."taxiwayelement"" (geometry_elevatedsurface_view_ycieoj)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>terminalarrivalarea_d5b0ede8-ec8d-4b83-8e19-b5c21313077a</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="procedure"."terminalarrivalarea"" (geometry_point_view_wwlxxv)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>terminalarrivalarea_72d54025-45d3-4cde-a324-2dee9e3bede2</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="procedure"."terminalarrivalarea"" (geometry_point_view_jibbrk)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>terminalarrivalarea_fa5e905b-7100-4f86-a565-29f3e15937ed</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="procedure"."terminalarrivalarea"" (geometry_surface_view_zjfekk)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>touchdownliftoffsafearea_68408dfd-199c-4d03-9157-d4e87666ee00</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="airport_heliport"."touchdownliftoffsafearea"" (geometry_elevatedsurface_view_qfweve)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>touchdownliftoff_210dd458-51fb-4c54-8f42-c8b51e7a764b</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="airport_heliport"."touchdownliftoff"" (geometry_elevatedpoint_view_yifywj)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>touchdownliftoff_892f475d-17d6-422f-bb98-a6b7b4254814</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="airport_heliport"."touchdownliftoff"" (geometry_elevatedsurface_view_xsccki)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>unit_e53535a4-1ce4-4fcc-9959-876318e78628</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="organisation"."unit"" (geometry_elevatedpoint_view_feotyr)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>vor_e4985dba-169c-4776-899e-7a4a2adb19f6</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="navaids_points"."vor"" (geometry_elevatedpoint_view_pgqbyz)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer><maplayer styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" symbologyReferenceScale="-1" simplifyLocal="1" simplifyDrawingHints="0" simplifyAlgorithm="0" minScale="100000000" simplifyMaxScale="1" readOnly="0" labelsEnabled="0" maxScale="0" autoRefreshTime="0" refreshOnNotifyEnabled="0" refreshOnNotifyMessage="" autoRefreshMode="Disabled" legendPlaceholderImage="" geometry="Point" type="vector" wkbType="Point">
	<extent />
	<wgs84extent />
	
	<id>workarea_ddfb72c6-be56-4589-a560-2ec35fce4580</id>
	
	<datasource>dbname=${ProjectConfig.dbname} host=${ProjectConfig.host} port=${ProjectConfig.port}key='id' "table="airport_heliport"."workarea"" (geometry_elevatedsurface_view_oescbd)</datasource>
	<keywordList />
	<layername />
	<srs>
		<spatialrefsys nativeFormat="Wkt">
			<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
			<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
			<srsid>3452</srsid>
			<srid>4326</srid>
			<authid>EPSG:4326</authid>
			<description>WGS 84</description>
			<projectionacronym>longlat</projectionacronym>
			<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
			<geographicflag>true</geographicflag>
		</spatialrefsys>
	</srs>
	<resourceMetadata />
	
	<provider encoding="">postgres</provider>
	<vectorjoins />
	<layerDependencies />
	<dataDependencies />
	<expressionfields />
	<map-layer-style-manager />
	<auxiliaryLayer />
	<metadataUrls />
	<flags>
		<Identifiable>1</Identifiable>
		<Removable>1</Removable>
		<Searchable>1</Searchable>
		<Private>0</Private>
	</flags>
	<temporal enabled="1" accumulate="0" durationField="row" startField="valid_time_begin" durationUnit="min" limitMode="0" endField="valid_time_end" startExpression="" mode="2" endExpression="" fixedDuration="0">
		<fixedRange>
			<start />
			<end />
		</fixedRange>
	</temporal>
	<elevation />
	<renderer-v2 />
	<selection />
	<customproperties />
	<blendMode />
	<featureBlendMode />0
	<layerOpacity />1
	<SingleCategoryDiagramRenderer />
	<DiagramLayerSettings />
	<geometryOptions />
	<legend />
	<referencedLayers />
	<fieldConfiguration>
		<field name="id" configurationFlags="NoFlag">
			<editWidget type="">
				<config>
				<Option />
				</config>
			</editWidget>
		</field>
	</fieldConfiguration>
	<aliases>
			<alias field="id" index="0" name="" />
	</aliases>
	<splitPolicies>
		<policy field="id" policy="Duplicate" />
	</splitPolicies>
	<defaults>
		<default field="id" applyOnUpdate="0" expression="" />
	</defaults>
	<constraints>
		<constraint notnull_strength="1" field="id" unique_strength="1" exp_strength="0" constraints="3" />
	</constraints>
	<constraintExpressions />
	<expressionfields />
	<attributeactions />
	
	<attributetableconfig />
	
	<conditionalstyles />
	<storedexpressions />
	<editform tolerant="1" />
	<editforminit />
	<editforminitcodesource>0</editforminitcodesource>
	<editforminitfilepath />
	<editforminitcode />
	<featformsuppress>0</featformsuppress>
	<editorlayout>tablayout</editorlayout>
	<attributeEditorForm />
	<editable>
		<field editable="1" name="aimingpoint" />
	</editable>
	<labelOnTop>
		<field labelOnTop="0" name="aimingpoint" />
	</labelOnTop>
	<reuseLastValue>
		<field reuseLastValue="0" name="aimingpoint" />
	</reuseLastValue>
	<dataDefinedFieldProperties />
	<widgets />
	<previewExpression>"name"</previewExpression>
	<mapTip enabled="1" />
</maplayer></projectlayers>
	<layerorder>
		<layer id="_556bb755_1006_4e99_869c_27c4a486ea49" />
	</layerorder>
	<properties>
		<Digitizing>
			<AvoidIntersectionsMode type="int">0</AvoidIntersectionsMode>
		</Digitizing>
		<Gui>
			<CanvasColorBluePart type="int">255</CanvasColorBluePart>
			<CanvasColorGreenPart type="int">255</CanvasColorGreenPart>
			<CanvasColorRedPart type="int">255</CanvasColorRedPart>
			<SelectionColorAlphaPart type="int">255</SelectionColorAlphaPart>
			<SelectionColorBluePart type="int">0</SelectionColorBluePart>
			<SelectionColorGreenPart type="int">255</SelectionColorGreenPart>
			<SelectionColorRedPart type="int">255</SelectionColorRedPart>
		</Gui>
		<Legend>
			<filterByMap type="bool">false</filterByMap>
		</Legend>
		<Macros>
			<pythonCode type="QString" />
		</Macros>
		<Measure>
			<Ellipsoid type="QString">EPSG:7030</Ellipsoid>
		</Measure>
		<Measurement>
			<AreaUnits type="QString">m2</AreaUnits>
			<DistanceUnits type="QString">meters</DistanceUnits>
		</Measurement>
		<PAL>
			<CandidatesLinePerCM type="double">5</CandidatesLinePerCM>
			<CandidatesPolygonPerCM type="double">2.5</CandidatesPolygonPerCM>
			<DrawLabelMetrics type="bool">false</DrawLabelMetrics>
			<DrawRectOnly type="bool">false</DrawRectOnly>
			<DrawUnplaced type="bool">false</DrawUnplaced>
			<PlacementEngineVersion type="int">1</PlacementEngineVersion>
			<SearchMethod type="int">0</SearchMethod>
			<ShowingAllLabels type="bool">false</ShowingAllLabels>
			<ShowingCandidates type="bool">false</ShowingCandidates>
			<ShowingPartialsLabels type="bool">true</ShowingPartialsLabels>
			<TextFormat type="int">0</TextFormat>
			<UnplacedColor type="QString">255,0,0,255</UnplacedColor>
		</PAL>
		<Paths>
			<Absolute type="bool">true</Absolute>
		</Paths>
		<PositionPrecision>
			<Automatic type="bool">true</Automatic>
			<DecimalPlaces type="int">2</DecimalPlaces>
		</PositionPrecision>
		<RenderMapTile type="bool">false</RenderMapTile>
		<SpatialRefSys>
			<ProjectionsEnabled type="int">1</ProjectionsEnabled>
		</SpatialRefSys>
		<TemporalControllerWidget>
			<EndDateTime type="QString">2025-04-14T22:00:00.000Z</EndDateTime>
			<NavigationMode type="int">2</NavigationMode>
			<StartDateTime type="QString">2025-04-13T22:00:01.000Z</StartDateTime>
		</TemporalControllerWidget>
		<WCSLayers type="QStringList" />
		<WCSUrl type="QString" />
		<WFSLayers type="QStringList" />
		<WFSTLayers>
			<Delete type="QStringList" />
			<Insert type="QStringList" />
			<Update type="QStringList" />
		</WFSTLayers>
		<WFSUrl type="QString" />
		<WMSAccessConstraints type="QString">None</WMSAccessConstraints>
		<WMSAddLayerGroupsLegendGraphic type="bool">false</WMSAddLayerGroupsLegendGraphic>
		<WMSAddWktGeometry type="bool">false</WMSAddWktGeometry>
		<WMSContactMail type="QString" />
		<WMSContactOrganization type="QString" />
		<WMSContactPerson type="QString" />
		<WMSContactPhone type="QString" />
		<WMSContactPosition type="QString" />
		<WMSDefaultMapUnitsPerMm type="double">8.983152841195214e-06</WMSDefaultMapUnitsPerMm>
		<WMSFeatureInfoUseAttributeFormSettings type="bool">false</WMSFeatureInfoUseAttributeFormSettings>
		<WMSFees type="QString">conditions unknown</WMSFees>
		<WMSImageQuality type="int">90</WMSImageQuality>
		<WMSKeywordList type="QStringList">
			<value />
		</WMSKeywordList>
		<WMSMaxAtlasFeatures type="int">1</WMSMaxAtlasFeatures>
		<WMSOnlineResource type="QString" />
		<WMSPrecision type="QString">8</WMSPrecision>
		<WMSRootName type="QString" />
		<WMSSegmentizeFeatureInfoGeometry type="bool">false</WMSSegmentizeFeatureInfoGeometry>
		<WMSServiceAbstract type="QString" />
		<WMSServiceCapabilities type="bool">false</WMSServiceCapabilities>
		<WMSServiceTitle type="QString" />
		<WMSTileBuffer type="int">0</WMSTileBuffer>
		<WMSUrl type="QString" />
		<WMSUseLayerIDs type="bool">false</WMSUseLayerIDs>
		<WMTSGrids>
			<CRS type="QStringList" />
			<Config type="QStringList" />
		</WMTSGrids>
		<WMTSJpegLayers>
			<Group type="QStringList" />
			<Layer type="QStringList" />
			<Project type="bool">false</Project>
		</WMTSJpegLayers>
		<WMTSLayers>
			<Group type="QStringList" />
			<Layer type="QStringList" />
			<Project type="bool">false</Project>
		</WMTSLayers>
		<WMTSMinScale type="int">5000</WMTSMinScale>
		<WMTSPngLayers>
			<Group type="QStringList" />
			<Layer type="QStringList" />
			<Project type="bool">false</Project>
		</WMTSPngLayers>
		<WMTSUrl type="QString" />
	</properties>
	<dataDefinedServerProperties>
		<Option type="Map">
			<Option name="name" type="QString" value="" />
			<Option name="properties" />
			<Option name="type" type="QString" value="collection" />
		</Option>
	</dataDefinedServerProperties>
	<projectMetadata>
		<identifier />
		<parentidentifier />
		<language />
		<type />
		<title />
		<abstract />
		<contact>
			<name />
			<organization />
			<position />
			<voice />
			<fax />
			<email />
			<role />
		</contact>
		<links />
		<dates>
			<date type="Created" value="2025-04-13T17:27:43" />
		</dates>
		<author>Raphael Gerth</author>
		<creation>2025-04-13T17:27:43</creation>
	</projectMetadata>
	<ProjectViewSettings UseProjectScales="0" rotation="0">
		<Scales />
		<DefaultViewExtent xmin="4.14361879081629869" ymin="44.58253207445003596" ymax="47.9609278816433644" xmax="11.56188343446944344">
			<spatialrefsys nativeFormat="Wkt">
				<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
				<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
				<srsid>3452</srsid>
				<srid>4326</srid>
				<authid>EPSG:4326</authid>
				<description>WGS 84</description>
				<projectionacronym>longlat</projectionacronym>
				<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
				<geographicflag>true</geographicflag>
			</spatialrefsys>
		</DefaultViewExtent>
	</ProjectViewSettings>
	<ProjectDisplaySettings CoordinateAxisOrder="YX" CoordinateType="CustomCrs">
		<BearingFormat id="bearing">
			<Option type="Map">
				<Option name="decimal_separator" type="invalid" />
				<Option name="decimals" type="int" value="6" />
				<Option name="direction_format" type="int" value="0" />
				<Option name="rounding_type" type="int" value="0" />
				<Option name="show_plus" type="bool" value="false" />
				<Option name="show_thousand_separator" type="bool" value="true" />
				<Option name="show_trailing_zeros" type="bool" value="false" />
				<Option name="thousand_separator" type="invalid" />
			</Option>
		</BearingFormat>
		<GeographicCoordinateFormat id="geographiccoordinate">
			<Option type="Map">
				<Option name="angle_format" type="QString" value="DegreesMinutesSeconds" />
				<Option name="decimal_separator" type="invalid" />
				<Option name="decimals" type="int" value="6" />
				<Option name="rounding_type" type="int" value="0" />
				<Option name="show_leading_degree_zeros" type="bool" value="true" />
				<Option name="show_leading_zeros" type="bool" value="true" />
				<Option name="show_plus" type="bool" value="false" />
				<Option name="show_suffix" type="bool" value="true" />
				<Option name="show_thousand_separator" type="bool" value="true" />
				<Option name="show_trailing_zeros" type="bool" value="true" />
				<Option name="thousand_separator" type="invalid" />
			</Option>
		</GeographicCoordinateFormat>
		<CoordinateCustomCrs>
			<spatialrefsys nativeFormat="Wkt">
				<wkt>GEOGCRS["WGS 84",ENSEMBLE["World Geodetic System 1984 ensemble",MEMBER["World Geodetic System 1984 (Transit)"],MEMBER["World Geodetic System 1984 (G730)"],MEMBER["World Geodetic System 1984 (G873)"],MEMBER["World Geodetic System 1984 (G1150)"],MEMBER["World Geodetic System 1984 (G1674)"],MEMBER["World Geodetic System 1984 (G1762)"],MEMBER["World Geodetic System 1984 (G2139)"],ELLIPSOID["WGS 84",6378137,298.257223563,LENGTHUNIT["metre",1]],ENSEMBLEACCURACY[2.0]],PRIMEM["Greenwich",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["geodetic latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["geodetic longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Horizontal component of 3D system."],AREA["World."],BBOX[-90,-180,90,180]],ID["EPSG",4326]]</wkt>
				<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>
				<srsid>3452</srsid>
				<srid>4326</srid>
				<authid>EPSG:4326</authid>
				<description>WGS 84</description>
				<projectionacronym>longlat</projectionacronym>
				<ellipsoidacronym>EPSG:7030</ellipsoidacronym>
				<geographicflag>true</geographicflag>
			</spatialrefsys>
		</CoordinateCustomCrs>
	</ProjectDisplaySettings>
	<ProjectGpsSettings destinationLayerSource="dbname='delorean' port=5432 key='row' srid=4326 type=Point checkPrimaryKeyUnicity='1' table=&quot;airport_heliport&quot;.&quot;airportheliport_publisher_view&quot; (geom)" destinationFollowsActiveLayer="1" destinationLayer="airportheliport_publisher_view_4e1bcdbd_6040_4a10_b841_b02ba0ea3cb6" destinationLayerName="airportheliport_publisher_view" autoCommitFeatures="0" destinationLayerProvider="postgres" autoAddTrackVertices="0">
		<timeStampFields />
	</ProjectGpsSettings>
</qgis>