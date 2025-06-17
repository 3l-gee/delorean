<maplayers>
		<maplayer styleCategories="AllStyleCategories"
		          hasScaleBasedVisibilityFlag="0"
		          simplifyDrawingTol="1"
		          symbologyReferenceScale="-1"
		          simplifyLocal="1"
		          simplifyDrawingHints="0"
		          simplifyAlgorithm="0"
		          minScale="100000000"
		          simplifyMaxScale="1"
		          readOnly="0"
		          labelsEnabled="0"
		          maxScale="0"
		          autoRefreshTime="0"
		          refreshOnNotifyEnabled="0"
		          refreshOnNotifyMessage=""
		          autoRefreshMode="Disabled"
		          legendPlaceholderImage=""
		          geometry="Point"
		          type="vector"
		          wkbType="Point">
			<id>d${LayerConfig.nameUuid}</id>
			<datasource>${LayerConfig.source}</datasource>
			<keywordList>
				<value/>
			</keywordList>
			<layername>${LayerConfig.name}</layername>
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
			<resourceMetadata>
				<identifier/>
				<parentidentifier/>
				<language/>
				<type>dataset</type>
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
				<dates/>
				<fees/>
				<encoding/>
				<crs>
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
				</crs>
				<extent>
					<spatial dimensions="2"
					         crs="EPSG:4326"
					         maxz="0"
					         maxy="-179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368"
					         minz="0"
					         minx="179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368"
					         miny="179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368"
					         maxx="-179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368"/>
					<temporal>
						<period>
							<start/>
							<end/>
						</period>
					</temporal>
				</extent>
			</resourceMetadata>
			<provider encoding="">${LayerConfig.provider}</provider>
			<vectorjoins/>
			<layerDependencies/>
			<dataDependencies/>
			<expressionfields/>
			<map-layer-style-manager current="default">
				<map-layer-style name="default"/>
			</map-layer-style-manager>
			<auxiliaryLayer/>
			<metadataUrls/>
			<flags>
				<Identifiable>1</Identifiable>
				<Removable>1</Removable>
				<Searchable>1</Searchable>
				<Private>0</Private>
			</flags>
			<temporal enabled="1"
			          accumulate="0"
			          durationField="row"
			          startField="valid_time_begin"
			          durationUnit="min"
			          limitMode="0"
			          endField="valid_time_end"
			          startExpression=""
			          mode="2"
			          endExpression=""
			          fixedDuration="0">
				<fixedRange>
					<start/>
					<end/>
				</fixedRange>
			</temporal>
			<renderer-v2 type="singleSymbol"
			             forceraster="0"
			             referencescale="-1"
			             symbollevels="0"
			             enableorderby="0">
				<symbols>
					<symbol clip_to_extent="1"
					        type="marker"
					        alpha="1"
					        frame_rate="10"
					        is_animated="0"
					        name="0"
					        force_rhr="0">
						<data_defined_properties>
							<Option type="Map">
								<Option type="QString"
								        name="name"
								        value=""/>
								<Option name="properties"/>
								<Option type="QString"
								        name="type"
								        value="collection"/>
							</Option>
						</data_defined_properties>
						<layer enabled="1"
						       locked="0"
						       pass="0"
						       id="{01e5dfe6-4b6d-4c6e-a3c7-5234a339d669}"
						       class="SimpleMarker">
							<Option type="Map">
								<Option type="QString"
								        name="angle"
								        value="0"/>
								<Option type="QString"
								        name="cap_style"
								        value="square"/>
								<Option type="QString"
								        name="color"
								        value="164,113,88,255"/>
								<Option type="QString"
								        name="horizontal_anchor_point"
								        value="1"/>
								<Option type="QString"
								        name="joinstyle"
								        value="bevel"/>
								<Option type="QString"
								        name="name"
								        value="circle"/>
								<Option type="QString"
								        name="offset"
								        value="0,0"/>
								<Option type="QString"
								        name="offset_map_unit_scale"
								        value="3x:0,0,0,0,0,0"/>
								<Option type="QString"
								        name="offset_unit"
								        value="MM"/>
								<Option type="QString"
								        name="outline_color"
								        value="35,35,35,255"/>
								<Option type="QString"
								        name="outline_style"
								        value="solid"/>
								<Option type="QString"
								        name="outline_width"
								        value="0"/>
								<Option type="QString"
								        name="outline_width_map_unit_scale"
								        value="3x:0,0,0,0,0,0"/>
								<Option type="QString"
								        name="outline_width_unit"
								        value="MM"/>
								<Option type="QString"
								        name="scale_method"
								        value="diameter"/>
								<Option type="QString"
								        name="size"
								        value="2"/>
								<Option type="QString"
								        name="size_map_unit_scale"
								        value="3x:0,0,0,0,0,0"/>
								<Option type="QString"
								        name="size_unit"
								        value="MM"/>
								<Option type="QString"
								        name="vertical_anchor_point"
								        value="1"/>
							</Option>
							<data_defined_properties>
								<Option type="Map">
									<Option type="QString"
									        name="name"
									        value=""/>
									<Option name="properties"/>
									<Option type="QString"
									        name="type"
									        value="collection"/>
								</Option>
							</data_defined_properties>
						</layer>
					</symbol>
				</symbols>
				<rotation/>
				<sizescale/>
			</renderer-v2>
			<selection mode="Default">
				<selectionColor invalid="1"/>
			</selection>
			<customproperties>
				<Option type="Map">
					<Option type="QString"
					        name="QFieldSync/action"
					        value="offline"/>
					<Option type="QString"
					        name="QFieldSync/attachment_naming"
					        value="{}"/>
					<Option type="QString"
					        name="QFieldSync/cloud_action"
					        value="offline"/>
					<Option type="QString"
					        name="QFieldSync/geometry_locked_expression"
					        value=""/>
					<Option type="QString"
					        name="QFieldSync/photo_naming"
					        value="{}"/>
					<Option type="QString"
					        name="QFieldSync/relationship_maximum_visible"
					        value="{}"/>
					<Option type="int"
					        name="QFieldSync/tracking_distance_requirement_minimum_meters"
					        value="30"/>
					<Option type="int"
					        name="QFieldSync/tracking_erroneous_distance_safeguard_maximum_meters"
					        value="1"/>
					<Option type="int"
					        name="QFieldSync/tracking_measurement_type"
					        value="0"/>
					<Option type="int"
					        name="QFieldSync/tracking_time_requirement_interval_seconds"
					        value="30"/>
					<Option type="int"
					        name="QFieldSync/value_map_button_interface_threshold"
					        value="0"/>
					<Option type="List"
					        name="dualview/previewExpressions">
						<Option type="QString"
						        value="&quot;name&quot;"/>
					</Option>
					<Option type="int"
					        name="embeddedWidgets/count"
					        value="0"/>
					<Option type="invalid"
					        name="variableNames"/>
					<Option type="invalid"
					        name="variableValues"/>
				</Option>
			</customproperties>
			<blendMode>0</blendMode>
			<featureBlendMode>0</featureBlendMode>
			<layerOpacity>1</layerOpacity>
			<SingleCategoryDiagramRenderer diagramType="Histogram"
			                               attributeLegend="1">
				<DiagramCategory direction="0"
				                 penColor="#000000"
				                 scaleDependency="Area"
				                 showAxis="1"
				                 barWidth="5"
				                 width="15"
				                 labelPlacementMethod="XHeight"
				                 penAlpha="255"
				                 diagramOrientation="Up"
				                 sizeType="MM"
				                 opacity="1"
				                 spacingUnitScale="3x:0,0,0,0,0,0"
				                 backgroundAlpha="255"
				                 spacing="5"
				                 lineSizeType="MM"
				                 minimumSize="0"
				                 spacingUnit="MM"
				                 maxScaleDenominator="1e+08"
				                 height="15"
				                 enabled="0"
				                 scaleBasedVisibility="0"
				                 lineSizeScale="3x:0,0,0,0,0,0"
				                 minScaleDenominator="0"
				                 sizeScale="3x:0,0,0,0,0,0"
				                 backgroundColor="#ffffff"
				                 rotationOffset="270"
				                 penWidth="0">
					<fontProperties strikethrough="0"
					                underline="0"
					                style=""
					                description="Segoe UI,8,-1,5,50,0,0,0,0,0"
					                bold="0"
					                italic="0"/>
					<attribute color="#000000"
					           label=""
					           colorOpacity="1"
					           field=""/>
					<axisSymbol>
						<symbol clip_to_extent="1"
						        type="line"
						        alpha="1"
						        frame_rate="10"
						        is_animated="0"
						        name=""
						        force_rhr="0">
							<data_defined_properties>
								<Option type="Map">
									<Option type="QString"
									        name="name"
									        value=""/>
									<Option name="properties"/>
									<Option type="QString"
									        name="type"
									        value="collection"/>
								</Option>
							</data_defined_properties>
							<layer enabled="1"
							       locked="0"
							       pass="0"
							       id="{3c6f9b6c-9476-43c3-a983-95cf40017e5e}"
							       class="SimpleLine">
								<Option type="Map">
									<Option type="QString"
									        name="align_dash_pattern"
									        value="0"/>
									<Option type="QString"
									        name="capstyle"
									        value="square"/>
									<Option type="QString"
									        name="customdash"
									        value="5;2"/>
									<Option type="QString"
									        name="customdash_map_unit_scale"
									        value="3x:0,0,0,0,0,0"/>
									<Option type="QString"
									        name="customdash_unit"
									        value="MM"/>
									<Option type="QString"
									        name="dash_pattern_offset"
									        value="0"/>
									<Option type="QString"
									        name="dash_pattern_offset_map_unit_scale"
									        value="3x:0,0,0,0,0,0"/>
									<Option type="QString"
									        name="dash_pattern_offset_unit"
									        value="MM"/>
									<Option type="QString"
									        name="draw_inside_polygon"
									        value="0"/>
									<Option type="QString"
									        name="joinstyle"
									        value="bevel"/>
									<Option type="QString"
									        name="line_color"
									        value="35,35,35,255"/>
									<Option type="QString"
									        name="line_style"
									        value="solid"/>
									<Option type="QString"
									        name="line_width"
									        value="0.26"/>
									<Option type="QString"
									        name="line_width_unit"
									        value="MM"/>
									<Option type="QString"
									        name="offset"
									        value="0"/>
									<Option type="QString"
									        name="offset_map_unit_scale"
									        value="3x:0,0,0,0,0,0"/>
									<Option type="QString"
									        name="offset_unit"
									        value="MM"/>
									<Option type="QString"
									        name="ring_filter"
									        value="0"/>
									<Option type="QString"
									        name="trim_distance_end"
									        value="0"/>
									<Option type="QString"
									        name="trim_distance_end_map_unit_scale"
									        value="3x:0,0,0,0,0,0"/>
									<Option type="QString"
									        name="trim_distance_end_unit"
									        value="MM"/>
									<Option type="QString"
									        name="trim_distance_start"
									        value="0"/>
									<Option type="QString"
									        name="trim_distance_start_map_unit_scale"
									        value="3x:0,0,0,0,0,0"/>
									<Option type="QString"
									        name="trim_distance_start_unit"
									        value="MM"/>
									<Option type="QString"
									        name="tweak_dash_pattern_on_corners"
									        value="0"/>
									<Option type="QString"
									        name="use_custom_dash"
									        value="0"/>
									<Option type="QString"
									        name="width_map_unit_scale"
									        value="3x:0,0,0,0,0,0"/>
								</Option>
								<data_defined_properties>
									<Option type="Map">
										<Option type="QString"
										        name="name"
										        value=""/>
										<Option name="properties"/>
										<Option type="QString"
										        name="type"
										        value="collection"/>
									</Option>
								</data_defined_properties>
							</layer>
						</symbol>
					</axisSymbol>
				</DiagramCategory>
			</SingleCategoryDiagramRenderer>
			<DiagramLayerSettings zIndex="0"
			                      dist="0"
			                      showAll="1"
			                      priority="0"
			                      placement="0"
			                      linePlacementFlags="18"
			                      obstacle="0">
				<properties>
					<Option type="Map">
						<Option type="QString"
						        name="name"
						        value=""/>
						<Option name="properties"/>
						<Option type="QString"
						        name="type"
						        value="collection"/>
					</Option>
				</properties>
			</DiagramLayerSettings>
			<geometryOptions removeDuplicateNodes="0"
			                 geometryPrecision="0">
				<activeChecks/>
				<checkConfiguration/>
			</geometryOptions>
			<legend type="default-vector"
			        showLabelLegend="0"/>
			<referencedLayers/>
			<fieldConfiguration/>
			<aliases/>
			<splitPolicies/>
			<defaults/>
			<constraints/>
			<constraintExpressions/>
			<expressionfields/>
			<attributeactions>
				<defaultAction value="{00000000-0000-0000-0000-000000000000}"
				               key="Canvas"/>
				<actionsetting icon=""
				               action="from qgis.utils import iface&#xd;&#xa;from qgis.core import QgsProject&#xd;&#xa;&#xd;&#xa;layer = QgsProject.instance().mapLayersByName('airportheliport_publisher_view')[0]&#xd;&#xa;uuid = '[%regexp_substr(airportheliport_href,'([a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12})')%]'&#xd;&#xa;feature = next(layer.getFeatures(f'&quot;identifier&quot; = \'{uuid}\''), None)&#xd;&#xa;&#xd;&#xa;if feature:&#xd;&#xa;    print(feature)&#xd;&#xa;    iface.openFeatureForm(layer, feature, False)"
				               type="1"
				               shortTitle="open airportHeliport"
				               isEnabledOnlyWhenEditable="0"
				               id="{0f52155a-6bcb-4642-a5c2-2a23a928efcc}"
				               notificationMessage=""
				               name="using airportheliport_href will opne the right airportHeliport using uuid, valid_time_begin and valid_time_end "
				               capture="0">
					<actionScope id="Form"/>
				</actionsetting>
			</attributeactions>
			<attributetableconfig actionWidgetStyle="dropDown"
			                      sortOrder="0"
			                      sortExpression="&quot;identifier&quot;">
				<columns>
					<column type="field"
					        hidden="0"
					        name="row"
					        width="-1"/>
					<column type="field"
					        hidden="0"
					        name="identifier"
					        width="-1"/>
					<column type="field"
					        hidden="0"
					        name="sequence_number"
					        width="-1"/>
					<column type="field"
					        hidden="0"
					        name="correction_number"
					        width="-1"/>
					<column type="field"
					        hidden="0"
					        name="valid_time_begin"
					        width="-1"/>
					<column type="field"
					        hidden="0"
					        name="valid_time_end"
					        width="-1"/>
					<column type="field"
					        hidden="0"
					        name="feature_lifetime_begin"
					        width="-1"/>
					<column type="field"
					        hidden="0"
					        name="feature_lifetime_end"
					        width="-1"/>
					<column type="field"
					        hidden="0"
					        name="designator"
					        width="-1"/>
					<column type="field"
					        hidden="0"
					        name="type"
					        width="-1"/>
					<column type="field"
					        hidden="0"
					        name="name"
					        width="-1"/>
					<column type="field"
					        hidden="0"
					        name="airportheliport"
					        width="-1"/>
					<column type="field"
					        hidden="0"
					        name="airportheliport_href"
					        width="-1"/>
					<column type="field"
					        hidden="0"
					        name="aimingpoint"
					        width="-1"/>
					<column type="field"
					        hidden="0"
					        name="touchdownliftoff_href"
					        width="-1"/>
					<column type="field"
					        hidden="0"
					        name="runwaypoint"
					        width="-1"/>
					<column type="field"
					        hidden="0"
					        name="runwaycentrelinepoint_href"
					        width="-1"/>
					<column type="field"
					        hidden="0"
					        name="longitude"
					        width="-1"/>
					<column type="field"
					        hidden="0"
					        name="latitude"
					        width="-1"/>
					<column type="field"
					        hidden="0"
					        name="horizontalaccuracy"
					        width="-1"/>
					<column type="field"
					        hidden="0"
					        name="note"
					        width="-1"/>
					<column type="field"
					        hidden="0"
					        name="id"
					        width="-1"/>
					<column type="field"
					        hidden="0"
					        name="ts_id"
					        width="-1"/>
					<column type="field"
					        hidden="0"
					        name="tsp_id"
					        width="-1"/>
					<column type="field"
					        hidden="0"
					        name="interpretation"
					        width="-1"/>
					<column type="actions"
					        hidden="1"
					        width="-1"/>
				</columns>
			</attributetableconfig>
			<conditionalstyles>
				<rowstyles/>
				<fieldstyles/>
			</conditionalstyles>
			<storedexpressions/>
			<editform tolerant="1"/>
			<editforminit/>
			<editforminitcodesource>0</editforminitcodesource>
			<editforminitfilepath/>
			<editforminitcode/>
			<featformsuppress>0</featformsuppress>
			<editorlayout>tablayout</editorlayout>
			<attributeEditorForm>
				<labelStyle overrideLabelColor="0"
				            labelColor="0,0,0,255"
				            overrideLabelFont="0">
					<labelFont strikethrough="0"
					           underline="0"
					           style=""
					           description="Segoe UI,8,-1,5,50,0,0,0,0,0"
					           bold="0"
					           italic="0"/>
				</labelStyle>
				<attributeEditorContainer columnCount="1"
				                          collapsedExpressionEnabled="0"
				                          horizontalStretch="0"
				                          collapsedExpression=""
				                          type="Tab"
				                          showLabel="1"
				                          visibilityExpressionEnabled="0"
				                          name="feature"
				                          groupBox="0"
				                          collapsed="0"
				                          verticalStretch="0"
				                          visibilityExpression="">
					<labelStyle overrideLabelColor="0"
					            labelColor="0,0,0,255"
					            overrideLabelFont="0">
						<labelFont strikethrough="0"
						           underline="0"
						           style=""
						           description="Segoe UI,8,-1,5,50,0,0,0,0,0"
						           bold="0"
						           italic="0"/>
					</labelStyle>
					<attributeEditorContainer columnCount="1"
					                          collapsedExpressionEnabled="0"
					                          horizontalStretch="0"
					                          collapsedExpression=""
					                          type="GroupBox"
					                          showLabel="1"
					                          visibilityExpressionEnabled="0"
					                          name="generic"
					                          groupBox="1"
					                          collapsed="0"
					                          verticalStretch="0"
					                          visibilityExpression="">
						<labelStyle overrideLabelColor="0"
						            labelColor="0,0,0,255"
						            overrideLabelFont="0">
							<labelFont strikethrough="0"
							           underline="0"
							           style=""
							           description="Segoe UI,8,-1,5,50,0,0,0,0,0"
							           bold="0"
							           italic="0"/>
						</labelStyle>
						<attributeEditorField horizontalStretch="0"
						                      index="-1"
						                      showLabel="1"
						                      name="identifier"
						                      verticalStretch="0">
							<labelStyle overrideLabelColor="0"
							            labelColor="0,0,0,255"
							            overrideLabelFont="0">
								<labelFont strikethrough="0"
								           underline="0"
								           style=""
								           description="Segoe UI,8.25,-1,5,50,0,0,0,0,0"
								           bold="0"
								           italic="0"/>
							</labelStyle>
						</attributeEditorField>
						<attributeEditorField horizontalStretch="0"
						                      index="-1"
						                      showLabel="1"
						                      name="sequence_number"
						                      verticalStretch="0">
							<labelStyle overrideLabelColor="0"
							            labelColor="0,0,0,255"
							            overrideLabelFont="0">
								<labelFont strikethrough="0"
								           underline="0"
								           style=""
								           description="Segoe UI,8.25,-1,5,50,0,0,0,0,0"
								           bold="0"
								           italic="0"/>
							</labelStyle>
						</attributeEditorField>
						<attributeEditorField horizontalStretch="0"
						                      index="-1"
						                      showLabel="1"
						                      name="correction_number"
						                      verticalStretch="0">
							<labelStyle overrideLabelColor="0"
							            labelColor="0,0,0,255"
							            overrideLabelFont="0">
								<labelFont strikethrough="0"
								           underline="0"
								           style=""
								           description="Segoe UI,8,-1,5,50,0,0,0,0,0"
								           bold="0"
								           italic="0"/>
							</labelStyle>
						</attributeEditorField>
						<attributeEditorField horizontalStretch="0"
						                      index="-1"
						                      showLabel="1"
						                      name="valid_time_begin"
						                      verticalStretch="0">
							<labelStyle overrideLabelColor="0"
							            labelColor="0,0,0,255"
							            overrideLabelFont="0">
								<labelFont strikethrough="0"
								           underline="0"
								           style=""
								           description="Segoe UI,8,-1,5,50,0,0,0,0,0"
								           bold="0"
								           italic="0"/>
							</labelStyle>
						</attributeEditorField>
						<attributeEditorField horizontalStretch="0"
						                      index="-1"
						                      showLabel="1"
						                      name="valid_time_end"
						                      verticalStretch="0">
							<labelStyle overrideLabelColor="0"
							            labelColor="0,0,0,255"
							            overrideLabelFont="0">
								<labelFont strikethrough="0"
								           underline="0"
								           style=""
								           description="Segoe UI,8,-1,5,50,0,0,0,0,0"
								           bold="0"
								           italic="0"/>
							</labelStyle>
						</attributeEditorField>
						<attributeEditorField horizontalStretch="0"
						                      index="-1"
						                      showLabel="1"
						                      name="feature_lifetime_begin"
						                      verticalStretch="0">
							<labelStyle overrideLabelColor="0"
							            labelColor="0,0,0,255"
							            overrideLabelFont="0">
								<labelFont strikethrough="0"
								           underline="0"
								           style=""
								           description="Segoe UI,8,-1,5,50,0,0,0,0,0"
								           bold="0"
								           italic="0"/>
							</labelStyle>
						</attributeEditorField>
						<attributeEditorField horizontalStretch="0"
						                      index="-1"
						                      showLabel="1"
						                      name="feature_lifetime_end"
						                      verticalStretch="0">
							<labelStyle overrideLabelColor="0"
							            labelColor="0,0,0,255"
							            overrideLabelFont="0">
								<labelFont strikethrough="0"
								           underline="0"
								           style=""
								           description="Segoe UI,8,-1,5,50,0,0,0,0,0"
								           bold="0"
								           italic="0"/>
							</labelStyle>
						</attributeEditorField>
					</attributeEditorContainer>
					<attributeEditorContainer columnCount="1"
					                          collapsedExpressionEnabled="0"
					                          horizontalStretch="0"
					                          collapsedExpression=""
					                          type="GroupBox"
					                          showLabel="1"
					                          visibilityExpressionEnabled="0"
					                          name="attributes"
					                          groupBox="1"
					                          collapsed="0"
					                          verticalStretch="0"
					                          visibilityExpression="">
						<labelStyle overrideLabelColor="0"
						            labelColor="0,0,0,255"
						            overrideLabelFont="1">
							<labelFont strikethrough="0"
							           underline="0"
							           style=""
							           description="Segoe UI,8.25,-1,5,50,0,0,0,0,0"
							           bold="0"
							           italic="0"/>
						</labelStyle>
						<attributeEditorField horizontalStretch="0"
						                      index="-1"
						                      showLabel="1"
						                      name="designator"
						                      verticalStretch="0">
							<labelStyle overrideLabelColor="0"
							            labelColor="0,0,0,255"
							            overrideLabelFont="0">
								<labelFont strikethrough="0"
								           underline="0"
								           style=""
								           description="Segoe UI,8,-1,5,50,0,0,0,0,0"
								           bold="0"
								           italic="0"/>
							</labelStyle>
						</attributeEditorField>
						<attributeEditorField horizontalStretch="0"
						                      index="-1"
						                      showLabel="1"
						                      name="type"
						                      verticalStretch="0">
							<labelStyle overrideLabelColor="0"
							            labelColor="0,0,0,255"
							            overrideLabelFont="0">
								<labelFont strikethrough="0"
								           underline="0"
								           style=""
								           description="Segoe UI,8,-1,5,50,0,0,0,0,0"
								           bold="0"
								           italic="0"/>
							</labelStyle>
						</attributeEditorField>
						<attributeEditorField horizontalStretch="0"
						                      index="-1"
						                      showLabel="1"
						                      name="name"
						                      verticalStretch="0">
							<labelStyle overrideLabelColor="0"
							            labelColor="0,0,0,255"
							            overrideLabelFont="0">
								<labelFont strikethrough="0"
								           underline="0"
								           style=""
								           description="Segoe UI,8,-1,5,50,0,0,0,0,0"
								           bold="0"
								           italic="0"/>
							</labelStyle>
						</attributeEditorField>
					</attributeEditorContainer>
					<attributeEditorContainer columnCount="1"
					                          collapsedExpressionEnabled="0"
					                          horizontalStretch="0"
					                          collapsedExpression=""
					                          type="GroupBox"
					                          showLabel="1"
					                          visibilityExpressionEnabled="0"
					                          name="annotation"
					                          groupBox="1"
					                          collapsed="0"
					                          verticalStretch="0"
					                          visibilityExpression="">
						<labelStyle overrideLabelColor="0"
						            labelColor="0,0,0,255"
						            overrideLabelFont="0">
							<labelFont strikethrough="0"
							           underline="0"
							           style=""
							           description="MS Shell Dlg 2,8.25,-1,5,50,0,0,0,0,0"
							           bold="0"
							           italic="0"/>
						</labelStyle>
						<attributeEditorHtmlElement horizontalStretch="0"
						                            showLabel="0"
						                            name="annotation"
						                            verticalStretch="0">
							<labelStyle overrideLabelColor="0"
							            labelColor="0,0,0,255"
							            overrideLabelFont="0">
								<labelFont strikethrough="0"
								           underline="0"
								           style=""
								           description="Segoe UI,8,-1,5,50,0,0,0,0,0"
								           bold="0"
								           italic="0"/>
							</labelStyle>&lt;!DOCTYPE html>&#xd;&#xd;
&lt;html lang="en">&#xd;&#xd;
&lt;head>&#xd;&#xd;
  &lt;meta charset="UTF-8">&#xd;&#xd;
  &lt;title>Note List Viewer&lt;/title>&#xd;&#xd;
  &lt;style>&#xd;&#xd;
body {&#xd;&#xd;
  font-family: Arial, sans-serif;&#xd;&#xd;
  background-color: #323232;&#xd;&#xd;
  color: #e0e0e0;&#xd;&#xd;
  margin: 15px;&#xd;&#xd;
}&#xd;&#xd;
&#xd;&#xd;
h1 {&#xd;&#xd;
  font-size: 1.35em;&#xd;&#xd;
  color: #ffffff;&#xd;&#xd;
  margin-bottom: 15px;&#xd;&#xd;
}&#xd;&#xd;
&#xd;&#xd;
.note {&#xd;&#xd;
  background-color: #1e1e1e;&#xd;&#xd;
  border: 2px solid #3a9aed;&#xd;&#xd;
  padding: 12px;&#xd;&#xd;
  margin-bottom: 15px;&#xd;&#xd;
  box-shadow: 0 0 5px rgba(58, 154, 237, 0.2);&#xd;&#xd;
}&#xd;&#xd;
&#xd;&#xd;
.note-header {&#xd;&#xd;
  background-color: #2a2a2a;&#xd;&#xd;
  padding: 6px;&#xd;&#xd;
  border-radius: 2px;&#xd;&#xd;
  margin-bottom: 6px;&#xd;&#xd;
}&#xd;&#xd;
&#xd;&#xd;
.note-header h2,&#xd;&#xd;
.note-header p {&#xd;&#xd;
  margin: 0 0 4px 0;&#xd;&#xd;
  font-size: 1em;&#xd;&#xd;
  color: #4fc3f7;&#xd;&#xd;
}&#xd;&#xd;
&#xd;&#xd;
.note p {&#xd;&#xd;
  margin: 4px 0;&#xd;&#xd;
  color: #d0d0d0;&#xd;&#xd;
  font-size: 0.9em;&#xd;&#xd;
}&#xd;&#xd;
&#xd;&#xd;
.translated {&#xd;&#xd;
  margin-top: 8px;&#xd;&#xd;
  padding-left: 8px;&#xd;&#xd;
  border-left: 3px solid #4fc3f7;&#xd;&#xd;
}&#xd;&#xd;
&#xd;&#xd;
.translated-note {&#xd;&#xd;
  margin-bottom: 4px;&#xd;&#xd;
  color: #bbbbbb;&#xd;&#xd;
  font-size: 0.85em;&#xd;&#xd;
}&#xd;&#xd;
&#xd;&#xd;
.translated-note span {&#xd;&#xd;
  font-weight: bold;&#xd;&#xd;
  color: #ffffff;&#xd;&#xd;
}&#xd;&#xd;
  &lt;/style>&#xd;&#xd;
&lt;/head>&#xd;&#xd;
&lt;body>&#xd;&#xd;
  &lt;h1>Annotation&lt;/h1>&#xd;&#xd;
  &lt;div id="notes-container">Loading...&lt;/div>&#xd;&#xd;
&#xd;&#xd;
&lt;script>&#xd;&#xd;
  try {&#xd;&#xd;
    let raw = expression.evaluate("to_json(note)");&#xd;&#xd;
    let notes = JSON.parse(raw);&#xd;&#xd;
&#xd;&#xd;
    if (!Array.isArray(notes)) {&#xd;&#xd;
      notes = [notes];&#xd;&#xd;
    }&#xd;&#xd;
    notes = notes.filter(n => n !== null &amp;&amp; typeof n === 'object');&#xd;&#xd;
&#xd;&#xd;
    const container = document.getElementById('notes-container');&#xd;&#xd;
    container.innerHTML = '';&#xd;&#xd;
&#xd;&#xd;
    if (notes.length === 0) {&#xd;&#xd;
      container.textContent = '';&#xd;&#xd;
    } else {&#xd;&#xd;
      notes.forEach(note => {&#xd;&#xd;
        const div = document.createElement('div');&#xd;&#xd;
        div.className = 'note';&#xd;&#xd;
&#xd;&#xd;
        div.innerHTML = `&#xd;&#xd;
          &lt;div class="note-header">&#xd;&#xd;
            &lt;p>&lt;strong>Purpose:&lt;/strong> ${note.purpose}&lt;/p>&#xd;&#xd;
            &lt;p>&lt;strong>Property Name:&lt;/strong> ${note.propertyName}&lt;/p>&#xd;&#xd;
          &lt;/div>&#xd;&#xd;
          &lt;div class="translated">&#xd;&#xd;
            &lt;p>&lt;strong>Translated Notes:&lt;/strong>&lt;/p>&#xd;&#xd;
            ${&#xd;&#xd;
              Array.isArray(note.notes) &amp;&amp; note.notes.length > 0&#xd;&#xd;
                ? note.notes.map(n =>&#xd;&#xd;
                    `&lt;div class="translated-note">&#xd;&#xd;
                      &lt;span>[${n.lang}]&lt;/span> ${n.note}&#xd;&#xd;
                    &lt;/div>`).join('')&#xd;&#xd;
                : '&lt;em>None&lt;/em>'&#xd;&#xd;
            }&#xd;&#xd;
          &lt;/div>&#xd;&#xd;
        `;&#xd;&#xd;
&#xd;&#xd;
        container.appendChild(div);&#xd;&#xd;
      });&#xd;&#xd;
    }&#xd;&#xd;
  } catch (e) {&#xd;&#xd;
    document.getElementById('notes-container').textContent = "Error: " + e;&#xd;&#xd;
  }&#xd;&#xd;
&lt;/script>&#xd;&#xd;
&#xd;&#xd;
&lt;/body>&#xd;&#xd;
&lt;/html>&#xd;&#xd;
</attributeEditorHtmlElement>
					</attributeEditorContainer>
				</attributeEditorContainer>
				<attributeEditorContainer columnCount="1"
				                          collapsedExpressionEnabled="0"
				                          horizontalStretch="0"
				                          collapsedExpression=""
				                          type="Tab"
				                          showLabel="1"
				                          visibilityExpressionEnabled="0"
				                          name="location"
				                          groupBox="0"
				                          collapsed="0"
				                          verticalStretch="0"
				                          visibilityExpression="">
					<labelStyle overrideLabelColor="0"
					            labelColor="0,0,0,255"
					            overrideLabelFont="0">
						<labelFont strikethrough="0"
						           underline="0"
						           style=""
						           description="MS Shell Dlg 2,8.25,-1,5,50,0,0,0,0,0"
						           bold="0"
						           italic="0"/>
					</labelStyle>
					<attributeEditorField horizontalStretch="0"
					                      index="-1"
					                      showLabel="1"
					                      name="longitude"
					                      verticalStretch="0">
						<labelStyle overrideLabelColor="0"
						            labelColor="0,0,0,255"
						            overrideLabelFont="0">
							<labelFont strikethrough="0"
							           underline="0"
							           style=""
							           description="Segoe UI,8.25,-1,5,50,0,0,0,0,0"
							           bold="0"
							           italic="0"/>
						</labelStyle>
					</attributeEditorField>
					<attributeEditorField horizontalStretch="0"
					                      index="-1"
					                      showLabel="1"
					                      name="latitude"
					                      verticalStretch="0">
						<labelStyle overrideLabelColor="0"
						            labelColor="0,0,0,255"
						            overrideLabelFont="0">
							<labelFont strikethrough="0"
							           underline="0"
							           style=""
							           description="Segoe UI,8,-1,5,50,0,0,0,0,0"
							           bold="0"
							           italic="0"/>
						</labelStyle>
					</attributeEditorField>
					<attributeEditorField horizontalStretch="0"
					                      index="-1"
					                      showLabel="1"
					                      name="horizontalaccuracy"
					                      verticalStretch="0">
						<labelStyle overrideLabelColor="0"
						            labelColor="0,0,0,255"
						            overrideLabelFont="0">
							<labelFont strikethrough="0"
							           underline="0"
							           style=""
							           description="Segoe UI,8.25,-1,5,50,0,0,0,0,0"
							           bold="0"
							           italic="0"/>
						</labelStyle>
					</attributeEditorField>
				</attributeEditorContainer>
				<attributeEditorContainer columnCount="1"
				                          collapsedExpressionEnabled="0"
				                          horizontalStretch="0"
				                          collapsedExpression=""
				                          type="Tab"
				                          showLabel="1"
				                          visibilityExpressionEnabled="0"
				                          name="aimingPoint"
				                          groupBox="0"
				                          collapsed="0"
				                          verticalStretch="0"
				                          visibilityExpression="">
					<labelStyle overrideLabelColor="0"
					            labelColor="0,0,0,255"
					            overrideLabelFont="0">
						<labelFont strikethrough="0"
						           underline="0"
						           style=""
						           description="MS Shell Dlg 2,8.25,-1,5,50,0,0,0,0,0"
						           bold="0"
						           italic="0"/>
					</labelStyle>
					<attributeEditorField horizontalStretch="0"
					                      index="-1"
					                      showLabel="1"
					                      name="aimingpoint"
					                      verticalStretch="0">
						<labelStyle overrideLabelColor="0"
						            labelColor="0,0,0,255"
						            overrideLabelFont="0">
							<labelFont strikethrough="0"
							           underline="0"
							           style=""
							           description="Segoe UI,8.25,-1,5,50,0,0,0,0,0"
							           bold="0"
							           italic="0"/>
						</labelStyle>
					</attributeEditorField>
				</attributeEditorContainer>
				<attributeEditorContainer columnCount="1"
				                          collapsedExpressionEnabled="0"
				                          horizontalStretch="0"
				                          collapsedExpression=""
				                          type="Tab"
				                          showLabel="1"
				                          visibilityExpressionEnabled="0"
				                          name="airportHeliport"
				                          groupBox="0"
				                          collapsed="0"
				                          verticalStretch="0"
				                          visibilityExpression="">
					<labelStyle overrideLabelColor="0"
					            labelColor="0,0,0,255"
					            overrideLabelFont="0">
						<labelFont strikethrough="0"
						           underline="0"
						           style=""
						           description="MS Shell Dlg 2,8.25,-1,5,50,0,0,0,0,0"
						           bold="0"
						           italic="0"/>
					</labelStyle>
					<attributeEditorField horizontalStretch="0"
					                      index="-1"
					                      showLabel="1"
					                      name="airportheliport"
					                      verticalStretch="0">
						<labelStyle overrideLabelColor="0"
						            labelColor="0,0,0,255"
						            overrideLabelFont="0">
							<labelFont strikethrough="0"
							           underline="0"
							           style=""
							           description="Segoe UI,8.25,-1,5,50,0,0,0,0,0"
							           bold="0"
							           italic="0"/>
						</labelStyle>
					</attributeEditorField>
					<attributeEditorField horizontalStretch="0"
					                      index="-1"
					                      showLabel="1"
					                      name="airportheliport_href"
					                      verticalStretch="0">
						<labelStyle overrideLabelColor="0"
						            labelColor="0,0,0,255"
						            overrideLabelFont="0">
							<labelFont strikethrough="0"
							           underline="0"
							           style=""
							           description="Segoe UI,8,-1,5,50,0,0,0,0,0"
							           bold="0"
							           italic="0"/>
						</labelStyle>
					</attributeEditorField>
					<attributeEditorAction ActionUUID="{0f52155a-6bcb-4642-a5c2-2a23a928efcc}"
					                       horizontalStretch="0"
					                       showLabel="1"
					                       name="{00000000-0000-0000-0000-000000000000}"
					                       verticalStretch="0">
						<labelStyle overrideLabelColor="0"
						            labelColor="0,0,0,255"
						            overrideLabelFont="0">
							<labelFont strikethrough="0"
							           underline="0"
							           style=""
							           description="MS Shell Dlg 2,8.25,-1,5,50,0,0,0,0,0"
							           bold="0"
							           italic="0"/>
						</labelStyle>
					</attributeEditorAction>
				</attributeEditorContainer>
				<attributeEditorContainer columnCount="1"
				                          collapsedExpressionEnabled="0"
				                          horizontalStretch="0"
				                          collapsedExpression=""
				                          type="Tab"
				                          showLabel="1"
				                          visibilityExpressionEnabled="0"
				                          name="runwayPoint"
				                          groupBox="0"
				                          collapsed="0"
				                          verticalStretch="0"
				                          visibilityExpression="">
					<labelStyle overrideLabelColor="0"
					            labelColor="0,0,0,255"
					            overrideLabelFont="0">
						<labelFont strikethrough="0"
						           underline="0"
						           style=""
						           description="MS Shell Dlg 2,8.25,-1,5,50,0,0,0,0,0"
						           bold="0"
						           italic="0"/>
					</labelStyle>
					<attributeEditorField horizontalStretch="0"
					                      index="-1"
					                      showLabel="1"
					                      name="runwaypoint"
					                      verticalStretch="0">
						<labelStyle overrideLabelColor="0"
						            labelColor="0,0,0,255"
						            overrideLabelFont="0">
							<labelFont strikethrough="0"
							           underline="0"
							           style=""
							           description="Segoe UI,8.25,-1,5,50,0,0,0,0,0"
							           bold="0"
							           italic="0"/>
						</labelStyle>
					</attributeEditorField>
				</attributeEditorContainer>
			</attributeEditorForm>
			<editable>
				<field editable="1"
				       name="aimingpoint"/>
				<field editable="1"
				       name="airportheliport"/>
				<field editable="1"
				       name="airportheliport_href"/>
				<field editable="1"
				       name="correction_number"/>
				<field editable="1"
				       name="designator"/>
				<field editable="1"
				       name="feature_lifetime_begin"/>
				<field editable="1"
				       name="feature_lifetime_end"/>
				<field editable="1"
				       name="horizontalaccuracy"/>
				<field editable="1"
				       name="identifier"/>
				<field editable="1"
				       name="latitude"/>
				<field editable="1"
				       name="longitude"/>
				<field editable="1"
				       name="name"/>
				<field editable="1"
				       name="note"/>
				<field editable="1"
				       name="propertyname"/>
				<field editable="1"
				       name="purpose"/>
				<field editable="1"
				       name="row"/>
				<field editable="1"
				       name="runwaycentrelinepoint_href"/>
				<field editable="1"
				       name="runwaypoint"/>
				<field editable="1"
				       name="sequence_number"/>
				<field editable="1"
				       name="touchdownliftoff_href"/>
				<field editable="1"
				       name="type"/>
				<field editable="1"
				       name="valid_time_begin"/>
				<field editable="1"
				       name="valid_time_end"/>
			</editable>
			<labelOnTop>
				<field labelOnTop="0"
				       name="aimingpoint"/>
				<field labelOnTop="0"
				       name="airportheliport"/>
				<field labelOnTop="0"
				       name="airportheliport_href"/>
				<field labelOnTop="0"
				       name="correction_number"/>
				<field labelOnTop="0"
				       name="designator"/>
				<field labelOnTop="0"
				       name="feature_lifetime_begin"/>
				<field labelOnTop="0"
				       name="feature_lifetime_end"/>
				<field labelOnTop="0"
				       name="horizontalaccuracy"/>
				<field labelOnTop="0"
				       name="identifier"/>
				<field labelOnTop="0"
				       name="latitude"/>
				<field labelOnTop="0"
				       name="longitude"/>
				<field labelOnTop="0"
				       name="name"/>
				<field labelOnTop="0"
				       name="note"/>
				<field labelOnTop="0"
				       name="propertyname"/>
				<field labelOnTop="0"
				       name="purpose"/>
				<field labelOnTop="0"
				       name="row"/>
				<field labelOnTop="0"
				       name="runwaycentrelinepoint_href"/>
				<field labelOnTop="0"
				       name="runwaypoint"/>
				<field labelOnTop="0"
				       name="sequence_number"/>
				<field labelOnTop="0"
				       name="touchdownliftoff_href"/>
				<field labelOnTop="0"
				       name="type"/>
				<field labelOnTop="0"
				       name="valid_time_begin"/>
				<field labelOnTop="0"
				       name="valid_time_end"/>
			</labelOnTop>
			<reuseLastValue>
				<field reuseLastValue="0"
				       name="aimingpoint"/>
				<field reuseLastValue="0"
				       name="airportheliport"/>
				<field reuseLastValue="0"
				       name="airportheliport_href"/>
				<field reuseLastValue="0"
				       name="correction_number"/>
				<field reuseLastValue="0"
				       name="designator"/>
				<field reuseLastValue="0"
				       name="feature_lifetime_begin"/>
				<field reuseLastValue="0"
				       name="feature_lifetime_end"/>
				<field reuseLastValue="0"
				       name="horizontalaccuracy"/>
				<field reuseLastValue="0"
				       name="identifier"/>
				<field reuseLastValue="0"
				       name="latitude"/>
				<field reuseLastValue="0"
				       name="longitude"/>
				<field reuseLastValue="0"
				       name="name"/>
				<field reuseLastValue="0"
				       name="note"/>
				<field reuseLastValue="0"
				       name="propertyname"/>
				<field reuseLastValue="0"
				       name="purpose"/>
				<field reuseLastValue="0"
				       name="row"/>
				<field reuseLastValue="0"
				       name="runwaycentrelinepoint_href"/>
				<field reuseLastValue="0"
				       name="runwaypoint"/>
				<field reuseLastValue="0"
				       name="sequence_number"/>
				<field reuseLastValue="0"
				       name="touchdownliftoff_href"/>
				<field reuseLastValue="0"
				       name="type"/>
				<field reuseLastValue="0"
				       name="valid_time_begin"/>
				<field reuseLastValue="0"
				       name="valid_time_end"/>
			</reuseLastValue>
			<dataDefinedFieldProperties/>
			<widgets/>
			<previewExpression>"name"</previewExpression>
			<mapTip enabled="1"/>
		</maplayer>
	</maplayers>