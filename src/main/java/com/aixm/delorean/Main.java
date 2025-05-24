package com.aixm.delorean;

import com.aixm.delorean.core.configuration.StructureConfig;
import com.aixm.delorean.core.container.ContainerFactory;
import com.aixm.delorean.core.container.ContainerWarehouse;
import com.aixm.delorean.core.database.DatabaseBinding;
import com.aixm.delorean.core.database.DatabaseConfig;
import com.aixm.delorean.core.log.ConsoleLogger;
import com.aixm.delorean.core.log.LogLevel;
import com.aixm.delorean.core.xml.XMLBinding;
import com.aixm.delorean.core.xml.XMLConfig;

import java.io.Console;
import java.util.Scanner;

public class Main {
    ContainerWarehouse containerWarehouse = new ContainerWarehouse();
    private boolean unsafe = false;
    private boolean testOption = false;

    public static void main(String[] args) {
        Main mainInstance = new Main();  // Create an instance of Main
        ConsoleLogger.setGlobalLogLevel(LogLevel.INFO);
        for (String arg : args) {
            switch (arg) {
                case "--test":
                case "-t":
                    mainInstance.testOption = true;
                    ConsoleLogger.log(LogLevel.WARN, "Test mode enabled");
                    break;
                case "--verbose":
                case "-v":
                    ConsoleLogger.setGlobalLogLevel(LogLevel.DEBUG);
                    ConsoleLogger.log(LogLevel.WARN, "Verbose mode enabled");
                    break;
                case "--unsafe":
                case "-u":
                    mainInstance.unsafe = true;

                    break;
            }
        }

        if (mainInstance.testOption) {
            mainInstance.testRun();
        }             
        mainInstance.run();
    }

    private void run() {
        Scanner scanner = new Scanner(System.in);
        String command;
        System.out.println("");
        System.out.println(" ██████╗  ███████╗ ██╗       ██████╗  ██████╗  ███████╗  █████╗  ███╗   ██╗ ");
        System.out.println(" ██╔══██╗ ██╔════╝ ██║      ██╔═══██╗ ██╔══██╗ ██╔════╝ ██╔══██╗ ████╗  ██║ ");
        System.out.println(" ██║  ██║ █████╗   ██║      ██║   ██║ ██████╔╝ █████╗   ███████║ ██╔██╗ ██║ ");
        System.out.println(" ██║  ██║ ██╔══╝   ██║      ██║   ██║ ██╔══██╗ ██╔══╝   ██╔══██║ ██║╚██╗██║ ");
        System.out.println(" ██████╔╝ ███████╗ ███████╗ ╚██████╔╝ ██║  ██║ ███████╗ ██║  ██║ ██║ ╚████║ ");
        System.out.println(" ╚═════╝  ╚══════╝ ╚══════╝  ╚═════╝  ╚═╝  ╚═╝ ╚══════╝ ╚═╝  ╚═╝ ╚═╝  ╚═══╝ ");
        System.out.println("");
        System.out.println("Author : Raphaël Gerth");
        ConsoleLogger.log(LogLevel.INFO, "Delorean 0.1.0-SNAPSHOT");
        ConsoleLogger.log(LogLevel.INFO, "type 'help' for a list of commands");

        while (true) {
            System.out.print("> ");
            command = scanner.nextLine().trim();

            if (command.equalsIgnoreCase("exit")) {
                ConsoleLogger.log(LogLevel.INFO, "Exiting...");
                break;
            }

            try {
                executeCommand(command, scanner);
            } catch (IllegalArgumentException e) {
                ConsoleLogger.log(LogLevel.ERROR,"Invalid arguments: " + e.getMessage());
                ConsoleLogger.log(LogLevel.INFO,"Please try again.");
            }
        }

        scanner.close();
    }

    private void testRun() {
        Scanner scanner = new Scanner(System.in);
        ConsoleLogger.log(LogLevel.INFO, "new a5_1");
        executeNewCommand("a5_1", scanner,  "", "");

        ConsoleLogger.log(LogLevel.INFO, "xml_config - a5_1");
        excuteXmlConfigurationCommand(this.containerWarehouse.getLastContainerId(), scanner, "a5_1", "");

        // ConsoleLogger.log(LogLevel.INFO, "xml - load src/test/xml/a5_1_1/gis/GMLpoint.xml");
        // executeXmlActionCommand(this.containerWarehouse.getLastContainerId(), "load", "src/test/xml/a5_1_1/gis/GMLpoint.xml");

        // ConsoleLogger.log(LogLevel.INFO, "xml - load src/test/xml/a5_1_1/gis/GMLCurve.xml");
        // executeXmlActionCommand(this.containerWarehouse.getLastContainerId(), scanner, "load", "src/test/xml/a5_1_1/gis/GMLCurve.xml");

        // ConsoleLogger.log(LogLevel.INFO, "xml - load src/test/xml/a5_1_1/gis/GMLSurface.xml");
        // executeXmlActionCommand(this.containerWarehouse.getLastContainerId(), "load", "src/test/xml/a5_1_1/gis/GMLSurface.xml");

        // ConsoleLogger.log(LogLevel.INFO, "xml - export src/main/resources/importExport.xml");
        // executeXmlActionCommand(this.containerWarehouse.getLastContainerId(), scanner,"export", "src/main/resources/export.xml");
        
        ConsoleLogger.log(LogLevel.INFO, "db_config - a5_1");
        executeDbConfigurationCommand(this.containerWarehouse.getLastContainerId(), scanner,"a5_1", "");

        // ConsoleLogger.log(LogLevel.INFO, "db - startup");
        // executeDbActionCommand(this.containerWarehouse.getLastContainerId(), scanner,"startup", "");

        // ConsoleLogger.log(LogLevel.INFO, "db - load");
        // executeDbActionCommand(this.containerWarehouse.getLastContainerId(), scanner,"load", "");

        // ConsoleLogger.log(LogLevel.INFO, "new a5_1_1");
        // executeNewCommand("a5_1_1", scanner, "", "");

        // ConsoleLogger.log(LogLevel.INFO, "xml_config - a5_1_1");
        // excuteXmlConfigurationCommand(this.containerWarehouse.getLastContainerId(), scanner, "a5_1_1", "");

        // ConsoleLogger.log(LogLevel.INFO, "db_config - a5_1_1");
        // executeDbConfigurationCommand(this.containerWarehouse.getLastContainerId(), scanner,"a5_1_1", "");

        // ConsoleLogger.log(LogLevel.INFO, "db - startup");
        // executeDbActionCommand(this.containerWarehouse.getLastContainerId(), scanner,"startup", "");

        // ConsoleLogger.log(LogLevel.INFO, "db - export 1");
        // executeDbActionCommand(this.containerWarehouse.getLastContainerId(), scanner,"retrieve", "1");

        // ConsoleLogger.log(LogLevel.INFO, "xml - export src/main/resources/test.xml");
        // executeXmlActionCommand(this.containerWarehouse.getLastContainerId(), scanner,"export", "src/main/resources/retrive.xml");

        // logger.log(LogLevel.INFO, "Exiting...");

        // logger.log(LogLevel.INFO, "new house");
        // executeNewCommand("house");

        // logger.log(LogLevel.INFO, "db_config - house");
        // executeDbConfigurationCommand(this.containerWarehouse.getLastContainerId(),"house", "");

        // logger.log(LogLevel.INFO, "db - startup");
        // executeDbActionCommand(this.containerWarehouse.getLastContainerId(),"startup", "");
    }

    private void executeCommand(String command, Scanner scanner) {
        // Action Argument Parameter Optipon
        String[] parts = command.split(" ");
        String action = parts[0];
        String argument = null;
        String parameter = null;
        String option = null;

        if (parts.length > 1) {
            argument = parts[1];
            if ("-".equals(argument)) {
                argument = this.containerWarehouse.getLastContainerId();
            }
        }

        if (parts.length > 2) {
            parameter = parts[2];
        }

        if (parts.length > 3) {
            option = parts[3];
        }


        switch (action.toLowerCase()) {
            case "/h": 
            case "--help": 
            case "-h":
            case "?":
            case "help":
            System.out.println("""
               -={ Delorean Shell Commands }=-
    help                                                             : Display this help message
    new         [a5_1, a5_1_1]                                       : Create a new container with the specified argument       
    xml_config  <container id, - >      [a5_1, a5_1_1]               : Configures the xml schema to use for the specified container
    db_config   <container id, - >      [a5_1, a5_1_1]               : Configures the db connection for the specified container
    qgis_config <container id, - >      [a5_1, a5_1_1]               : Configures the qgis project for the specified container
    xml         <container id, - >      load             <path>      : load the xml data from the specified path
    xml         <container id, - >      export           <path>      : export the xml data to the specified path
    db          <container id, - >      startup                      : start the database
    db          <container id, - >      load                         : load the data into the database
    db          <container id, - >      export           <id>        : export the master aixmmessage with the specified id
    list                                                             : List all the containers
    exit                                                             : Exit the shell                                    
                """);
            break;

            case "new":
            executeNewCommand(argument, scanner, parameter, option);
            break;

            case "xml_config":
            excuteXmlConfigurationCommand(argument,scanner, parameter, option);
            break;

            case "xml" :
            executeXmlActionCommand(argument,scanner, parameter, option);
            break;

            case "db_config":
            executeDbConfigurationCommand(argument, scanner, parameter, option);
            break;

            case "qgis_config" :
            executeQgisConfigurationCommand(argument, scanner, parameter, option);
            break;

            case "db" :
            executeDbActionCommand(argument, scanner, parameter, option);
            break;

            case "list":
            executeListCommand();
            break;          

            // case "format":
            //     executeFormatCommand();
            //     break;

            case "show":
            executeShowCommand(argument);
            break;

            default:
            ConsoleLogger.log(LogLevel.ERROR, "Invalid command: " + action);
            break;
        }
    }

    private void executeNewCommand(String argument, Scanner scanner,  String parameter, String option) {
        if (argument == null) {
            throw new IllegalArgumentException("Argument is null");
        }
        
        try {
            StructureConfig Structure = StructureConfig.fromString(argument);
            this.containerWarehouse.addContainer(ContainerFactory.createContainer(Structure));
        } catch (IllegalArgumentException e) {
            System.err.println("Invalid argument: " + e.getMessage());
        } finally {
            ConsoleLogger.log(LogLevel.INFO, "New container: " + this.containerWarehouse.getLastContainerId());
        }
    }

    private void excuteXmlConfigurationCommand(String argument, Scanner scanner, String parameter, String option) {
        if (argument == null) {
            throw new IllegalArgumentException("Argument is null");
        }

        if (parameter == null) {
            throw new IllegalArgumentException("parameter is null");
        }
        try {
            if (this.containerWarehouse.getIds().contains(argument)) {
                XMLConfig xmlConfig = XMLConfig.fromString(parameter);
                XMLBinding xmlBinding = new XMLBinding(xmlConfig, this.containerWarehouse.getContainer(argument).getStructure());
                this.containerWarehouse.getContainer(argument).setXmlBinding(xmlBinding);
            } else {
                System.err.println("Container " + argument + " does not exist or parameter is missing");
            }
        } catch (IllegalArgumentException e) {
            System.err.println("Invalid argument: " + e.getMessage());
        } finally {
            ConsoleLogger.log(LogLevel.INFO, "XML configuration set");
        }
    }

    private void executeXmlActionCommand(String argument, Scanner scanner, String parameter, String option){
        if (argument == null) {
            throw new IllegalArgumentException("Argument is null");
        }

        if (parameter == null) {
            throw new IllegalArgumentException("parameter is null");
        }

        if (this.containerWarehouse.getIds().contains(argument)) {
            switch (parameter.toLowerCase()) {
                case "load":
                    this.containerWarehouse.getContainer(argument).unmarshal(option);
                    break;

                case "export":
                    this.containerWarehouse.getContainer(argument).marshal(option);
                    break;
            
                default:
                    break;
            }
        } else {
            System.err.println("Container " + argument + " does not exist or parameter is missing");
        }
    }

    private void executeDbConfigurationCommand(String argument, Scanner scanner, String parameter, String option){
        if (argument == null) {
            throw new IllegalArgumentException("Argument is null");
        }

        if (parameter == null) {
            throw new IllegalArgumentException("parameter is null");
        }

        if (this.containerWarehouse.getIds().contains(argument)) {
            DatabaseConfig databaseConfiguration = DatabaseConfig.fromString(parameter);
            try{
                DatabaseBinding dbBinding = new DatabaseBinding(databaseConfiguration);
                this.containerWarehouse.getContainer(argument).setDbBiding(dbBinding);
            } catch (IllegalArgumentException e) {
                System.err.println("Invalid argument: " + e.getMessage());
            }

            Console console = System.console();
            try {
                // Ask for URL
                System.out.print("Enter URL, [url:port/database] : ");
                String url = "jdbc:postgresql://"  + scanner.nextLine();
        
                // Ask for username
                System.out.print("Enter username : ");
                String username = scanner.nextLine();

                // Ask for password (hidden input)
                // TODO dev phase only  
                // char[] passwordChars = console.readPassword("Enter password : ");
                System.out.print("Enter password : ");
                String password = scanner.nextLine();
                // String password = new String(passwordChars);

                // Ask for hbm2ddl
                System.out.print("Enter hbm2ddl, [create, update, validate, none] : ");
                String hbm2ddl = scanner.nextLine();
    
                this.containerWarehouse.getContainer(argument).databaseBinding.setUrl(url);
                this.containerWarehouse.getContainer(argument).databaseBinding.setUsername(username);
                this.containerWarehouse.getContainer(argument).databaseBinding.setPassword(password);
                this.containerWarehouse.getContainer(argument).databaseBinding.setHbm2ddl(hbm2ddl);
            } catch (IllegalArgumentException e) {
                System.err.println("Invalid argument: " + e.getMessage());
            } finally {
                ConsoleLogger.log(LogLevel.INFO, "Database configuration set");
            }
        } else {
            ConsoleLogger.log(LogLevel.ERROR, "Container " + argument + " does not exist");
        }
    }

    private void executeQgisConfigurationCommand(String argument, Scanner sacnner, String parameter, String option) {
        if (argument == null) {
            throw new IllegalArgumentException("Argument is null");
        }

        if (parameter == null) {
            throw new IllegalArgumentException("parameter is null");
        }

        if (this.containerWarehouse.getIds().contains(argument)) {
            switch (parameter.toLowerCase()) {
                case "init":
                    break;

                default:
                    ConsoleLogger.log(LogLevel.ERROR, "Parameter " + parameter + " does not exist");
                    break;
            }    
        } else {
            ConsoleLogger.log(LogLevel.ERROR, "Container " + argument + " does not exist");
        }
    }

    private void executeDbActionCommand(String argument, Scanner scanner, String parameter, String option) {
        if (argument == null) {
            throw new IllegalArgumentException("Argument is null");
        }

        if (parameter == null) {
            throw new IllegalArgumentException("parameter is null");
        }

        if (this.containerWarehouse.getIds().contains(argument)) {
            switch (parameter.toLowerCase()) {
                case "startup":
                    this.containerWarehouse.getContainer(argument).databaseBinding.startup();
                    break;
                
                case "shutdown":
                    this.containerWarehouse.getContainer(argument).databaseBinding.shutdown();
                    break;

                case "load":
                    this.containerWarehouse.getContainer(argument).load();
                    // this.containerWarehouse.getContainer(argument).databaseBinding.load(this.containerWarehouse.getContainer(argument).getDbLoadReady());
                    break; 
                    
                case "export":
                    this.containerWarehouse.getContainer(argument).export(option);
                    break;

                default:
                    ConsoleLogger.log(LogLevel.ERROR, "Parameter " + parameter + " does not exist");
                    break;
            }
        } else {
            ConsoleLogger.log(LogLevel.ERROR, "Container " + argument + " does not exist");
        }
    }

    private void executeValidationCommand(String argument) {
        if (argument == null) {
            throw new IllegalArgumentException("Argument is null");
        }

        if (this.containerWarehouse.getIds().contains(argument)) {
            this.containerWarehouse.getContainer(argument).setValidationRule();
        } else {
            ConsoleLogger.log(LogLevel.ERROR, "Container " + argument + " does not exist");
        }
    }

    private void executeListCommand() {
        System.out.println(this.containerWarehouse.getIds());
    }

    private void executeShowCommand(String argument) {
        if (this.containerWarehouse.getIds().contains(argument)) {
            this.containerWarehouse.getContainer(argument).show();
        } else {
            ConsoleLogger.log(LogLevel.ERROR, "Container " + argument + " does not exist");
        }
    }
}
