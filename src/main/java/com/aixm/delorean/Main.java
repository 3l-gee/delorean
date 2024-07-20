package com.aixm.delorean;

import com.aixm.delorean.core.aixm.message.AIXMBasicMessageType;
import com.aixm.delorean.core.aixm.message.BasicMessageMemberAIXMPropertyType;
import com.aixm.delorean.core.aixm.AbstractAIXMFeatureType;
import com.aixm.delorean.core.configuration.AixmVersion;
import com.aixm.delorean.core.configuration.TemporalityType;

import jakarta.xml.bind.JAXBContext;
import jakarta.xml.bind.JAXBElement;
import jakarta.xml.bind.Unmarshaller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        System.out.println(AixmVersion.VERSION_4_5.getRoot().toString());
        System.out.println(TemporalityType.NO_TEMPORALITY.toString());

        try {
            // Create JAXB context
            JAXBContext context = JAXBContext.newInstance(AIXMBasicMessageType.class);

            // Create an Unmarshaller
            Unmarshaller unmarshaller = context.createUnmarshaller();

            // Load XML file into AIXMBasicMessageType instance using InputStream
            InputStream xmlStream = null;

            try {
                xmlStream = new FileInputStream("C:\\Users\\rapha\\Documents\\project\\delorean\\data\\a5_1_1\\Donlon.xml");
                // xmlStream = new FileInputStream("C:\\Users\\gerth\\source\\repos\\3l-gee\\delorean\\data\\a5_1_1\\Donlon.xml");
                // Use the xmlStream here
            } catch (Exception e) {
                e.printStackTrace();
            }

            JAXBElement<AIXMBasicMessageType> rootElement = (JAXBElement<AIXMBasicMessageType>) unmarshaller.unmarshal(xmlStream);

            // Get the AIXMBasicMessageType instance
            AIXMBasicMessageType root = rootElement.getValue();

            // Here you can use 'root' as needed
            List<BasicMessageMemberAIXMPropertyType> list = root.getHasMember();

            for (int i = 0; i < list.size(); i++) {
                AbstractAIXMFeatureType item = (AbstractAIXMFeatureType) list.get(i).getAbstractAIXMFeature().getValue();
                System.err.println(item.getIdentifier().getValue());
            } 
            
        } catch (Exception e) {
                e.printStackTrace(); 
        }
    }
}
