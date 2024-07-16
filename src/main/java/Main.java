import com.aixm.delorean.core.schema.test.ObjectFactory;
import com.aixm.delorean.core.schema.test.PersonType;
import com.aixm.delorean.core.schema.test.Root;

import jakarta.xml.bind.JAXBContext;
import jakarta.xml.bind.JAXBElement;
import jakarta.xml.bind.JAXBException;
import jakarta.xml.bind.Marshaller;
import jakarta.xml.bind.Unmarshaller;

import java.util.List;

import java.math.BigDecimal;

import java.io.File;

public class Main {
    public static void main(String[] args) throws JAXBException {
        // Unmarshal XML to Java object
        JAXBContext context = JAXBContext.newInstance(ObjectFactory.class);
        Unmarshaller unmarshaller = context.createUnmarshaller();
        Marshaller marshaller = context.createMarshaller();
        marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);

        File xmlFile = new File("user.xml");
        Root root = (Root) unmarshaller.unmarshal(xmlFile);

        Root newRoot = new Root();

        List<PersonType> ListPersoneType = root.getPerson();



        for (PersonType personType : ListPersoneType) {
            System.out.println("decimal : " + personType.getDecimal());
            // Change the value of the first person
            BigDecimal newValue = new BigDecimal("100");
            JAXBElement<BigDecimal> decimalElement = new ObjectFactory().createPersonTypeDecimal(newValue);
            personType.setDecimal(decimalElement);
            newRoot.getPerson().add(personType);
        }



        // Marshal Java object to XML
        marshaller.marshal(newRoot, new File("userMod.xml"));
    }
}
