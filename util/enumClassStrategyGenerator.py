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
	<simpleType name="CodeServiceInformationBaseType">
		<restriction base="string">
			<enumeration value="AFIS"/>
			<enumeration value="AIS"/>
			<enumeration value="ATIS"/>
			<enumeration value="BRIEFING"/>
			<enumeration value="FIS"/>
			<enumeration value="OFIS_VHF"/>
			<enumeration value="OFIS_HF"/>
			<enumeration value="NOTAM"/>
			<enumeration value="INFO"/>
			<enumeration value="RAF"/>
			<enumeration value="METAR"/>
			<enumeration value="SIGMET"/>
			<enumeration value="TWEB"/>
			<enumeration value="TAF"/>
			<enumeration value="VOLMET"/>
			<enumeration value="ALTIMETER"/>
			<enumeration value="ASOS"/>
			<enumeration value="AWOS"/>
		</restriction>
	</simpleType>
""",
"""
	<simpleType name="CodeServiceSARBaseType">
		<restriction base="string">
			<enumeration value="ALRS"/>
			<enumeration value="SAR"/>
			<enumeration value="RCC"/>
		</restriction>
	</simpleType>
""",
"""
	<simpleType name="CodeSideBaseType">
		<restriction base="string">
			<enumeration value="LEFT"/>
			<enumeration value="RIGHT"/>
			<enumeration value="BOTH"/>
		</restriction>
	</simpleType>
""",
""" 	
	<simpleType name="CodeSignalPerformanceILSBaseType">
		<restriction base="string">
			<enumeration value="I"/>
			<enumeration value="II"/>
			<enumeration value="III"/>
			<enumeration value="IIIA"/>
			<enumeration value="IIIB"/>
			<enumeration value="IIIC"/>
		</restriction>
	</simpleType>
""",
"""
	<simpleType name="CodeSpecialDateBaseType">
		<restriction base="string">
			<enumeration value="HOL"/>
			<enumeration value="BUSY_FRI"/>
		</restriction>
	</simpleType>
""",
"""
	<simpleType name="CodeSpecialNavigationStationBaseType">
		<restriction base="string">
			<enumeration value="MASTER"/>
			<enumeration value="SLAVE"/>
			<enumeration value="RED_SLAVE"/>
			<enumeration value="GREEN_SLAVE"/>
			<enumeration value="PURPLE_SLAVE"/>
		</restriction>
	</simpleType>
""",    
"""	
	<simpleType name="CodeSpecialNavigationSystemBaseType">
		<restriction base="string">
			<enumeration value="LORANA"/>
			<enumeration value="LORANC"/>
			<enumeration value="LORAND"/>
			<enumeration value="DECCA"/>
			<enumeration value="GNSS"/>
		</restriction>
	</simpleType>
""",
"""
	<simpleType name="CodeSpeedReferenceBaseType">
		<restriction base="string">
			<enumeration value="IAS"/>
			<enumeration value="TAS"/>
			<enumeration value="GS"/>
		</restriction>
	</simpleType>
""",
"""
	<simpleType name="CodeStandbyPowerBaseType">
		<restriction base="string">
			<enumeration value="BATTERY"/>
			<enumeration value="COMMERCIAL"/>
			<enumeration value="GENERATOR"/>
			<enumeration value="UNKNOWN"/>
			<enumeration value="NONE"/>
		</restriction>
	</simpleType>
""",
"""
	<simpleType name="CodeStatusAirportBaseType">
		<restriction base="string">
			<enumeration value="NORMAL"/>
			<enumeration value="LIMITED"/>
			<enumeration value="CLOSED"/>
		</restriction>
	</simpleType>
""",
"""
	<simpleType name="CodeStatusAirspaceBaseType">
		<restriction base="string">
			<enumeration value="AVBL_FOR_ACTIVATION"/>
			<enumeration value="ACTIVE"/>
			<enumeration value="IN_USE"/>
			<enumeration value="INACTIVE"/>
			<enumeration value="INTERMITTENT"/>
		</restriction>
	</simpleType>
""",
"""
	<simpleType name="CodeStatusConstructionBaseType">
		<restriction base="string">
			<enumeration value="IN_CONSTRUCTION"/>
			<enumeration value="COMPLETED"/>
			<enumeration value="DEMOLITION_PLANNED"/>
			<enumeration value="IN_DEMOLITION"/>
		</restriction>
	</simpleType>

""",
"""

""",
"""

""",
"""

""",
"""

"""]


for input_str in input_str_list:
    print(generate_jaxb_bindings(input_str))
    print("")