package com.aixm.delorean.core.converter.test;

import jakarta.persistence.AttributeConverter;
import jakarta.persistence.Converter;
import jakarta.xml.bind.JAXBElement;
import javax.xml.namespace.QName;
import jakarta.xml.bind.annotation.XmlElementRef;
import java.lang.reflect.Field;

@Converter(autoApply = false) // We will apply this manually per field
public class GenericJAXBElementConverter<T> implements AttributeConverter<JAXBElement<T>, T> {

    @Override
    public T convertToDatabaseColumn(JAXBElement<T> v) {
        return (v != null) ? v.getValue() : null;
    }

    @Override
    public JAXBElement<T> convertToEntityAttribute(T v) {
        if (v == null) return null;

        // Dynamically find the field in the entity
        StackTraceElement[] stackTrace = Thread.currentThread().getStackTrace();
        for (StackTraceElement element : stackTrace) {
            try {
                Class<?> entityClass = Class.forName(element.getClassName());
                Field field = findJAXBField(entityClass);
                if (field != null) {
                    XmlElementRef annotation = field.getAnnotation(XmlElementRef.class);
                    if (annotation != null) {
                        QName qName = new QName(annotation.namespace(), annotation.name());
                        return new JAXBElement<>(qName, (Class<T>) field.getType(), v);
                    }
                }
            } catch (ClassNotFoundException ignored) {
                // Ignore, keep searching the stack
            }
        }
        throw new IllegalStateException("Could not determine JAXBElement metadata dynamically.");
    }

    private Field findJAXBField(Class<?> entityClass) {
        for (Field field : entityClass.getDeclaredFields()) {
            if (field.isAnnotationPresent(XmlElementRef.class)) {
                return field;
            }
        }
        return null;
    }
}
