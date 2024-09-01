package com.aixm.delorean.core.container;

import com.aixm.delorean.core.xml.XMLBinding;
import com.aixm.delorean.core.database.DatabaseBinding;

import java.util.List;
import java.util.ArrayList;

public class Container<T> {
    private final Class<T> structure;
    public XMLBinding xmlBinding;
    public DatabaseBinding databaseBinding;
    private T record;

    public Container(Class<T> structure) {
        this.structure = structure;
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
        this.record = (T) this.xmlBinding.unmarshal(path);
    }

    public void marshal(String path) {
        if (this.xmlBinding == null) {
            throw new RuntimeException("XMLBinding is not set");
        }
        this.xmlBinding.marshal(this.record, path, this.structure);
    }

    // public void show() {
    //     List<T> list = record.getHasMember();

    //     for (int i = 0; i < list.size(); i++) {
    //             T item = (T) list.get(i).getAbstractAIXMFeature().getValue();
    //             System.out.println(item.getIdentifier().getValue());
    //     } 
    // }

    // public List<?> getDbLoadReady() {
    //     List<T> list = record.getHasMember();
    //     List<T> res = new ArrayList<>();

    //     for (int i = 0; i < list.size(); i++) {
    //             T item = (T) list.get(i).getAbstractAIXMFeature().getValue();
    //             res.add(item);
    //         }      

    //     return res;
    // }
}
