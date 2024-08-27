package com.aixm.delorean.core.container;

import com.aixm.delorean.core.schema.a5_1_1.aixm.message.AIXMBasicMessageType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.message.BasicMessageMemberAIXMPropertyType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.AbstractAIXMFeatureType;

import java.util.List;
import java.util.ArrayList;

public class Container {
    private final Class<?> structure;
    public XMLBinding xmlBinding;
    public DatabaseBinding databaseBinding;
    private AIXMBasicMessageType record;

    public Container(Class<?> structure) {
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
        this.record = this.xmlBinding.unmarshal(path);
    }

    public void marshal(String path) {
        if (this.xmlBinding == null) {
            throw new RuntimeException("XMLBinding is not set");
        }
        this.xmlBinding.marshal(this.record, path);
    }

    public void show() {
        List<BasicMessageMemberAIXMPropertyType> list = record.getHasMember();

        for (int i = 0; i < list.size(); i++) {
                AbstractAIXMFeatureType item = (AbstractAIXMFeatureType) list.get(i).getAbstractAIXMFeature().getValue();
                System.out.println(item.getIdentifier().getValue());
        } 
    }

    public List<AbstractAIXMFeatureType> getDbLoadReady() {
        List<BasicMessageMemberAIXMPropertyType> list = record.getHasMember();
        List<AbstractAIXMFeatureType> res = new ArrayList<>();

        for (int i = 0; i < list.size(); i++) {
                AbstractAIXMFeatureType item = (AbstractAIXMFeatureType) list.get(i).getAbstractAIXMFeature().getValue();
                res.add(item);
            }      

        return res;
    }
}
