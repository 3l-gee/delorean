package com.aixm.delorean;

import com.aixm.delorean.core.schema.a5_1_1.message.AIXMBasicMessageType;
import com.aixm.delorean.core.schema.a5_1_1.message.BasicMessageMemberAIXMPropertyType;
import com.aixm.delorean.core.schema.a5_1_1.AbstractAIXMFeatureType;
import com.aixm.delorean.core.configuration.AixmVersion;
import com.aixm.delorean.core.container.Container;
import com.aixm.delorean.core.container.ContainerFactory;
import com.aixm.delorean.core.container.ContainerWarehouse;

import jakarta.xml.bind.JAXBContext;
import jakarta.xml.bind.JAXBElement;
import jakarta.xml.bind.Unmarshaller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;
import java.util.Scanner;

import org.glassfish.jaxb.runtime.v2.runtime.output.StAXExStreamWriterOutput;

import java.util.ArrayList;

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
            
            case "list" :
                System.out.println(this.containerWarehouse.getIds());
                break;

            case "load" :
                if (this.containerWarehouse.getIds().contains(argument) && parameter != null) {
                    this.containerWarehouse.getContainer(argument).unmarshal(parameter);
                } else {
                    System.err.println("Container " + argument + " does not exist or parameter is missing");
                }
                break;

            case "show" :
                if (this.containerWarehouse.getIds().contains(argument)) {
                    this.containerWarehouse.getContainer(argument).show();
                }else {
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
