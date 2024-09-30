import xml.etree.ElementTree as ET

def extract_specific_complex_types(xsd_file):
    # Parse the XSD file
    tree = ET.parse(xsd_file)
    root = tree.getroot()

    # Define the namespace map (adjust this based on your XSD file, if needed)
    namespaces = {'xs': 'http://www.w3.org/2001/XMLSchema'}  # Adjust if needed

    # Find all complexType elements in the XSD
    complex_types = root.findall('.//xs:complexType', namespaces)

    # Define the attributeGroup references we are looking for
    target_groups = {
        "gml:OwnershipAttributeGroup",
        "gml:AssociationAttributeGroup"
    }

    # Extract complexType names that have exactly these attributeGroup references
    matching_complex_types = []

    for complex_type in complex_types:
        attribute_groups = complex_type.findall('.//xs:attributeGroup', namespaces)
        # Extract all the "ref" attributes from the attributeGroup elements
        refs = {ag.get('ref') for ag in attribute_groups}
        
        # Check if the refs match exactly the target_groups (and no other refs)
        if refs == target_groups:
            name = complex_type.get('name')
            if name:
                matching_complex_types.append(name)

    return matching_complex_types

# Example usage
xsd_file = 'src/main/resources/a5_1_1/AIXM_Features.xsd'  # Replace with the path to your XSD file
matching_complex_type_names = extract_specific_complex_types(xsd_file)

print("Extracted complexType names with specific attributeGroups:")
for name in matching_complex_type_names:
    print('"'+ name + '",')
