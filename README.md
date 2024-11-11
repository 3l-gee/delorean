# Delorean

The idea for Deloran came after realising how hard it is to work with temporal data, especially with aixm and how empty the opensource landscape is for such tools.

Delorean's goal is to facilitate the use, exchange and structuring of temporal data, it's goal is to be used in conjunction with QGIS and POSTGRES. 

- Stage 1 will demonstrate the implementation of xsd defined schema that can convert seamlessly from xml to postgres and inversly
- Stage 2 will add temporality tools that will allow diferenty types of temporal checks, tools and methodes
- Stage 3 will create a QGIS plugin to simplify the everyday use with temporal data
- Stage 4 goal is to abstract away from a specific schema and allow custom xsd defined schema to be used as data schema with temporal structures 

### Documentation

Temporal feature structure can be layered in *insert number* layers that each allow more but comme with an addition cost in complexity: 

**Layer 0** 
Data has no temporality associated with it

- Data is indefinitly Valid
- Changes are instantenious
- Exports are snapshots

```mermaid
gantt
    title Layer 0
    dateFormat  YYYY-MM-DD
    section Data
    Modification A :milestone, 2024-06-01,
    Existing Data A   :active,2024-01-01, 5M
    Modified Data A   :active, 7M
    Creation B        :milestone, 2024-04-01,
    Data B          :active,2024-04-01, 9M


    section Exports

    Export 1 / A :milestone, 2024-02-01,
    Export 2 / A &  B , :milestone, 2024-5-01,
    Export 3 / Mod_A, B, :milestone, 2024-10-01,
```

**Layer 1** 
Data can be temporary changed in the future (planned)

 - Decision date
 - Act date always in the future
 - Single Change allowed (current, next)

 
```mermaid
gantt
    title Layer 0
    dateFormat  YYYY-MM-DD

    section Data
    Decision Modification A :milestone, 2024-05-01,
    Planned Modification A :crit,2024-05-01,1M
    Act Modification A :milestone, 2024-06-01,

    Existing Data A   :active,2024-01-01, 5M
    Modified Data A   :active, 7M

    Creation B        :milestone, 2024-03-01,
    Planned Creation B :crit,2024-03-01,1M
    Act Creation B :milestone, 2024-04-01,
    Data B          :active,2024-04-01, 9M

    section Exports
    Export 1 / A :milestone, 2024-02-01,

    Act Export 2 :milestone, 2024-06-01,
    Planned Export 2 :crit,2024-05-01,1M
    Decision Export 2 :milestone, 2024-5-01,

    Export 3 / Mod_A, B, :milestone, 2024-10-01,
```

**Layer 2** 
Data can be temporary changed at any moment temporally

 - Decision date
 - Act date
 - Multiple change allowed (current, [stack])



### About

This temporal structure is achieved with a Feature / Timeslice / Property Structure : 

```mermaid
classDiagram
    %% Base Types (topo
    AbstractGMLType --|> AbstractFeatureType
    AbstractGMLType --|> AbstractAIXMObjectBaseType
    AbstractGMLType --|> AbstractTimeSliceType
    AbstractTimeSliceType --|> AbstractAIXMTimeSliceBaseType
    
    %% Derived Types
    AbstractFeatureType --|> DynamicFeatureType 
    DynamicFeatureType --|> AbstractAIXMFeatureBaseType

    %% AIXM Types
    AbstractAIXMFeatureBaseType --|> AbstractAIXMMessageBaseType
    AbstractAIXMMessageBaseType --|> AbstractAIXMMessageType
    AbstractAIXMFeatureBaseType --|> AbstractAIXMFeatureType
    AbstractAIXMObjectBaseType --|> AbstractAIXMObjectType
    AbstractAIXMTimeSliceBaseType --|> AbstractAIXMTimeSliceType

    %% Final Implementations
    AbstractAIXMObjectType --|> AbstractAIXMObject
    AbstractAIXMFeatureType --|> AbstractAIXMFeature

    %% Class Declarations
    class AbstractGMLType {

    }
    class AbstractFeatureType { 

    }
    class AbstractTimeSliceType { 

    }
    class DynamicFeatureType { 

    }
    class AbstractAIXMFeatureBaseType { 

    }
    class AbstractAIXMMessageBaseType {

    }
    class AbstractAIXMObjectBaseType { 

    }
    class AbstractAIXMTimeSliceBaseType {

    }
    class AbstractAIXMMessageType { 

    }
    class AbstractAIXMFeatureType { 

    }
    class AbstractAIXMObjectType { 

    }
    class AbstractAIXMPropertyType { 

    }
    class AbstractAIXMTimeSliceType { 

    }
    class AbstractAIXMFeature { 

    }
    class AbstractAIXMObject { 

    }
```

```mermaid
classDiagram
    class AIXMMessage
    style AIXMMessage fill:#1b2847
    class AIXMPropertyGroup
    style AIXMPropertyGroup fill:#3a3447
    class AIXMTimeSlice
    style AIXMTimeSlice fill:#3a3447
    class AIXMFeature
    style AIXMFeature fill:#3a3447
    class AIXMObject
    style AIXMObject fill:#3a3447

    %% AIXM Message Relationship with Features
    AIXMMessage o-- AIXMFeature
    AIXMFeature --|> ConcreteFeatureType
    AIXMTimeSlice --|> ConcreteTimeSliceType
    AIXMPropertyGroup --|> SecondConcretePropertyType
    AIXMObject --|> ConcreteObjectType

    %% Compositions between concrete types
    ConcreteFeatureType --* FirstConcretePropertyType
    FirstConcretePropertyType --* ConcreteTimeSliceType
    ConcreteTimeSliceType --* SecondConcretePropertyType
    SecondConcretePropertyType --* ConcreteObjectType
    ConcreteObjectType --* ThirdConcretePropertyType

    %% Class Definitions
    class AIXMMessage { 
        +List~AIXMFeature~ Features
        +metadata
    }

    class AIXMPropertyGroup { 
        <<AbstractAIXMPropertyType>>
    }

    class AIXMTimeSlice { 
        <<AbstractAIXMTimeSliceType>>
    }

    class AIXMFeature { 
        <<AbstractAIXMFeature>>
    }

    class AIXMObject { 
        <<AbstractAIXMObject>>
    }

    class ConcreteFeatureType {
        +List~FirstConcretePropertyType~ TimeSlice
    }

    class FirstConcretePropertyType {
        +bool owns
        +ConcreteTimeSliceType ConcreteTimeSlice
    }

    class ConcreteTimeSliceType {
        +SecondConcretePropertyType ConcreteProperty
    }

    class SecondConcretePropertyType {
        +ConcreteObjectType ConcreteObject
    }

    class ConcreteObjectType {
        +ThirdConcretePropertyType ConcreteProperty
    }

    class ThirdConcretePropertyType {
    }
```

```mermaid
classDiagram
    class AbstractGMLType
    style AbstractGMLType fill:#3a3447
    class AbstractGeometryType
    style AbstractGeometryType fill:#3a3447
    class AbstractGeometricPrimitiveType
    style AbstractGeometricPrimitiveType fill:#3a3447
    class AbstractSurfaceType
    style AbstractSurfaceType fill:#3a3447
    class AbstractCurveType
    style AbstractCurveType fill:#3a3447
    class gmlSurfaceType
    style gmlSurfaceType fill:#3a3447
    class gmlPointType
    style gmlPointType fill:#3a3447
    class gmlCurveType
    style gmlCurveType fill:#3a3447

    AbstractGMLType --|> AbstractGeometryType
    AbstractGeometryType --|> AbstractGeometricPrimitiveType
    AbstractGeometricPrimitiveType --|> gmlPointType
    AbstractGeometricPrimitiveType --|> AbstractSurfaceType
    AbstractGeometricPrimitiveType --> AbstractCurveType
    AbstractSurfaceType --|> gmlSurfaceType
    AbstractCurveType --> gmlCurveType

    gmlSurfaceType --|> SurfaceType
    gmlPointType --|> PointType
    gmlCurveType --|> CurveType


    PointType --|> ElevatedPointType
    SurfaceType --|> ElevatedSurfaceType
    CurveType --|> ElevatedCurveType


    class AbstractGMLType{
        <<abstract>>
    }
    
    class AbstractGeometryType{
        <<abstract>>
    }
    
    class AbstractGeometricPrimitiveType{
        <<abstract>>
    }

    class AbstractSurfaceType{
        <<abstract>>
    }

    class AbstractCurveType{
        <<abstract>>
    }

    class gmlPointType{
        <<abstract>>
    }

    class gmlSurfaceType{
        <<abstract>>
    }

    class gmlCurveType{
        <<abstract>>
    }

    class PointType{

    }

    class SurfaceType{

    }

    class CurveType {

    }

    class ElevatedSurfaceType{

    }

    class ElevatedCurveType{

    }
```

```mermaid
classDiagram
    DirectPositionType --* gml_PointType
    gml_PointType --> PointType
    AbstractAIXMPropertyType --> PointPropertyType
    PointType --* PointPropertyType

    class gml_PointType {
        DirectPositionType pos
        String id
        String srsName
        BigInteger srsDimension
        List[String] axisLabels
        List[String] uomLabels
    }

    class DirectPositionType {
        List[Double] value
    }

    class AbstractAIXMPropertyType {
        enum nilReason
    }

    class PointType {
        float horizontalAccuracy
        string annotation
    }

    class PointPropertyType {
        PointType point
        string horizontalAccuracy
        list[string] annotation
    }
```


### Goal

**AIXM Version covered :**
* [ ] Versions
    * [ ] 5_2
    * [x] 5_1_1
    * [ ] 5_1
    * [ ] 5_0
    * [ ] 4_5

**Functions :**
* [x] Load
    * [x] xml
    * [ ] psql
* [ ] Export
    * [x] xml
    * [ ] psql
* [ ] Edit
* [ ] Format
* [ ] Transform
* [ ] Validate
* [ ] Extract
* [ ] Core

### HLA

delorean interaction Map
```mermaid
classDiagram

    note "CRUD : 
    Create
    Read
    Update
    Delete"

    note "FEVI : 
    Format
    Extract
    Validate
    Import"

    class QGIS {
    }

    class delorean {
    }


    class DB {
        
    }

    class AIXM{

    }

    class User{

    }

    class Admin {

    }
     
    class Data {

    }
    class Product {

    }
    
    Data <--> QGIS
    Product <--> QGIS
    QGIS <--> DB : CRUD
    DB <--> delorean : FEVI
    User <--> QGIS
    delorean <--> Admin
    delorean <--> AIXM

```


delorean capability Map
```mermaid
mindmap
    root((delorean))
        Format 
            DB
        Validate
            Schema 
            Data Type
            Business Rules
        Transform
        Export
            AIXM
            DB
        Import
            AIXM
            DB
        Interaction
            Create
            Read
            Update
            Delete
```

xsd / xjb processing tree

```mermaid
---
title : xsd to xjb annotation for any.xsd fields annotation
---
flowchart LR
classDef simple fill:#4a3e59
classDef simple_pending fill:#6b3e2b
classDef group fill:#4a3e59
classDef group_pending fill:#6b3e2b
classDef complex fill:#4a3e59
classDef complex_pending fill:#6b3e2b
classDef complex_manual fill:#2a5445


any.xsd
END_A:::simple
END_B:::group
END_C:::complex

any.xsd -- tag --> field
field -- tag? --> simpleType
field -- tag? --> group
field -- tag? --> complexType
field -- tag? --> import
field -- tag? --> annotation
field -- tag? --> include

import --> pass[*pass*]
annotation --> pass
include --> pass
%% field -- tag? --> element

%% simpleType
simpleType --> SIMPLE:::simple
SIMPLE --base?--> string
SIMPLE --base?--> decimal
SIMPLE --base?--> integer
SIMPLE --base?--> boolean
SIMPLE --base?--> date
SIMPLE --base?--> time
string --> persistence_A[*persistence*]
persistence_A --enumeration?--> ENUM_START:::simple
persistence_A --restriction?--> COLUMN_A[COLUMN]:::simple
COLUMN_A --size?--> SIZE:::simple_pending
COLUMN_A --pattern?--> PATTERN:::simple_pending

ENUM_START --members?--> ENUM_MEMBER:::simple
ENUM_MEMBER --> ENUM_END:::simple
ENUM_END --> END_A[END]
COLUMN_A[COLUMN] --> END_A
SIZE --> END_A
PATTERN --> END_A

%% group
group --findall--> element_A[element]
element_A --foreach--> GROUP:::group
GROUP --> ELEMENT_C[ELEMENT]:::group
ELEMENT_C --> persistence_B[*persistence*]
persistence_B --name=name?--> PROPERTY_NAME:::group
PROPERTY_NAME --ignore?--> TRANSIENT_DB:::group
PROPERTY_NAME --embeded?--> EMBEDED:::group
PROPERTY_NAME --unbounded?--> ONE_TO_MANY:::group
PROPERTY_NAME --bounded=1?--> COLUMN_B[COLUMN]:::group
TRANSIENT_DB --> END_B[END]
EMBEDED --> END_B
ONE_TO_MANY --> END_B
COLUMN_B --> END_B

%% complextype
complexType --findall--> attribute
complexType --findall--> element_B[element]

attribute --foreach--> COMPLEX_A[COMPLEX]:::complex
COMPLEX_A --> ATTRIBUTE:::complex
ATTRIBUTE --> NAME_A[NAME]:::complex

element_B --foreach--> COMPLEX_B[COMPLEX]:::complex
COMPLEX_B --> ELEMENT:::complex
ELEMENT --> NAME_B[NAME]:::complex

ELEMENT --> REF:::complex

NAME_B --> persistence_C[*persistence*]
NAME_A --> persistence_C[*persistence*]
REF --> persistence_C[*persistence*]

persistence_C --ignore?--> IDTRANSIENT_DB_A[TRANSIENT_DB]:::complex
persistence_C --embeded?--> EMBEDDED:::complex
persistence_C --unbounded?--> ONE_TO_MANY_A[ONE_TO_MANY]:::complex
persistence_C --bounded=1?--> ONE_TO_ONE:::complex
persistence_C --adapter?-->JAVA_TYPE:::complex_manual
persistence_C --dbid?--> ID_A[ID]:::complex

JAVA_TYPE --> XML_ELEMENT:::complex_manual
JAVA_TYPE --> XML_ELEMENT_REF:::complex_manual
XML_ELEMENT --> ONE_TO_ONE_A[ONE_TO_ONE]:::complex_manual
XML_ELEMENT_REF --> ONE_TO_ONE_A
ONE_TO_ONE_A --> JOIN_COLUMN_A[JOIN_COLUMN]:::complex_manual
JOIN_COLUMN_A --> JAVA_TYPE_ADAPTER:::complex_manual

ID_A --> GENERATED_IDENTITY:::complex
ID_A --> GENERATED_SEQUENCE:::complex
GENERATED_SEQUENCE --> SEQUENCE_GENERATOR:::complex
SEQUENCE_GENERATOR --> COLUMN_C[COLUMN]:::complex
GENERATED_IDENTITY --> COLUMN_C:::complex
COLUMN_C --> TRANSIENT_XML:::complex

ONE_TO_ONE --> JOIN_COLUMN:::complex

ONE_TO_MANY_A --> END_C[END]
JAVA_TYPE_ADAPTER --> END_C
JOIN_COLUMN --> END_C
IDTRANSIENT_DB_A --> END_C
EMBEDDED --> END_C
TRANSIENT_XML --> END_C

END_C
```

```mermaid
---
title : xsd to xjb annotation for any.xsd class annotations
---
flowchart LR
classDef simple fill:#4a3e59
classDef simple_pending fill:#6b3e2b
classDef group fill:#4a3e59
classDef group_pending fill:#6b3e2b
classDef complex fill:#4a3e59
classDef complex_pending fill:#6b3e2b
classDef complex_manual fill:#2a5445

any.xsd

any.xsd -- tag --> class_[class]
%% any.xsd -- tag --> class_[class]

class_[class] -- tag? --> simpleType_A[simpleType]
class_[class] -- tag? --> group_A[group]
class_[class] -- tag? --> complexType_A[complexType]
class_[class] -- tag? --> import_A[import]
class_[class] -- tag? --> annotation_A[annotation]
class_[class] -- tag? --> include_A[include]
class_[class] -- tag? --> element_A[element]

import_A --> pass[*pass*]
annotation_A --> pass
include_A --> pass
element_A --> pass
group_A --> pass
simpleType_A --> pass

%% complexType
complexType_A --> COMPLEX:::complex
COMPLEX --superclass?--> MAPPEDSUPERCLASS:::complex
COMPLEX --ignore?--> TRANSIENT_DB:::complex
COMPLEX --embedable?--> EMBEDDABLE:::complex
COMPLEX --inheritance?--> TABLE_PER_CLASS:::complex
COMPLEX --entity?--> ENTITY:::complex

ENTITY --> TABLE:::complex
TABLE --root?--> XML_ROOT:::complex_manual

EMBEDDABLE --adapter?--> XML_TYPE:::complex_manual
ENTITY --adapter?--> XML_TYPE:::complex_manual



MAPPEDSUPERCLASS --> END:::complex
TRANSIENT_DB --> END:::complex
EMBEDDABLE --> END:::complex
XML_TYPE --> END:::complex
TABLE_PER_CLASS --> END:::complex
TABLE --> END:::complex
XML_ROOT --> END:::complex

```