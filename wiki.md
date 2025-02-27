

# Getting Started

[](https://github.com/3l-gee/delorean/wiki#getting-started)
For the current version of Delorean , you will need a JRE (Java Runtime Environment) installed on your system, version 21  or later. The JRE (Java Runtime Environment) can be downloaded for free from the Website [http://www.java.com/](http://www.java.com/).

You will also need PostgreSQL 13 or later, which includes PostGIS 3.0 or later as part of its package. PostgreSQL can be downloaded for free from the Website [https://www.postgresql.org/](https://www.postgresql.org/).

# Architecture & Design

Delorean is composed of containers and tools, multiple container can be simultaneously controled to achieve a task.

## Container

A container contains thre core information

- id
- schema
- dataset 

The id is used as a unique identifier when referencing the container. The schema defines the schema data structure to be used. Possible options are 

- a5_1 ([AIXM 5.1](https://aixm.aero/page/aixm-51-511))
- a5_1_1 ([AIXM 5.1.1](https://aixm.aero/page/aixm-51-511))

This will affect the type of data that can be loaded into the container, as well as the validation rules for the schema and the dataset. 
```
> new a5_1
[INFO] New container: 35591d
```

# Usage
To start using the app, you can run the following command:
```
java -jar delorean.jar
```
You are now in the main ??? where each of your containers can be individually controlled. A container


[](https://github.com/3l-gee/delorean/wiki#usage)



[](https://github.com/3l-gee/delorean/wiki#architecture--design)

# Development Guide

[](https://github.com/3l-gee/delorean/wiki#development-guide)

# Support & Community

[](https://github.com/3l-gee/delorean/wiki#support--community)

# FAQ