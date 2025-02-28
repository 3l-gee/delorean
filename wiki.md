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

While a range of commercial products offer based on AIXM exists, Delorean aims to fill a gap - providing an open source alternative to such tools. Delorean itself doesn't provide a way to edit or view the AIXM dataset, but it does allow a seamless transition between XML and PostgreSQL and vise versa by generating the necessary schema, tables, and loading / extracting the data to and from the tables. Turning your PostgreSQL into a Aeronautical Database that can handel any features found in aixm. _In the future We can expect views and stored procedures to be initialised as well, which would make data generation and visualisation much easier. This is particularly important for features that follow the timeslice data structure._ Currently, a limited number of views have been created to cover some common use cases of aixm (vertical structure, airport, navaid). 

# Usage

All interaction are all made through the command-line interface (cli).  

## Start
To start using the application, you can run the following command:
```bash
# Normal startup
java -jar delorean.jar

# Debuging mode (Verbose)
java -jar delorean.jar -v
```

## Contaniner
Now we want to open a container, each container can be seen as folder that has it own id, schema and dataset. The id is used as a unique identifier when referencing the container. The schema defines the schema data structure to be used. Possible options are 

- a5_1 - Schema Binding for [AIXM 5.1](https://aixm.aero/page/aixm-51-511)
- a5_1_1 - Schema Binding for [AIXM 5.1.1](https://aixm.aero/page/aixm-51-511)

This will affect the type of data that can be loaded into the container, as well as the validation rules for the schema and the dataset. The dataset itself can only be loaded by other functions
```bash
# New container with AIXM 5.1 schema
> new a5_1
[INFO] New container: 35591d
```

To refer to a specific container when using a tool, the id is written after the tool name. Additionally "-" can be used to refer to the last used container. This is true for any tool that needs a container to function. 

```bash
# Reference a specific container
> xml_config 35591d a5_1
[INFO] XML configuration set

# Reference the last used container
> xml_config - a5_1
[INFO] XML configuration set
```


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

Xml records can either be imported or exported, this is only possible after successful xml configuration.

```bash
# Import datset

> xml - load C:\Users\Downloads\aixm5.xml
[INFO] Successfully unmarshalled

# Export datset

> xml - export C:\Users\gerth\Downloads\docs\aixm.xml
[INFO] Successfully marshalled
```


## db

# Development Guide

# Architecture & Design

# Support & Community

# FAQ
