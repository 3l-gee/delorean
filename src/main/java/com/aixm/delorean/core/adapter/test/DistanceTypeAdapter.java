package com.aixm.delorean.core.adapter.test;

import java.sql.Timestamp;

import javax.xml.datatype.XMLGregorianCalendar;
import javax.xml.namespace.QName;

import com.aixm.delorean.core.schema.test.aixm.DistanceType;

import jakarta.xml.bind.JAXBElement;
import jakarta.xml.bind.annotation.adapters.XmlAdapter;

public class DistanceTypeAdapter extends XmlAdapter<JAXBElement<DistanceType>, DistanceType> {
    
    @Override
    public DistanceType unmarshal(JAXBElement<DistanceType> v) throws Exception {
        if (v == null) {
            return null;
        }
        DistanceType distanceType = v.getValue();
        if (distanceType == null) {
            return null;
        }

        return distanceType;
    }

    @Override
    public JAXBElement<DistanceType> marshal(DistanceType v) throws Exception {
        return new JAXBElement<DistanceType>(
            new QName("http://www.test.com", "DistanceType"),
            DistanceType.class,
            (DistanceType) v
        );
    }
}
