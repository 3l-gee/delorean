
# Container

The container structure is complex as each "Container" must be abel to be customized with :
- Schema
- XMLBinding
- DBbinding
- Validation



´´´mermaid
classDiagram
    class ContainerWarehouse {
        -List~Container~ containers
        +importData()
        +exportData()
        +formatData()
        +validateData()
    }

    class Container {
        -SchemaConfig schemaConfig
        -ValidationConfig validationConfig
        -FormattingConfig formattingConfig
        -Data data
        +importData()
        +exportData()
        +formatData()
        +validateData()
    }

    class SchemaConfig {
        +parameters: List~Parameter~
        +applySchema()
    }

    class ValidationConfig {
        +parameters: List~Parameter~
        +validateData()
    }

    class FormattingConfig {
        +parameters: List~Parameter~
        +applyFormatting()
    }

    class Data {
        +content: Any
    }

    class SchemaConfigFactory {
        +createSchemaConfig(): SchemaConfig
    }

    class ValidationConfigFactory {
        +createValidationConfig(): ValidationConfig
    }

    class FormattingConfigFactory {
        +createFormattingConfig(): FormattingConfig
    }

    class XMLBinding {
        +loadFromXML()
        +exportToXML()
        +applyXMLSchema()
        +validateXMLData()
    }

    class DBBinding {
        +loadFromDB()
        +exportToDB()
        +applyDBSchema()
        +validateDBData()
    }

    ContainerWarehouse --> Container : holds
    Container --> SchemaConfig : uses
    Container --> ValidationConfig : uses
    Container --> FormattingConfig : uses
    Container --> Data : holds

    SchemaConfigFactory --> SchemaConfig : creates
    ValidationConfigFactory --> ValidationConfig : creates
    FormattingConfigFactory --> FormattingConfig : creates

    Container --> XMLBinding : uses
    Container --> DBBinding : uses
´´´