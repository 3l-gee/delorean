package com.aixm.delorean.core.adapter.time;

import com.aixm.delorean.core.adapter.type.time.AixmTimeSliceType;
import com.aixm.delorean.core.helper.time.TimeSliceHelper;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.TimePrimitivePropertyType;

import jakarta.xml.bind.annotation.adapters.XmlAdapter;

public class TimePrimitivePropertyTypeAdapter extends XmlAdapter<TimePrimitivePropertyType, AixmTimeSliceType> {
    
    @Override
    public AixmTimeSliceType unmarshal(TimePrimitivePropertyType v) throws Exception {
        return (TimeSliceHelper.parseValidTime(v));
    }

    @Override
    public TimePrimitivePropertyType marshal(AixmTimeSliceType v) throws Exception {
        return (TimeSliceHelper.printValidTime(v));
    }

}


