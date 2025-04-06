# CodeGen process
By having only one middle layer automatically generated between our DB and our export, we can build a complete application very quickly and arguably very securely by minimising hand-written code. However, this comes at a cost, as we have to build a machine to generate the code base, which is not trivial for complex XSD.

To achieve this, we have a number of tools at our disposal — most importantly, JAXB and the xjc compiler, which allow us to generate Java classes from an XSD. These generated classes form the backbone of our middle layer and provide marshalling and unmarshalling support out of the box. From there, we enrich the generated code with persistence logic, effectively bridging XML structure and our database schema with minimal manual effort.

## XSD Tweaking
XSD describes a data architecture in which base types are combined, extended and constrained. However, with some careful modification, we can adapt this architecture to suit our needs. We need to be careful that our changes do not break schema compatibility, violate semantic intent or namespace management. 

## xjc/JAXB
xjc/JAXB is a core technology in this process, enabling the automatic generation of Java classes from an XSD and providing built-in marshalling (Java to XML) and unmarshalling (XML to Java) capabilities. The xjc tool is the compiler that drives this transformation. It takes an XSD as input and produces a set of annotated Java classes that reflect the structure and constraints of the schema.

XJC/JAXB can be extended with (https://github.com/highsource/jaxb-tools) which offers advanced customisation and plugin support, particularly useful when working with complex or non-standard XSDs. XJB binding files, which JAXB allows you to use during codegen, also greatly increase your flexibility:

- Rename classes or fields
- Change Java type mappings
- Control package structure
- Suppress unnecessary class generation

## Exemple
These tools really start to show their strength when used together — combining XSD tweaking, xjc code generation, and XJB binding customization to integrate XML schema with database persistence logic.
Let’s walk through some common cases :

### Primary key for DB table
The xsd we want to process has a feature with a field name. this would be challenging to persist as each table needs a primary key column which in most cases is not only held on the database side but also on our middleware, however we do not want to change the required xml content someone would deliver to us (export / import). One solution is to add an id field to the xsd and instruct the xjc compiler to annotate with xmltransient annotation as well as the required hibernate annotation to allow this field to play its role as a primary key in the database.


xsd with tweak 
```
<xs:schema 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    targetNamespace="http://www.test.com"
    xmlns="http://www.test.com"
    elementFormDefault="qualified"
    attributeFormDefault="unqualified"
    version="1.0">

    <xs:complexType name="Feature">
        <xs:sequence>
            <!-- Tweak xsd by adding a id field -->
            <xs:element name="id" type="xs:long"/>      <!-- This will be our primary key -->
            <xs:element name="name" type="xs:string"/>  <!-- Just a name field -->
        </xs:sequence>
    </xs:complexType>

</xs:schema>
```

xjb content
```
<jaxb:bindings 
    xmlns:jaxb="http://java.sun.com/xml/ns/jaxb"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:annox="http://annox.dev.java.net"
    version="2.1">

    <!-- Bind to the schema -->
    <jaxb:bindings schemaLocation="schema.xsd">

        <!-- Target the 'id' element inside the 'Feature' complex type -->
        <jaxb:bindings node="xs:complexType[@name='Feature']//xs:element[@name='id']">

            <!-- Add JPA + JAXB annotations to the generated field -->
            <annox:annotate target="field">@jakarta.persistence.Id</annox:annotate>
            <annox:annotate target="field">@jakarta.persistence.GeneratedValue(strategy = jakarta.persistence.GenerationType.IDENTITY)</annox:annotate>
            <annox:annotate target="field">@jakarta.persistence.Column(name = "id", nullable = false)</annox:annotate>
            <annox:annotate target="field">@jakarta.xml.bind.annotation.XmlTransient</annox:annotate>

        </jaxb:bindings>
    </jaxb:bindings>
</jaxb:bindings>
```

### Adapters for complex field
Soemtimes the XML representation and the corresponding db datatypes do not go hand in hand. This is issue is crutial with gis feature that contain coordinates. We need to transforme data between our middlewear and our xml during the marshalling and unmarshalling phase. 

xsd schema
```
<xs:schema 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    targetNamespace="http://www.test.com"
    xmlns="http://www.test.com"
    elementFormDefault="qualified"
    attributeFormDefault="unqualified"
    version="1.0">

    <xs:complexType name="Feature">
        <xs:sequence>
            <!-- Represented as a string in XML -->
            <xs:element name="money" type="xs:string"/>
        </xs:sequence>
    </xs:complexType>

</xs:schema>
```
xjb content
```
<jaxb:bindings 
    xmlns:jaxb="http://java.sun.com/xml/ns/jaxb"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:annox="http://annox.dev.java.net"
    version="2.1">

    <jaxb:bindings schemaLocation="schema.xsd">

        <!-- Target the 'money' field in the Feature complex type -->
        <jaxb:bindings node="xs:complexType[@name='Feature']//xs:element[@name='money']">

            <!-- Use a custom Java type with an adapter -->
            <jaxb:javaType name="com.example.types.Money" />

            <!-- Optionally, annotate with persistence or JAXB annotations -->
            <annox:annotate target="field">@jakarta.persistence.Embedded</annox:annotate>
            <annox:annotate target="field">@jakarta.xml.bind.annotation.adapters.XmlJavaTypeAdapter(com.example.types.MoneyAdapter.class)</annox:annotate>

        </jaxb:bindings>
    </jaxb:bindings>
</jaxb:bindings>
```

This allows us to still treat the money field as a string in the xml, but use a special type internally.

## XSD to codegen
This step by step guide describes the process of using the ```util\manager.py``` tool.
  

1. Take XSD of your choice

LEXIC
| Word | Description |
| --- | --- |
|  | List all new or modified files |
| git diff | Show file differences that haven't been staged |
