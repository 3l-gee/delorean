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
    Message "1" -->     "1..*" Feature
    Feature "1" -->     "1..*" TimeSlice
    TimeSlice "1" -->   "1"  FeaturePropertyGroup
    FeaturePropertyGroup "1" --> "1..*" Object

    class Message {
        +sequenceNumber() int
    }

    class Feature {
        +Int isFeature
        +identifier() uuid
    }

    class TimeSlice {
        +uuid isTimeSlice
        +validTime() DateTime
        +interpretation() String
        +sequenceNumber() Int
        +correctionNumber() Int
    }

    class FeaturePropertyGroup {
        +id isPropertyGroup
        +featureLifetime() String
    }

    class Object {
        +id isComplexProperty
    }

    class Annotations {
        +propertyName() String
        +purpose() String
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