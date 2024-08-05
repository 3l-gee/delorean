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
	<simpleType name="UomDistanceVerticalType">
		<restriction base="string">
			<enumeration value="FT"/>
			<enumeration value="M"/>
			<enumeration value="FL"/>
			<enumeration value="SM"/>
		</restriction>
	</simpleType>
""",
"""
	<simpleType name="UomDurationType">
		<restriction base="string">
			<enumeration value="HR"/>
			<enumeration value="MIN"/>
			<enumeration value="SEC"/>
		</restriction>
	</simpleType>
""",
"""
	<simpleType name="UomFLType">
		<restriction base="string">
			<enumeration value="FL"/>
			<enumeration value="SM"/>
		</restriction>
	</simpleType>
""",
""" 	
	<simpleType name="UomFrequencyType">
		<restriction base="string">
			<enumeration value="HZ"/>
			<enumeration value="KHZ"/>
			<enumeration value="MHZ"/>
			<enumeration value="GHZ"/>
		</restriction>
	</simpleType>
""",
"""
	<simpleType name="UomLightIntensityType">
		<restriction base="string">
			<enumeration value="CD"/>
		</restriction>
	</simpleType>
""",
"""
	<simpleType name="UomPressureType">
		<restriction base="string">
			<enumeration value="PA"/>
			<enumeration value="MPA"/>
			<enumeration value="PSI"/>
			<enumeration value="BAR"/>
			<enumeration value="TORR"/>
			<enumeration value="ATM"/>
			<enumeration value="HPA"/>
		</restriction>
	</simpleType>
""",    
"""	
	<simpleType name="UomSpeedType">
		<restriction base="string">
			<enumeration value="KM_H"/>
			<enumeration value="KT"/>
			<enumeration value="MACH"/>
			<enumeration value="M_MIN"/>
			<enumeration value="FT_MIN"/>
			<enumeration value="M_SEC"/>
			<enumeration value="FT_SEC"/>
			<enumeration value="MPH"/>
		</restriction>
	</simpleType>
""",
"""
	<simpleType name="UomTemperatureType">
		<restriction base="string">
			<enumeration value="C"/>
			<enumeration value="F"/>
			<enumeration value="K"/>
		</restriction>
	</simpleType>	
""",
"""
	<simpleType name="UomWeightType">
		<restriction base="string">
			<enumeration value="KG"/>
			<enumeration value="T"/>
			<enumeration value="LB"/>
			<enumeration value="TON"/>
		</restriction>
	</simpleType>
"""]

input_str_list_empty = [
"""

""",
"""

""",
"""

""",
""" 	

""",
"""

""",
"""

""",    
"""	

""",
"""

""",
"""

""",
"""

""",
"""

""",
"""

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