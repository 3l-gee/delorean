<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis saveDateTime="2025-05-24T10:35:00"
      projectname=""
      version="3.34.8-Prizren"
      saveUser="marty"
      saveUserFull="Marty McFly">
	<homePath path=""/>
	<!-- qgis project title definition -->
	<title>${ProjectConfig.title}</title>
	<transaction mode="Disabled"/>
	<projectFlags set=""/>
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
			<Option/>
		</customproperties>
		<layer-tree-layer expanded="1"
		                  patch_size="-1,-1"
		                  legend_split_behavior="0"
		                  source="crs=EPSG:3857&amp;format&amp;type=xyz&amp;url=https://tile.openstreetmap.org/%7Bz%7D/%7Bx%7D/%7By%7D.png&amp;zmax=19&amp;zmin=0"
		                  legend_exp=""
		                  id="_556bb755_1006_4e99_869c_27c4a486ea49"
		                  providerKey="wms"
		                  checked="Qt::Checked"
		                  name="OpenStreetMap">
			<customproperties>
				<Option/>
			</customproperties>
		</layer-tree-layer>
		<custom-order enabled="0">
			<item>_556bb755_1006_4e99_869c_27c4a486ea49</item>
		</custom-order>
	</layer-tree-group>
	<snapping-settings minScale="0"
	                   tolerance="12"
	                   maxScale="0"
	                   mode="2"
	                   intersection-snapping="0"
	                   self-snapping="0"
	                   scaleDependencyMode="0"
	                   unit="1"
	                   enabled="0"
	                   type="1">
		<individual-layer-settings/>
	</snapping-settings>
	<mapcanvas name="theMapCanvas"
	           annotationsVisible="1">
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
		<expressionContextScope/>
	</mapcanvas>
	<legend updateDrawingOrder="true">
		<legendlayer open="true"
		             showFeatureCount="0"
		             drawingOrder="-1"
		             checked="Qt::Checked"
		             name="OpenStreetMap">
			<filegroup open="true"
			           hidden="false">
				<legendlayerfile layerid="_556bb755_1006_4e99_869c_27c4a486ea49"
				                 isInOverview="0"
				                 visible="1"/>
			</filegroup>
		</legendlayer>
	</legend>
	<projectlayers>
		<maplayer legendPlaceholderImage=""
		          styleCategories="AllStyleCategories"
		          minScale="1e+08"
		          maxScale="0"
		          hasScaleBasedVisibilityFlag="0"
		          autoRefreshMode="Disabled"
		          refreshOnNotifyEnabled="0"
		          refreshOnNotifyMessage=""
		          type="raster"
		          autoRefreshTime="0">
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
				<value/>
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
				<parentidentifier/>
				<language/>
				<type>dataset</type>
				<title>OpenStreetMap tiles</title>
				<abstract>OpenStreetMap is built by a community of mappers that contribute and maintain data about roads, trails, cafés, railway stations, and much more, all over the world.</abstract>
				<links>
					<link mimeType=""
					      size=""
					      description=""
					      name="Source"
					      type="WWW:LINK"
					      format=""
					      url="https://www.openstreetmap.org/"/>
				</links>
				<dates/>
				<fees/>
				<rights>Base map and data from OpenStreetMap and OpenStreetMap Foundation (CC-BY-SA). © https://www.openstreetmap.org and contributors.</rights>
				<license>Open Data Commons Open Database License (ODbL)</license>
				<license>Creative Commons Attribution-ShareAlike (CC-BY-SA)</license>
				<encoding/>
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
					<spatial minz="nan"
					         miny="-85.05112877980660357"
					         crs="EPSG:4326"
					         minx="-180"
					         maxy="85.05112877980660357"
					         dimensions="2"
					         maxx="180"
					         maxz="nan"/>
				</extent>
			</resourceMetadata>
			<provider>wms</provider>
			<noData>
				<noDataList bandNo="1"
				            useSrcNoData="0"/>
			</noData>
			<map-layer-style-manager current="default">
				<map-layer-style name="default"/>
			</map-layer-style-manager>
			<metadataUrls/>
			<flags>
				<Identifiable>1</Identifiable>
				<Removable>1</Removable>
				<Searchable>0</Searchable>
				<Private>0</Private>
			</flags>
			<temporal fetchMode="0"
			          mode="0"
			          enabled="0">
				<fixedRange>
					<start/>
					<end/>
				</fixedRange>
			</temporal>
			<elevation zoffset="0"
			           symbology="Line"
			           zscale="1"
			           band="1"
			           enabled="0">
				<data-defined-properties>
					<Option type="Map">
						<Option name="name"
						        type="QString"
						        value=""/>
						<Option name="properties"/>
						<Option name="type"
						        type="QString"
						        value="collection"/>
					</Option>
				</data-defined-properties>
				<profileLineSymbol>
					<symbol alpha="1"
					        frame_rate="10"
					        clip_to_extent="1"
					        name=""
					        is_animated="0"
					        type="line"
					        force_rhr="0">
						<data_defined_properties>
							<Option type="Map">
								<Option name="name"
								        type="QString"
								        value=""/>
								<Option name="properties"/>
								<Option name="type"
								        type="QString"
								        value="collection"/>
							</Option>
						</data_defined_properties>
						<layer locked="0"
						       id="{274c1acb-b92f-4cd1-9b6d-d6d6dde97eb1}"
						       pass="0"
						       class="SimpleLine"
						       enabled="1">
							<Option type="Map">
								<Option name="align_dash_pattern"
								        type="QString"
								        value="0"/>
								<Option name="capstyle"
								        type="QString"
								        value="square"/>
								<Option name="customdash"
								        type="QString"
								        value="5;2"/>
								<Option name="customdash_map_unit_scale"
								        type="QString"
								        value="3x:0,0,0,0,0,0"/>
								<Option name="customdash_unit"
								        type="QString"
								        value="MM"/>
								<Option name="dash_pattern_offset"
								        type="QString"
								        value="0"/>
								<Option name="dash_pattern_offset_map_unit_scale"
								        type="QString"
								        value="3x:0,0,0,0,0,0"/>
								<Option name="dash_pattern_offset_unit"
								        type="QString"
								        value="MM"/>
								<Option name="draw_inside_polygon"
								        type="QString"
								        value="0"/>
								<Option name="joinstyle"
								        type="QString"
								        value="bevel"/>
								<Option name="line_color"
								        type="QString"
								        value="243,166,178,255"/>
								<Option name="line_style"
								        type="QString"
								        value="solid"/>
								<Option name="line_width"
								        type="QString"
								        value="0.6"/>
								<Option name="line_width_unit"
								        type="QString"
								        value="MM"/>
								<Option name="offset"
								        type="QString"
								        value="0"/>
								<Option name="offset_map_unit_scale"
								        type="QString"
								        value="3x:0,0,0,0,0,0"/>
								<Option name="offset_unit"
								        type="QString"
								        value="MM"/>
								<Option name="ring_filter"
								        type="QString"
								        value="0"/>
								<Option name="trim_distance_end"
								        type="QString"
								        value="0"/>
								<Option name="trim_distance_end_map_unit_scale"
								        type="QString"
								        value="3x:0,0,0,0,0,0"/>
								<Option name="trim_distance_end_unit"
								        type="QString"
								        value="MM"/>
								<Option name="trim_distance_start"
								        type="QString"
								        value="0"/>
								<Option name="trim_distance_start_map_unit_scale"
								        type="QString"
								        value="3x:0,0,0,0,0,0"/>
								<Option name="trim_distance_start_unit"
								        type="QString"
								        value="MM"/>
								<Option name="tweak_dash_pattern_on_corners"
								        type="QString"
								        value="0"/>
								<Option name="use_custom_dash"
								        type="QString"
								        value="0"/>
								<Option name="width_map_unit_scale"
								        type="QString"
								        value="3x:0,0,0,0,0,0"/>
							</Option>
							<data_defined_properties>
								<Option type="Map">
									<Option name="name"
									        type="QString"
									        value=""/>
									<Option name="properties"/>
									<Option name="type"
									        type="QString"
									        value="collection"/>
								</Option>
							</data_defined_properties>
						</layer>
					</symbol>
				</profileLineSymbol>
				<profileFillSymbol>
					<symbol alpha="1"
					        frame_rate="10"
					        clip_to_extent="1"
					        name=""
					        is_animated="0"
					        type="fill"
					        force_rhr="0">
						<data_defined_properties>
							<Option type="Map">
								<Option name="name"
								        type="QString"
								        value=""/>
								<Option name="properties"/>
								<Option name="type"
								        type="QString"
								        value="collection"/>
							</Option>
						</data_defined_properties>
						<layer locked="0"
						       id="{10bffc71-c5eb-489e-b31b-97f0143ab092}"
						       pass="0"
						       class="SimpleFill"
						       enabled="1">
							<Option type="Map">
								<Option name="border_width_map_unit_scale"
								        type="QString"
								        value="3x:0,0,0,0,0,0"/>
								<Option name="color"
								        type="QString"
								        value="243,166,178,255"/>
								<Option name="joinstyle"
								        type="QString"
								        value="bevel"/>
								<Option name="offset"
								        type="QString"
								        value="0,0"/>
								<Option name="offset_map_unit_scale"
								        type="QString"
								        value="3x:0,0,0,0,0,0"/>
								<Option name="offset_unit"
								        type="QString"
								        value="MM"/>
								<Option name="outline_color"
								        type="QString"
								        value="35,35,35,255"/>
								<Option name="outline_style"
								        type="QString"
								        value="no"/>
								<Option name="outline_width"
								        type="QString"
								        value="0.26"/>
								<Option name="outline_width_unit"
								        type="QString"
								        value="MM"/>
								<Option name="style"
								        type="QString"
								        value="solid"/>
							</Option>
							<data_defined_properties>
								<Option type="Map">
									<Option name="name"
									        type="QString"
									        value=""/>
									<Option name="properties"/>
									<Option name="type"
									        type="QString"
									        value="collection"/>
								</Option>
							</data_defined_properties>
						</layer>
					</symbol>
				</profileFillSymbol>
			</elevation>
			<customproperties>
				<Option type="Map">
					<Option name="identify/format"
					        type="QString"
					        value="Undefined"/>
				</Option>
			</customproperties>
			<mapTip enabled="1"/>
			<pipe-data-defined-properties>
				<Option type="Map">
					<Option name="name"
					        type="QString"
					        value=""/>
					<Option name="properties"/>
					<Option name="type"
					        type="QString"
					        value="collection"/>
				</Option>
			</pipe-data-defined-properties>
			<pipe>
				<provider>
					<resampling maxOversampling="2"
					            zoomedOutResamplingMethod="nearestNeighbour"
					            enabled="false"
					            zoomedInResamplingMethod="nearestNeighbour"/>
				</provider>
				<rasterrenderer nodataColor=""
				                alphaBand="-1"
				                band="1"
				                opacity="1"
				                type="singlebandcolordata">
					<rasterTransparency/>
					<minMaxOrigin>
						<limits>None</limits>
						<extent>WholeRaster</extent>
						<statAccuracy>Estimated</statAccuracy>
						<cumulativeCutLower>0.02</cumulativeCutLower>
						<cumulativeCutUpper>0.98</cumulativeCutUpper>
						<stdDevFactor>2</stdDevFactor>
					</minMaxOrigin>
				</rasterrenderer>
				<brightnesscontrast gamma="1"
				                    contrast="0"
				                    brightness="0"/>
				<huesaturation colorizeOn="0"
				               colorizeBlue="128"
				               invertColors="0"
				               colorizeStrength="100"
				               colorizeRed="255"
				               colorizeGreen="128"
				               saturation="0"
				               grayscaleMode="0"/>
				<rasterresampler maxOversampling="2"/>
				<resamplingStage>resamplingFilter</resamplingStage>
			</pipe>
			<blendMode>0</blendMode>
		</maplayer>
	</projectlayers>
	<layerorder>
		<layer id="_556bb755_1006_4e99_869c_27c4a486ea49"/>
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
			<pythonCode type="QString"/>
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
		<WCSLayers type="QStringList"/>
		<WCSUrl type="QString"/>
		<WFSLayers type="QStringList"/>
		<WFSTLayers>
			<Delete type="QStringList"/>
			<Insert type="QStringList"/>
			<Update type="QStringList"/>
		</WFSTLayers>
		<WFSUrl type="QString"/>
		<WMSAccessConstraints type="QString">None</WMSAccessConstraints>
		<WMSAddLayerGroupsLegendGraphic type="bool">false</WMSAddLayerGroupsLegendGraphic>
		<WMSAddWktGeometry type="bool">false</WMSAddWktGeometry>
		<WMSContactMail type="QString"/>
		<WMSContactOrganization type="QString"/>
		<WMSContactPerson type="QString"/>
		<WMSContactPhone type="QString"/>
		<WMSContactPosition type="QString"/>
		<WMSDefaultMapUnitsPerMm type="double">8.983152841195214e-06</WMSDefaultMapUnitsPerMm>
		<WMSFeatureInfoUseAttributeFormSettings type="bool">false</WMSFeatureInfoUseAttributeFormSettings>
		<WMSFees type="QString">conditions unknown</WMSFees>
		<WMSImageQuality type="int">90</WMSImageQuality>
		<WMSKeywordList type="QStringList">
			<value/>
		</WMSKeywordList>
		<WMSMaxAtlasFeatures type="int">1</WMSMaxAtlasFeatures>
		<WMSOnlineResource type="QString"/>
		<WMSPrecision type="QString">8</WMSPrecision>
		<WMSRootName type="QString"/>
		<WMSSegmentizeFeatureInfoGeometry type="bool">false</WMSSegmentizeFeatureInfoGeometry>
		<WMSServiceAbstract type="QString"/>
		<WMSServiceCapabilities type="bool">false</WMSServiceCapabilities>
		<WMSServiceTitle type="QString"/>
		<WMSTileBuffer type="int">0</WMSTileBuffer>
		<WMSUrl type="QString"/>
		<WMSUseLayerIDs type="bool">false</WMSUseLayerIDs>
		<WMTSGrids>
			<CRS type="QStringList"/>
			<Config type="QStringList"/>
		</WMTSGrids>
		<WMTSJpegLayers>
			<Group type="QStringList"/>
			<Layer type="QStringList"/>
			<Project type="bool">false</Project>
		</WMTSJpegLayers>
		<WMTSLayers>
			<Group type="QStringList"/>
			<Layer type="QStringList"/>
			<Project type="bool">false</Project>
		</WMTSLayers>
		<WMTSMinScale type="int">5000</WMTSMinScale>
		<WMTSPngLayers>
			<Group type="QStringList"/>
			<Layer type="QStringList"/>
			<Project type="bool">false</Project>
		</WMTSPngLayers>
		<WMTSUrl type="QString"/>
	</properties>
	<dataDefinedServerProperties>
		<Option type="Map">
			<Option name="name"
			        type="QString"
			        value=""/>
			<Option name="properties"/>
			<Option name="type"
			        type="QString"
			        value="collection"/>
		</Option>
	</dataDefinedServerProperties>
	<projectMetadata>
		<identifier/>
		<parentidentifier/>
		<language/>
		<type/>
		<title/>
		<abstract/>
		<contact>
			<name/>
			<organization/>
			<position/>
			<voice/>
			<fax/>
			<email/>
			<role/>
		</contact>
		<links/>
		<dates>
			<date type="Created"
			      value="2025-04-13T17:27:43"/>
		</dates>
		<author>Raphael Gerth</author>
		<creation>2025-04-13T17:27:43</creation>
	</projectMetadata>
	<ProjectViewSettings UseProjectScales="0"
	                     rotation="0">
		<Scales/>
		<DefaultViewExtent xmin="4.14361879081629869"
		                   ymin="44.58253207445003596"
		                   ymax="47.9609278816433644"
		                   xmax="11.56188343446944344">
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
	<ProjectDisplaySettings CoordinateAxisOrder="Default"
	                        CoordinateType="CustomCrs">
		<BearingFormat id="bearing">
			<Option type="Map">
				<Option type="invalid"
				        name="decimal_separator"/>
				<Option type="int"
				        value="6"
				        name="decimals"/>
				<Option type="int"
				        value="0"
				        name="direction_format"/>
				<Option type="int"
				        value="0"
				        name="rounding_type"/>
				<Option type="bool"
				        value="false"
				        name="show_plus"/>
				<Option type="bool"
				        value="true"
				        name="show_thousand_separator"/>
				<Option type="bool"
				        value="false"
				        name="show_trailing_zeros"/>
				<Option type="invalid"
				        name="thousand_separator"/>
			</Option>
		</BearingFormat>
		<GeographicCoordinateFormat id="geographiccoordinate">
			<Option type="Map">
				<Option name="angle_format"
				        type="QString"
				        value="DecimalDegrees"/>
				<Option name="decimal_separator"
				        type="invalid"/>
				<Option name="decimals"
				        type="int"
				        value="6"/>
				<Option name="rounding_type"
				        type="int"
				        value="0"/>
				<Option name="show_leading_degree_zeros"
				        type="bool"
				        value="false"/>
				<Option name="show_leading_zeros"
				        type="bool"
				        value="false"/>
				<Option name="show_plus"
				        type="bool"
				        value="false"/>
				<Option name="show_suffix"
				        type="bool"
				        value="false"/>
				<Option name="show_thousand_separator"
				        type="bool"
				        value="true"/>
				<Option name="show_trailing_zeros"
				        type="bool"
				        value="false"/>
				<Option name="thousand_separator"
				        type="invalid"/>
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
	<ProjectGpsSettings destinationLayerSource="dbname='delorean' port=5432 key='row' srid=4326 type=Point checkPrimaryKeyUnicity='1' table=&quot;airport_heliport&quot;.&quot;airportheliport_publisher_view&quot; (geom)"
	                    destinationFollowsActiveLayer="1"
	                    destinationLayer="airportheliport_publisher_view_4e1bcdbd_6040_4a10_b841_b02ba0ea3cb6"
	                    destinationLayerName="airportheliport_publisher_view"
	                    autoCommitFeatures="0"
	                    destinationLayerProvider="postgres"
	                    autoAddTrackVertices="0">
		<timeStampFields/>
	</ProjectGpsSettings>
</qgis>
