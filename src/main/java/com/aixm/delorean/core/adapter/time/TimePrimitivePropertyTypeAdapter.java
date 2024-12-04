package com.aixm.delorean.core.adapter.time;

import com.aixm.delorean.core.schema.a5_1_1.org.gml.TimePrimitivePropertyType;
import com.aixm.delorean.core.adapter.type.time.AixmTimeSliceType;

import jakarta.xml.bind.annotation.adapters.XmlAdapter;
import javax.xml.datatype.XMLGregorianCalendar;
import java.sql.Timestamp;


public class TimePrimitivePropertyTypeAdapter extends XmlAdapter<TimePrimitivePropertyType, AixmTimeSliceType> {
    
        @Override
        public AixmTimeSliceType unmarshal(TimePrimitivePropertyType v) throws Exception {
            return null;
        }
    
        @Override
        public TimePrimitivePropertyType marshal(AixmTimeSliceType v) throws Exception {
            return null;
        }
}