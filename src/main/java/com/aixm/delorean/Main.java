package com.aixm.delorean;

import com.aixm.delorean.core.configuration.StructureConfig;
import com.aixm.delorean.core.container.ContainerFactory;
import com.aixm.delorean.core.container.ContainerWarehouse;
import com.aixm.delorean.core.database.DatabaseBinding;
import com.aixm.delorean.core.database.DatabaseConfig;
import com.aixm.delorean.core.log.ConsoleLogger;
import com.aixm.delorean.core.log.LogLevel;
import com.aixm.delorean.core.util.Util;
import com.aixm.delorean.core.xml.XMLBinding;
import com.aixm.delorean.core.xml.XMLConfig;

import java.util.Map;
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
        } else {
            mainInstance.run();
        }
    }

    private void run() {
        Scanner scanner = new Scanner(System.in);
        String command;

        System.out.println("██████╗ ███████╗██╗      ██████╗ ██████╗ ███████╗ █████╗ ███╗   ██╗");
        System.out.println("██╔══██╗██╔════╝██║     ██╔═══██╗██╔══██╗██╔════╝██╔══██╗████╗  ██║");
        System.out.println("██║  ██║█████╗  ██║     ██║   ██║██████╔╝█████╗  ███████║██╔██╗ ██║");
        System.out.println("██║  ██║██╔══╝  ██║     ██║   ██║██╔══██╗██╔══╝  ██╔══██║██║╚██╗██║");
        System.out.println("██████╔╝███████╗███████╗╚██████╔╝██║  ██║███████╗██║  ██║██║ ╚████║");
        System.out.println("╚═════╝ ╚══════╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝");
        System.out.println("Author : Raphaël Gerth");
        ConsoleLogger.log(LogLevel.INFO, "Delorean 0.1.0 - alpha");

        while (true) {
            System.out.print("> ");
            command = scanner.nextLine().trim();

            if (command.equalsIgnoreCase("exit")) {
                ConsoleLogger.log(LogLevel.INFO, "Exiting...");
                break;
            }

            try {
                executeCommand(command);
            } catch (IllegalArgumentException e) {
                ConsoleLogger.log(LogLevel.ERROR,"Invalid arguments: " + e.getMessage());
                ConsoleLogger.log(LogLevel.INFO,"Please try again.");
            }
        }

        scanner.close();
    }

    private void testRun() {
        Map<String, String> dictonary = Util.parseToMap("{url:jdbc:postgresql://localhost:5432/delorean, username:postgres, password:postgres, hbm2ddl:create}");
        ConsoleLogger.log(LogLevel.INFO, "new a5_1_1");
        executeNewCommand("a5_1_1");

        ConsoleLogger.log(LogLevel.INFO, "xml_config - a5_1_1");
        excuteXmlConfigurationCommand(this.containerWarehouse.getLastContainerId(), "a5_1_1");

        // ConsoleLogger.log(LogLevel.INFO, "xml - load src/test/xml/a5_1_1/gis/GMLpoint.xml");
        // executeXmlActionCommand(this.containerWarehouse.getLastContainerId(), "load", "src/test/xml/a5_1_1/gis/GMLpoint.xml");

        ConsoleLogger.log(LogLevel.INFO, "xml - load src/test/xml/a5_1_1/gis/GMLCurve.xml");
        executeXmlActionCommand(this.containerWarehouse.getLastContainerId(), "load", "src/test/xml/a5_1_1/gis/GMLCurve.xml");

        // ConsoleLogger.log(LogLevel.INFO, "xml - load src/test/xml/a5_1_1/gis/GMLSurface.xml");
        // executeXmlActionCommand(this.containerWarehouse.getLastContainerId(), "load", "src/test/xml/a5_1_1/gis/GMLSurface.xml");

        ConsoleLogger.log(LogLevel.INFO, "xml - export src/main/resources/importExport.xml");
        executeXmlActionCommand(this.containerWarehouse.getLastContainerId(),"export", "src/main/resources/export.xml");
        
        ConsoleLogger.log(LogLevel.INFO, "db_config - a5_1_1");
        executeDbConfigurationCommand(this.containerWarehouse.getLastContainerId(),"a5_1_1", dictonary);

        ConsoleLogger.log(LogLevel.INFO, "db - startup");
        executeDbActionCommand(this.containerWarehouse.getLastContainerId(),"startup", "");

        ConsoleLogger.log(LogLevel.INFO, "db - load");
        executeDbActionCommand(this.containerWarehouse.getLastContainerId(),"load", "");

        ConsoleLogger.log(LogLevel.INFO, "new a5_1_1");
        executeNewCommand("a5_1_1");

        ConsoleLogger.log(LogLevel.INFO, "xml_config - a5_1_1");
        excuteXmlConfigurationCommand(this.containerWarehouse.getLastContainerId(), "a5_1_1");

        ConsoleLogger.log(LogLevel.INFO, "db_config - a5_1_1");
        executeDbConfigurationCommand(this.containerWarehouse.getLastContainerId(),"a5_1_1", dictonary);

        ConsoleLogger.log(LogLevel.INFO, "db - startup");
        executeDbActionCommand(this.containerWarehouse.getLastContainerId(),"startup", "");

        ConsoleLogger.log(LogLevel.INFO, "db - retrieve 1");
        executeDbActionCommand(this.containerWarehouse.getLastContainerId(),"retrieve", "1");

        ConsoleLogger.log(LogLevel.INFO, "xml - export src/main/resources/test.xml");
        executeXmlActionCommand(this.containerWarehouse.getLastContainerId(),"export", "src/main/resources/retrive.xml");

        // logger.log(LogLevel.INFO, "Exiting...");

        // logger.log(LogLevel.INFO, "new house");
        // executeNewCommand("house");

        // logger.log(LogLevel.INFO, "db_config - house");
        // executeDbConfigurationCommand(this.containerWarehouse.getLastContainerId(),"house", "");

        // logger.log(LogLevel.INFO, "db - startup");
        // executeDbActionCommand(this.containerWarehouse.getLastContainerId(),"startup", "");

    }

    private void executeCommand(String command) {
        // Action Argument Parameter Optipon
        String[] parts = command.split(" ");
        String action = parts[0];
        String argument = null;
        String parameter = null;
        String option = null;
        Map<String, String> dictonary = Util.parseToMap(command);

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
            case "new":
                executeNewCommand(argument);
                break;

            case "xml_config":
                excuteXmlConfigurationCommand(argument, parameter);
                break;

            case "xml" :
                executeXmlActionCommand(argument, parameter, option);
                break;

            case "db_config":
                executeDbConfigurationCommand(argument,parameter, dictonary);
                break;

            case "db" :
                executeDbActionCommand(argument,parameter, option);
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
                break;
        }
    }

    private void executeNewCommand(String argument) {
        if (argument == null) {
            throw new IllegalArgumentException("Argument is null");
        }
        
        try {
            StructureConfig Structure = StructureConfig.fromString(argument);
            this.containerWarehouse.addContainer(ContainerFactory.createContainer(Structure));
            System.out.println(this.containerWarehouse.getLastContainerId() + " created");

        } catch (IllegalArgumentException e) {
            System.err.println("Invalid argument: " + e.getMessage());
        }
    }

    private void excuteXmlConfigurationCommand(String argument, String parameter) {
        if (argument == null) {
            throw new IllegalArgumentException("Argument is null");
        }

        if (parameter == null) {
            throw new IllegalArgumentException("parameter is null");
        }

        if (this.containerWarehouse.getIds().contains(argument)) {
            XMLConfig xmlConfig = XMLConfig.fromString(parameter);
            XMLBinding xmlBinding = new XMLBinding(xmlConfig, this.containerWarehouse.getContainer(argument).getStructure());
            this.containerWarehouse.getContainer(argument).setXmlBinding(xmlBinding);
        } else {
            System.err.println("Container " + argument + " does not exist or parameter is missing");
        }
    }

    private void executeXmlActionCommand(String argument, String parameter, String option){
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

    private void executeDbConfigurationCommand(String argument, String parameter, Map<String, String> dictionary){
        if (argument == null) {
            throw new IllegalArgumentException("Argument is null");
        }

        if (parameter == null) {
            throw new IllegalArgumentException("parameter is null");
        }

        if (this.containerWarehouse.getIds().contains(argument)) {
            DatabaseConfig databaseConfiguration = DatabaseConfig.fromString(parameter);
            try{
                String url = dictionary.get("url");
                String username = dictionary.get("username");
                String password = dictionary.get("password");
                String hbm2ddl = dictionary.get("hbm2ddl");
                DatabaseBinding dbBinding = new DatabaseBinding(databaseConfiguration);
                this.containerWarehouse.getContainer(argument).setDbBiding(dbBinding);
                this.containerWarehouse.getContainer(argument).databaseBinding.setUrl(url);
                this.containerWarehouse.getContainer(argument).databaseBinding.setUsername(username);
                this.containerWarehouse.getContainer(argument).databaseBinding.setPassword(password);
                this.containerWarehouse.getContainer(argument).databaseBinding.setHbm2ddl(hbm2ddl);
            } catch (IllegalArgumentException e) {
                System.err.println("Invalid argument: " + e.getMessage());
            }
        } else {
            System.err.println("Container " + argument + " does not exist or parameter is missing");
        }
    }

    private void executeDbActionCommand(String argument, String parameter, String option) {
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
                    
                case "retrieve":
                    this.containerWarehouse.getContainer(argument).retrieve(option);
                    break;
                default:
                    break;
            }
        } else {
            System.err.println("Container " + argument + " does not exist or parameter is missing");
        }
    }

    private void executeValidationCommand(String argument) {
        if (argument == null) {
            throw new IllegalArgumentException("Argument is null");
        }

        if (this.containerWarehouse.getIds().contains(argument)) {
            this.containerWarehouse.getContainer(argument).setValidationRule();
        } else {
            System.err.println("Container " + argument + " does not exist");
        }
    }

    private void executeListCommand() {
        System.out.println(this.containerWarehouse.getIds());
    }

    private void executeShowCommand(String argument) {
        if (this.containerWarehouse.getIds().contains(argument)) {
            this.containerWarehouse.getContainer(argument).show();
        } else {
            System.err.println("Container " + argument + " does not exist or parameter is missing");
        }
    }
}
