package com.aixm.delorean;

import com.aixm.delorean.core.container.ContainerFactory;
import com.aixm.delorean.core.container.ContainerWarehouse;
import com.aixm.delorean.core.database.DatabaseSchemaBuilder;
import com.aixm.delorean.core.schema.a5_1_1.aixm.TACANPropertyType;

import java.util.Scanner;
import java.util.Arrays;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

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
                this.containerWarehouse.addContainer(ContainerFactory.createContainer(argument));
                System.out.println(this.containerWarehouse.getLastContainerId() + " created");
                break;
            
            case "validation" :
                if (this.containerWarehouse.getIds().contains(argument)) {
                    this.containerWarehouse.getContainer(argument).setValidationRule();
                } else if (argument == null) {
                    this.containerWarehouse.getLastContainer().setValidationRule();
                } else {
                    System.err.println("Container " + argument + " does not exist");
                }
                break;

            case "list" :
                System.out.println(this.containerWarehouse.getIds());
                break;

            case "load" :
                if (this.containerWarehouse.getIds().contains(argument) && parameter != null) {
                    this.containerWarehouse.getContainer(argument).unmarshal(parameter);
                } else if (argument == null && parameter != null) {
                    this.containerWarehouse.getLastContainer().unmarshal(parameter);
                } else {
                    System.err.println("Container " + argument + " does not exist or parameter is missing");
                }
                break;

            case "format" :
                // Get the session factory
                SessionFactory sessionFactory = DatabaseSchemaBuilder.getSessionFactory();

                // // Open a session
                // Session session = sessionFactory.openSession();
                // Transaction transaction = null;

                // try {
                //     transaction = session.beginTransaction();

                //     TACANPropertyType tacan = new TACANPropertyType();
                //     tacan.setOwns(true);

                //     session.persist(tacan);

                //     transaction.commit();
                // } catch (Exception e) {
                //     if (transaction != null) {
                //         transaction.rollback();
                //     }
                //     e.printStackTrace();
                // } finally {
                //     // Close the session
                //     session.close();
                // }

                // Shutdown the session factory
                DatabaseSchemaBuilder.shutdown();
                break;

            case "show" :
                if (this.containerWarehouse.getIds().contains(argument)) {
                    this.containerWarehouse.getContainer(argument).show();
                } else if (argument == null) {
                    this.containerWarehouse.getLastContainer().show();
                } else {
                    System.err.println("Container " + argument + " does not exist or parameter is missing");
                }
                break;                
        }
    }
}

        // try {
        //     // Create JAXB context
        //     JAXBContext context = JAXBContext.newInstance(AIXMBasicMessageType.class);

        //     // Create an Unmarshaller
        //     Unmarshaller unmarshaller = context.createUnmarshaller();

        //     // Load XML file into AIXMBasicMessageType instance using InputStream
        //     InputStream xmlStream = null;

        //     try {
        //         xmlStream = new FileInputStream("C:\\Users\\rapha\\Documents\\project\\delorean\\data\\a5_1_1\\Donlon.xml");
        //         // xmlStream = new FileInputStream("C:\\Users\\gerth\\source\\repos\\3l-gee\\delorean\\data\\a5_1_1\\Donlon.xml");
        //         // Use the xmlStream here
        //     } catch (Exception e) {
        //         e.printStackTrace();
        //     }

        //     JAXBElement<AIXMBasicMessageType> rootElement = (JAXBElement<AIXMBasicMessageType>) unmarshaller.unmarshal(xmlStream);

        //     // Get the AIXMBasicMessageType instance
        //     AIXMBasicMessageType root = rootElement.getValue();

        //     // Here you can use 'root' as needed
        //     List<BasicMessageMemberAIXMPropertyType> list = root.getHasMember();

        //     for (int i = 0; i < list.size(); i++) {
        //         AbstractAIXMFeatureType item = (AbstractAIXMFeatureType) list.get(i).getAbstractAIXMFeature().getValue();
        //         System.err.println(item.getIdentifier().getValue());
        //     } 
            
        // } catch (Exception e) {
        //         e.printStackTrace(); 
        // }
//     }
// }
