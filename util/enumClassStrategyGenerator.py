import re

def generate_jaxb_bindings(input_str):
    # Extract the simpleType name
    type_name_match = re.search(r'<simpleType name="([^"]+)', input_str)
    type_name = type_name_match.group(1) if type_name_match else ""

    # Extract the enumeration values
    enum_values = re.findall(r'<enumeration value="([^"]+)', input_str)

    # Generate the output string
    jaxb_bindings = f'\t\t<jaxb:bindings node="//xs:simpleType[@name=\'{type_name}\']">\n'
    jaxb_bindings += f'\t\t\t<jaxb:typesafeEnumClass name="{type_name}">\n'
    for value in enum_values:
        jaxb_bindings += f'\t\t\t\t<jaxb:typesafeEnumMember name="{value}" value="{value}"/>\n'
    jaxb_bindings += f'\t\t\t</jaxb:typesafeEnumClass>\n'
    jaxb_bindings += f'\t\t</jaxb:bindings>'

    return jaxb_bindings

# Example usage
input_str_list = [
"""
	<simpleType name="CodeNavigationAreaBaseType">
		<restriction base="string">
			<enumeration value="PNA"/>
			<enumeration value="OMNI"/>
			<enumeration value="DVA"/>
		</restriction>
	</simpleType>
""",
"""
	<simpleType name="CodeNavigationAreaRestrictionBaseType">
		<restriction base="string">
			<enumeration value="VECTOR"/>
			<enumeration value="OMNIDIRECTIONAL"/>
		</restriction>
	</simpleType>
""",
"""
	<simpleType name="CodeNavigationEquipmentBaseType">
		<restriction base="string">
			<enumeration value="DME"/>
			<enumeration value="VOR_DME"/>
			<enumeration value="DME_DME"/>
			<enumeration value="TACAN"/>
			<enumeration value="ILS"/>
			<enumeration value="MLS"/>
			<enumeration value="GNSS"/>
			<enumeration value="WAAS"/>
			<enumeration value="LORAN"/>
			<enumeration value="INS"/>
			<enumeration value="FMS"/>
		</restriction>
	</simpleType>
""",
""" 	
<simpleType name="CodeNavigationSpecificationBaseType">
		<restriction base="string">
			<enumeration value="RNAV_10"/>
			<enumeration value="RNAV_5"/>
			<enumeration value="RNAV_2"/>
			<enumeration value="RNAV_1"/>
			<enumeration value="RNP_4"/>
			<enumeration value="RNP_2"/>
			<enumeration value="BASIC_RNP_1"/>
			<enumeration value="ADVANCED_RNP_1"/>
			<enumeration value="RNP_APCH"/>
			<enumeration value="RNP_AR_APCH"/>
		</restriction>
	</simpleType>

""",
"""
	<simpleType name="CodeNitrogenBaseType">
		<restriction base="string">
			<enumeration value="LPNG"/>
			<enumeration value="HPNG"/>
			<enumeration value="LHNG"/>
			<enumeration value="LNG"/>
			<enumeration value="NGRB"/>
			<enumeration value="HNGRB"/>
			<enumeration value="LNGRB"/>
			<enumeration value="NG"/>
		</restriction>
	</simpleType>
""",
"""
	<simpleType name="CodeNorthReferenceBaseType">
		<restriction base="string">
			<enumeration value="TRUE"/>
			<enumeration value="MAG"/>
			<enumeration value="GRID"/>
		</restriction>
	</simpleType>
""",    
"""	
    <simpleType name="CodeNotePurposeBaseType">
		<restriction base="string">
			<enumeration value="DESCRIPTION"/>
			<enumeration value="REMARK"/>
			<enumeration value="WARNING"/>
			<enumeration value="DISCLAIMER"/>
		</restriction>
	</simpleType>
""",
"""
	<simpleType name="CodeObstacleAreaBaseType">
		<restriction base="string">
			<enumeration value="AREA1"/>
			<enumeration value="AREA2"/>
			<enumeration value="AREA3"/>
			<enumeration value="AREA4"/>
			<enumeration value="OLS"/>
			<enumeration value="FAR77"/>
			<enumeration value="MANAGED"/>
		</restriction>
	</simpleType>
""",
"""
	<simpleType name="CodeObstacleAssessmentSurfaceBaseType">
		<restriction base="string">
			<enumeration value="40_TO_1"/>
			<enumeration value="72_TO_1"/>
			<enumeration value="MA"/>
			<enumeration value="FINAL"/>
			<enumeration value="PT_ENTRY_AREA"/>
			<enumeration value="PRIMARY"/>
			<enumeration value="SECONDARY"/>
			<enumeration value="ZONE1"/>
			<enumeration value="ZONE2"/>
			<enumeration value="ZONE3"/>
			<enumeration value="AREA1"/>
			<enumeration value="AREA2"/>
			<enumeration value="AREA3"/>
			<enumeration value="TURN_INITIATION"/>
			<enumeration value="TURN"/>
			<enumeration value="DER"/>
		</restriction>
	</simpleType>
""",
"""
	<simpleType name="CodeObstructionIdSurfaceZoneBaseType">
		<restriction base="string">
			<enumeration value="APPROACH"/>
			<enumeration value="CONICAL"/>
			<enumeration value="HORIZONTAL"/>
			<enumeration value="PRIMARY"/>
			<enumeration value="TRANSITION"/>
		</restriction>
	</simpleType>
""",
"""
	<simpleType name="CodeOilBaseType">
		<restriction base="string">
			<enumeration value="PISTON"/>
			<enumeration value="TURBO"/>
			<enumeration value="HYDRAULIC"/>
		</restriction>
	</simpleType>
""",
"""
	<simpleType name="CodeOperationAirportHeliportBaseType">
		<restriction base="string">
			<enumeration value="LANDING"/>
			<enumeration value="TAKEOFF"/>
			<enumeration value="TOUCHGO"/>
			<enumeration value="TRAIN_APPROACH"/>
			<enumeration value="ALTN_LANDING"/>
			<enumeration value="AIRSHOW"/>
			<enumeration value="ALL"/>
		</restriction>
	</simpleType>
""",
"""
	<simpleType name="CodeOperationManoeuvringAreaBaseType">
		<restriction base="string">
			<enumeration value="LANDING"/>
			<enumeration value="TAKEOFF"/>
			<enumeration value="TOUCHGO"/>
			<enumeration value="TRAIN_APPROACH"/>
			<enumeration value="TAXIING"/>
			<enumeration value="CROSSING"/>
			<enumeration value="AIRSHOW"/>
			<enumeration value="ALL"/>
		</restriction>
	</simpleType>
""",
"""
	<simpleType name="CodeOrganisationBaseType">
		<restriction base="string">
			<enumeration value="STATE"/>
			<enumeration value="STATE_GROUP"/>
			<enumeration value="ORG"/>
			<enumeration value="INTL_ORG"/>
			<enumeration value="ACFT_OPR"/>
			<enumeration value="HANDLING_AGENCY"/>
			<enumeration value="NTL_AUTH"/>
			<enumeration value="ATS"/>
			<enumeration value="COMMERCIAL"/>
		</restriction>
	</simpleType>
""",
"""
	<simpleType name="CodeOrganisationHierarchyBaseType">
		<restriction base="string">
			<enumeration value="MEMBER"/>
			<enumeration value="OWNED_BY"/>
			<enumeration value="SUPERVISED_BY"/>
		</restriction>
	</simpleType>
""",
"""
	<simpleType name="CodeOxygenBaseType">
		<restriction base="string">
			<enumeration value="LPOX"/>
			<enumeration value="HPOX"/>
			<enumeration value="LHOX"/>
			<enumeration value="LOX"/>
			<enumeration value="OXRB"/>
			<enumeration value="HOXRB"/>
			<enumeration value="LOXRB"/>
			<enumeration value="OX"/>
		</restriction>
	</simpleType>
"""]


for input_str in input_str_list:
    print(generate_jaxb_bindings(input_str))
    print("")