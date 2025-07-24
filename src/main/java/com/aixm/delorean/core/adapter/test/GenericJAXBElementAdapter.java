package com.aixm.delorean.core.adapter.test;

import java.lang.reflect.Field;
import java.sql.Timestamp;

import javax.xml.datatype.XMLGregorianCalendar;
import javax.xml.namespace.QName;

import com.aixm.delorean.core.schema.test.aixm.DistanceType;

import jakarta.xml.bind.JAXBElement;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlElementRef;
import jakarta.xml.bind.annotation.adapters.XmlAdapter;

public class GenericJAXBElementAdapter<T> extends XmlAdapter<JAXBElement<T>, T> {
    
    @Override
    public T unmarshal(JAXBElement<T> v) throws Exception {
        if (v == null) return null;
        return v.getValue();
    }

    @Override
    public JAXBElement<T> marshal(T v) throws Exception {
        if (v == null) return null;

        // Dynamically find the field in the entity
        StackTraceElement[] stackTrace = Thread.currentThread().getStackTrace();

        for (StackTraceElement element : stackTrace) {
            try {
                Class<?> entityClass = Class.forName(element.getClassName());
                Field field = findJAXBField(entityClass);
                if (field != null) {
                    XmlElement annotation = field.getAnnotation(XmlElement.class);
                    if (annotation != null) {
                        QName qName = new QName(annotation.namespace(), annotation.name());
                        return new JAXBElement<T>(qName, (Class<T>) field.getType(), (T) v);
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
