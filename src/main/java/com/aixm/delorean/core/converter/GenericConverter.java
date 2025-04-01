// package com.aixm.delorean.core.converter;


// import jakarta.xml.bind.JAXBElement;
// import jakarta.xml.bind.annotation.XmlRootElement;
// import jakarta.xml.bind.annotation.XmlType;
// import jakarta.xml.bind.annotation.adapters.XmlAdapter;
// import jakarta.xml.bind.annotation.adapters.XmlJavaTypeAdapter;

// import javax.xml.namespace.QName;

// import jakarta.persistence.AttributeConverter;


// public class GenericConverter implements AttributeConverter<JAXBElement<T>, T> {

//     @Override
//     public T convertToDatabaseColumn(JAXBElement<T> attribute) {
//         return attribute == null ? null : attribute.getValue();
//     }

//     @Override
//     public JAXBElement<T> convertToEntityAttribute(T dbData) {
//         if (dbData == null || dbData.isEmpty()) {
//             return null;
//         }

//         return new JAXBElement<>(
//                 new QName(dbData.getNamespaceURI(), dbData.getLocalPart()),
//                 (Class<T>) dbData.getClass(),
//                 dbData
//         );


//     }
// }