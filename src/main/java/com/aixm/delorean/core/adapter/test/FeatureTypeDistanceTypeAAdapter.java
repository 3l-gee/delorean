package com.aixm.delorean.core.adapter.test;

import java.sql.Timestamp;

import javax.xml.datatype.XMLGregorianCalendar;
import javax.xml.namespace.QName;

import com.aixm.delorean.core.schema.test.aixm.DistanceType;

import jakarta.xml.bind.JAXBElement;
import jakarta.xml.bind.annotation.adapters.XmlAdapter;

public class FeatureTypeDistanceTypeAAdapter extends XmlAdapter<JAXBElement<DistanceType>, DistanceType> {
    
    @Override
    public DistanceType unmarshal(JAXBElement<DistanceType> v) throws Exception {
        DistanceType value = v.getValue();
        return value;
    }

    @Override
    public JAXBElement<DistanceType> marshal(DistanceType v) throws Exception {
        QName qname = new QName("http://www.test.com", "a");
        
        JAXBElement<DistanceType> jaxb = new JAXBElement<>(qname, DistanceType.class, v);
    
        if (v == null || v.getValue() == null || v.getNilReason() != null) {
            jaxb.setNil(true);
        }
    
        return jaxb;
    }
}