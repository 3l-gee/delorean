package com.aixm.delorean;

import com.aixm.delorean.core.configuration.XMLConfig;
import com.aixm.delorean.core.configuration.StructureConfig;
import com.aixm.delorean.core.configuration.DatabaseConfig;

import com.aixm.delorean.core.container.ContainerFactory;
import com.aixm.delorean.core.container.ContainerWarehouse;

import com.aixm.delorean.core.container.XMLBinding;
import com.aixm.delorean.core.container.DatabaseBinding;

import com.aixm.delorean.core.database.DatabaseSchemaBuilder;

import java.util.Scanner;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.mapping.List;

public class Main {
    ContainerWarehouse containerWarehouse = new ContainerWarehouse();

    public static void main(String[] args) {
        Main mainInstance = new Main();  // Create an instance of Main
        mainInstance.run();  // Call the instance method run
    }

    private void run() {
        Scanner scanner = new Scanner(System.in);
        String command;

        //TODO jar information and version
        System.err.println("Delorean 1.0.0- alpha");

        while (true) {
            System.out.print("> ");
            command = scanner.nextLine().trim();

            if (command.equalsIgnoreCase("exit")) {
                System.out.println("Exiting...");
                break;
            }

            executeCommand(command);
        }

        scanner.close();
    }

    private void executeCommand(String command) {
        String[] parts = command.split(" ");
        String action = parts[0];
        String argument = null;
        String parameter = null;
        String option = null;

        if (parts.length > 1) {
            argument = parts[1];
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
                executeDbConfigurationCommand(argument,parameter, option);
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

            // case "show":
            //     executeShowCommand(argument);
            //     break;
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
                case "laod":
                    this.containerWarehouse.getContainer(argument).unmarshal(option);
                    break;

                case "export":
                    this.containerWarehouse.getContainer(argument).marshal(option);
                    break;
            
                default:
                    break;
            }
        }
    }

    private void executeDbConfigurationCommand(String argument, String parameter, String option){
        if (argument == null) {
            throw new IllegalArgumentException("Argument is null");
        }

        if (parameter == null) {
            throw new IllegalArgumentException("parameter is null");
        }

        if (this.containerWarehouse.getIds().contains(argument)) {
            Configuration databaseConfiguration = DatabaseConfig.fromString(parameter);
            String url = "jdbc:postgresql://localhost:5432/delorean";
            String username = "postgres";
            String password = "postgres";
            DatabaseBinding dbBinding = new DatabaseBinding(databaseConfiguration, url, username, password);
            this.containerWarehouse.getContainer(argument).setDbBiding(dbBinding);
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

                case "laod":
                    this.containerWarehouse.getContainer(argument).databaseBinding.load(this.containerWarehouse.getContainer(argument).getDbLoadReady());
                    break; 
                    
                case "export" : 


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
        } else if (argument == null) {
            this.containerWarehouse.getLastContainer().show();
        } else {
            System.err.println("Container " + argument + " does not exist or parameter is missing");
        }
    }
}
