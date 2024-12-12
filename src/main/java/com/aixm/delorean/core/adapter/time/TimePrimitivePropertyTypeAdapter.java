package com.aixm.delorean.core.adapter.time;

import java.time.Instant;

import com.aixm.delorean.core.adapter.type.time.AixmTimeSliceType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.TimePrimitivePropertyType;

import jakarta.xml.bind.annotation.adapters.XmlAdapter;

public class TimePrimitivePropertyTypeAdapter extends XmlAdapter<TimePrimitivePropertyType, AixmTimeSliceType> {
    
    @Override
    public AixmTimeSliceType unmarshal(TimePrimitivePropertyType v) throws Exception {
        AixmTimeSliceType aixmTimeSliceType = new AixmTimeSliceType();
        aixmTimeSliceType.setBeginPosition(Instant.now());
        aixmTimeSliceType.setBeginPosition(Instant.now());
        return aixmTimeSliceType;
    }

    @Override
    public TimePrimitivePropertyType marshal(AixmTimeSliceType v) throws Exception {
        return null;
    }

}


