package com.aixm.delorean.core.container;

import com.aixm.delorean.core.xml.XMLBinding;
import com.aixm.delorean.core.database.DatabaseBinding;
import com.aixm.delorean.core.schema.a5_1_1.aixm.message.AIXMBasicMessageType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.message.BasicMessageMemberAIXMPropertyType;

import java.util.List;
import java.util.ArrayList;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

public class Container<T> {
    private final Class<T> structure;
    public XMLBinding xmlBinding;
    public DatabaseBinding databaseBinding;
    private T record;

    public Container(Class<T> structure) {
        this.structure = structure;
    }

    public T getRecord() {
        return this.record;
    }   

    public Class<?> getStructure() {
        return this.structure;
    }

    public void setXmlBinding(XMLBinding xmlBinding) {
        this.xmlBinding = xmlBinding;
    }

    public void setDbBiding(DatabaseBinding databaseBinding) {
        this.databaseBinding = databaseBinding;
    }

    public void setValidationRule() {
        if (this.xmlBinding == null) {
            throw new RuntimeException("XMLBinding is not set");
        }
        this.xmlBinding.setValidationRule();
    }

    public void unmarshal(String path) {
        if (this.xmlBinding == null) {
            throw new RuntimeException("XMLBinding is not set");
        }
        this.record = (T) this.xmlBinding.unmarshalPojo(path);
    }

    public void marshal(String path) {
        if (this.xmlBinding == null) {
            throw new RuntimeException("XMLBinding is not set");
        }
        this.xmlBinding.marshal(this.record, path, this.structure);
    }

    public void show() {
        recursiveShow(this.record.getClass(), this.record);
    }

    public void load() {
        if (this.databaseBinding == null) {
            throw new RuntimeException("DatabaseBinding is not set");
        }
        this.databaseBinding.load(this.record);
    }

    public void retrieve(Object id) {
        if (this.databaseBinding == null) {
            throw new RuntimeException("DatabaseBinding is not set");
        }
        this.record = (T) this.databaseBinding.retrieve(id);
    }

    //TODO this should be cleaned up in untility function or deleted
    private void recursiveShow(Class<?> clazz, Object instance) {
        System.out.println("Class: " + clazz.getName());
        displayFields(clazz, instance);
        displayMethods(clazz);
        displaySuperClass(clazz, instance);
        displayInterfaces(clazz);
    }

    private void displayFields(Class<?> clazz, Object instance) {
        System.out.println("\nFields:");
        Field[] fields = clazz.getDeclaredFields();
        for (Field field : fields) {
            field.setAccessible(true); // Allow access to private fields
            try {
                Object value = field.get(instance);
                System.out.println(" - " + field.getName() + " : " + field.getType().getName() + " = " + value);
            } catch (IllegalAccessException e) {
                System.err.println(" - Error accessing field: " + field.getName());
            }
        }
    }

    private void displayMethods(Class<?> clazz) {
        System.out.println("\nMethods:");
        Method[] methods = clazz.getDeclaredMethods();
        for (Method method : methods) {
            System.out.print(" - " + method.getName() + "(");
            
            // Print parameter types
            Class<?>[] parameterTypes = method.getParameterTypes();
            for (int i = 0; i < parameterTypes.length; i++) {
                System.out.print(parameterTypes[i].getName());
                if (i < parameterTypes.length - 1) {
                    System.out.print(", ");
                }
            }
            
            System.out.print(") : " + method.getReturnType().getName());
            System.out.println();
        }
    }

    private void displaySuperClass(Class<?> clazz, Object instance) {
        Class<?> superClass = clazz.getSuperclass();
        if (superClass != null) {
            System.out.println("\nSuperclass:");
            recursiveShow(superClass, instance);
        }
    }

    private void displayInterfaces(Class<?> clazz) {
        Class<?>[] interfaces = clazz.getInterfaces();
        if (interfaces.length > 0) {
            System.out.println("\nInterfaces:");
            for (Class<?> iface : interfaces) {
                System.out.println(" - " + iface.getName());
            }
        }
    }

    public List<?> getDbLoadReady() {
        AIXMBasicMessageType test = (AIXMBasicMessageType) this.record;
        List<BasicMessageMemberAIXMPropertyType> list = test.getHasMember();
        List<T> res = new ArrayList<>();

        for (BasicMessageMemberAIXMPropertyType item : list) {
            // Safely cast item.getAbstractAIXMFeature().getValue() to T
            T value = null;
            try {
                value = structure.cast(item.getAbstractAIXMFeature().getValue());
            } catch (ClassCastException e) {
                throw new IllegalStateException("Item value cannot be cast to type T", e);
            }

            res.add(value);
        }

        return res;
    }
}
