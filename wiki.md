```
 ██████╗  ███████╗ ██╗       ██████╗  ██████╗  ███████╗  █████╗  ███╗   ██╗ 
 ██╔══██╗ ██╔════╝ ██║      ██╔═══██╗ ██╔══██╗ ██╔════╝ ██╔══██╗ ████╗  ██║ 
 ██║  ██║ █████╗   ██║      ██║   ██║ ██████╔╝ █████╗   ███████║ ██╔██╗ ██║ 
 ██║  ██║ ██╔══╝   ██║      ██║   ██║ ██╔══██╗ ██╔══╝   ██╔══██║ ██║╚██╗██║ 
 ██████╔╝ ███████╗ ███████╗ ╚██████╔╝ ██║  ██║ ███████╗ ██║  ██║ ██║ ╚████║ 
 ╚═════╝  ╚══════╝ ╚══════╝  ╚═════╝  ╚═╝  ╚═╝ ╚══════╝ ╚═╝  ╚═╝ ╚═╝  ╚═══╝ 
```
# Introduction
The world of aeronautical data management is in transition from paper to digital products. This transition is supported by a standard, the Aeronautical Information Exchange Model (AIXM). While this standard provides guidance on how data should be stored and exchanged, the actual creation, manipulation or visualisation of such data is a challenge. 

While a range of commercial products offer based on AIXM exists, Delorean aims to fill a gap - providing an open source alternative to such tools. Delorean itself doesn't provide a way to edit or view the AIXM dataset, but it does allow a seamless transition between XML and PostgreSQL and vice versa by generating the necessary schema, tables, and loading / extracting the data to and from the database. Turning your PostgreSQL into an aeronautical database that can handel all the features found in AIXM. 

# Usage
All interaction is done through the command line interface (cli).  

## Start
To start using the application, you can run the following command, you can also run the verbose mode which will give you more information about the inner workings of Delorean. 
```bash
# Normal startup
java -jar delorean.jar

# Debuging mode (Verbose)
java -jar delorean.jar -v
```

## Contaniner
Delorean Works operates with containers, where each container functions like a folder with its own ID, schema, and dataset:
* ID: A unique identifier used to reference the container.
* Schema: Defines the data structure and validation rules.
* Dataset: The actual data, which is loaded separately using other functions.

To create a new container, type ```new``` followed by the reference to the schema you want to use:

- a5_1 - Schema Binding for [AIXM 5.1](https://aixm.aero/page/aixm-51-511)
- a5_1_1 - Schema Binding for [AIXM 5.1.1](https://aixm.aero/page/aixm-51-511)

The chosen schema affects:
* The type of data that can be loaded into the container.
* The database schema that is instantiated.
* The validation rules applied to the schema and dataset.

Example:
```bash
# New container with AIXM 5.1 schema
> new a5_1
[INFO] New container: 35591d
```

When using a tool, you can reference a specific container by appending its ID after the tool name. Alternatively, use ```-``` to refer to the last used container. This is true for any tool that needs a container to function. 

Examples:
```bash
# Reference a specific container
> xml_config 35591d a5_1
[INFO] XML configuration set

# Reference the last used container
> xml_config - a5_1
[INFO] XML configuration set
```

_In the Future, More container types will be available as AIXM supports a wide range of extensions. Some likely candidates include:_
* AIXM 5.2
* AIXM 5.1.1 ADR (Aerodrome-related extensions)

_Additionally, specific use cases of AIXM may be supported by introducing schemas with only a subset of features, optimizing XML and database configurations by generating only the required tables._

## Database Configuration

To establish a connection between our container and a databse we use ```db_config``` this function requires a configuration file that will steer wich feature, tables will be opned by the schema generation script. Aditionally we have to give additional information to define a connection with url, username, password and the hbm2ddl. 

- a5_1 - AIXM 5.1 features
- a5_1_1 - AIXM 5.1.1 features

```bash
# Establish a database connection
> db_config - a5_1
Feb 27, 2025 11:14:59 PM org.hibernate.Version logVersion
INFO: HHH000412: Hibernate ORM core version [WORKING]
Enter URL, [url:port/database] :                  # exemple : localhost:5432/delorean
Enter username :                                  # exemple : postgres
Enter password :                                  # exemple : postgres
Enter hbm2ddl, [create, update, validate, none] : # exemple : none
```
HBM2DDL stands for Hibernate Mapping to Data Definition Language. The hbm2ddl tool is used to automatically generate or update database schemas based on Hibernate entity mappings.

- create – Drops existing tables and creates new ones each time the application starts.
- update – Updates the existing schema without deleting data.
- validate – Verifies that the database schema matches the entity mappings but does not modify it.
- none – Disables automatic schema generation.

## XML Configuration

To load or extract XML data, a configuration file must also be defined. This is necessary because the way XML data is interpreted is through XML objects, which need to be unmarshalled (or marshalled when exporting). This process will generate a temporary file that contains all the required XML schema definition (XSD) wich are then loaded 

- a5_1 - xsd for AIXM 5.1
- a5_1_1 - xsd for AIXM 5.1.1

```bash
# Establish a database connection
> xml_config - a5_1
[INFO] XML configuration set
```

## xml

Xml records can either be imported or exported, this is only possible after successful xml configuration. Additionally something must exist so that it can be exported, it was either loaded by xml or exported from a database.

To load a dataset into delorean type ```xml``` followed by the id of the container ```35591d``` or to use the last container ``` - ``` finally enter the path where the dataset can be found. The format (aixm version) of the dataset must mutch the version you choose for your container and your xml_version. Extension that might be containted in your dataset will be ignored. 

```bash
# Import datset
> xml - load C:\Users\Downloads\aixm.xml
[INFO] Successfully unmarshalled
```

To export a dataset out of delorean type ```xml```, the id of the containter ```35591d``` or to use the last conatiner ``` - ``` finally enter the path where the dataset should be exported. The exported dataset will have the same format (aixm version) as the selected container version.

```bash
# Export datset
> xml - export C:\Users\Downloads\aixm.xml
[INFO] Successfully marshalled
```

## DB

While we have defined our database connection credential in ```db_config``` we haven't yet opened a connection. To open a connections type ```db```, the id of the container ```35591d``` or to use the container ``` - ``` finally type ```startup```. This process will first check if the databse exist, check that the credential are correct,  generate the required schema and extension (TODO link to psql schema generation), finally depending on what was selected in ```db_config``` for hbm2ddl option, it will apply its effect to the databse.
```bash
# Open a database connection
> db - startup
[INFO] Sucessfully generated schema and extensions
# Hibernate logs...
[INFO] Sucessfully generated mappings
```

To load the dataset type ```db```, the id of the container ```35591d``` or to use the container ``` - ``` finally type ```load```.

```bash
# Import dataset
> db - load
# INFO: Session Metrics { ... } 
[INFO] Sucessfully loaded
```

To export the content of the database type ```db```, the id of the container ```35591d``` or to use the container ``` - ```,  type ```export``` finally type the id of the root element you want to export, the root element beeing the AixmBasicMessage feature wich can be found in ```public.aixm_basic_message```.

```bash
# Export dataset
> db - export 1 
[INFO] Sucessfully exported
```

_In the future, there will be an option to filter the database extraction by time and feature type, this will be required as the database is supposed to store all timeslices but only correct and relavant timeslices should be exported in a aixm file. All the old slices should be filterd out and all the correction slices should be filtered out._

# Postgres & QGIS

AIXM is composed of two concepts the Aeronautical Information Conceptual Model (AICM) and the technical implementation of it (AIXM XSD). AICM is a UML-based model that describes classes and objects (AIXM UML), while the technical implementation (AIXM XSD) defines the hierarchical structure of features in greater detail. The main isssue beeing, we want to use aimx like it is show in the AICM but it must work following the technicall implementation of it (XSD). 

A good example of this is how AICM represents features as simple entities with attributes and components, whereas AIXM XSD structures features with a type containing a list of timeslice properties, each referencing a specific timeslice instance. All this is required so that featues can have a unique UUID but multiple timeslicess wiht different time period wich each have different attributes, additoonally differenty types of timeslicess as well as correction timeslices are allowed.

This is important as when viewing the data we have to recombine the data together to display it as close as possible to the AICM (for the viewer conviniens) and not how it is actually stored / structured (in databse or xml format). Delorean handels all the data in its AIXM form, this is also true for the schema that is generated in postgrSQL. This means directly viewing the tables serves almost no purpose. 

The solution is to generate Views or Materialized Views (or nested combinations of views) to reconstruct the AIXM data structure in a way that closely resembles the AICM. While an exact strategy has not yet been defined some exmple can be found in (TODO LINK TO psql view) wich comme close to the AICM. 

AIXM has strong GIS capabilities based on Geography Markup Language [gml](https://www.ogc.org/publications/standard/gml/) These elements require specialized handling, which is explained in (TODO: Dev Guide GIS/Adapter). These elemenet can not be used directly as they are for the most part incomplete and divided in parts. They can however be rendered with views (TODO psql gis view). These views are quite complicated as they cover all authorized GML usecases in AIXM. 

The difference between AIXM and AICM also impacts data generation. For example, modifying a feature should trigger the creation of a new timeslice, apply the change, and mark the old timeslice as closed.

_In the future, this could be managed using stored procedures in PostgreSQL, along with layouts and automated actions in QGIS._


# Development Guide

Delorean is as a wrapper with core functionality around containers that can hold schemas and data.

Delorean generates the AIXM ava bindings by using the JAXB toolset set, which can transform a schema definition file into Java bindings. These bindings are then wrapped with core functionality such as containers, and tools.

## Adapters

One of the main tasks of Delorean is to match each XML type with a PostgreSQL valid data type, in most cases this is easy (XML string => PostgreSQL varchar), however some XML types do not translate well in PostgreSQL and therefore need to be translated, additionally some translations are schema dependent or schema independent. In addition, the gis adapter requires helper functions, which are explained in the (TODO gis / helper).

## Helper

TODO

## Schema

TODO


## Org

The technical specification of AIXM is based on already existing standards (ISO 19139 / GML), these standards are used by the AIXM structure but kept separate. AIXM 5.1.1 and AIXM 5.1 both use the same ISO and GML version, so they share the same resource file.


# Architecture & Design

The concept of Delorean is heavily inspried from [Interlis](https://www.interlis.ch/en) wich also uses the idea of a sepatation between the schema and the dataset. The interlis schema is then used to validate the dataset as well as generating the database schema.
Interlis also allows user wiht minumum programming skills to geenrate their own schema that can be used in the different applications. 
Both Interlis and Deloran want to achieve the same goal : "How to make sure the dataset that are exchanged between system follow the same specification and how to validate them".

Delorean borrows these concepts but refines them to be applied to specific AIXM uses cases. 
 - export (filter : time, gis, features)

The softwear Architecture of Delorean is composed of two elements 

# Support & Community

TODO

# FAQ


