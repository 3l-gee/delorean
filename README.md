```
 ██████╗  ███████╗ ██╗       ██████╗  ██████╗  ███████╗  █████╗  ███╗   ██╗ 
 ██╔══██╗ ██╔════╝ ██║      ██╔═══██╗ ██╔══██╗ ██╔════╝ ██╔══██╗ ████╗  ██║ 
 ██║  ██║ █████╗   ██║      ██║   ██║ ██████╔╝ █████╗   ███████║ ██╔██╗ ██║ 
 ██║  ██║ ██╔══╝   ██║      ██║   ██║ ██╔══██╗ ██╔══╝   ██╔══██║ ██║╚██╗██║ 
 ██████╔╝ ███████╗ ███████╗ ╚██████╔╝ ██║  ██║ ███████╗ ██║  ██║ ██║ ╚████║ 
 ╚═════╝  ╚══════╝ ╚══════╝  ╚═════╝  ╚═╝  ╚═╝ ╚══════╝ ╚═╝  ╚═╝ ╚═╝  ╚═══╝ 
```                      

Deloreans is an open-source tool written in Java and targeted at PostgreSQL, allowing users to create, visualize, and work with AIXM datasets. Delorean acts as a link between XML, PostgreSQL and QGIS. 

```mermaid
mindmap
    root((Delorean))
        xml
            load
            export
            validate
        postgres
            load
            export
            view
        filter
            feature
            time
            geometry
        transform
            feature
            time
            geometry
        merge
            feature
            time
            geometry
```

Delorean support all features types found in aixm for the following aixm versions : 
* [ ] 5_2 (in dev)
* [ ] 5_1_1 (in dev)
* [x] 5_1
* [ ] 5_0
* [ ] 4_5 

## License

Delorean is licensed under the MIT License.

## Using

Consult the Wiki : [Usage](https://github.com/3l-gee/delorean/wiki) / [Exemple](https://github.com/3l-gee/delorean/wiki/Use-case-Exemple)

## Building

The build process for delorean is complicated as it relies on the aixm xsd to build the entire aixm specific code base. 
✨ Deloreans Rube goldberg build machine ✨
1) ```mvn clean compile -P enable-jaxb```
2) Delete the classes :
    *  ```src\main\java\com\aixm\delorean\core\schema\a5_1\aixm\message\Adapter1.java```
    *  ```src\main\java\com\aixm\delorean\core\schema\a5_1\aixm\Adapter1.java - Adapter8.java```
    *  ```src\main\java\com\aixm\delorean\core\schema\a5_1_1\aixm\message\Adapter1.java```
    *  ```src\main\java\com\aixm\delorean\core\schema\a5_1_1\aixm\Adapter1.java - Adapter8.java```
    *  ```src\main\java\com\aixm\delorean\core\org\gml\v_3_2\Adapter1.java```
3) Remove the faulty code from
    * ```src\main\java\com\aixm\delorean\core\org\gml\v_3_2\ObjectFactory.java [5064 - 5077]```
4) ```python util\compilation\compilation_script.py```
5) ```mvn clean compile```

Additionally, the ressources produced for QGIS and postgresql rely on codegeneration like toolkits custum made for the purpose of Delorean.

## Documentation
Please refer to the [wiki](https://github.com/3l-gee/delorean/wiki) for the full documentation.

## Bugs

TODO

## Community support

TODO

## Contributing

TODO

