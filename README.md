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