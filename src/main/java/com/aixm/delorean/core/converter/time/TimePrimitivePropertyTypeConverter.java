package com.aixm.delorean.core.converter.time;

import com.aixm.delorean.core.converter.type.time.AixmTimeSliceType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.TimePrimitivePropertyType;
import jakarta.persistence.AttributeConverter;
import jakarta.persistence.Converter;


@Converter(autoApply = true)
public class TimePrimitivePropertyTypeConverter implements AttributeConverter<TimePrimitivePropertyType, AixmTimeSliceType> {
    
        @Override
        public AixmTimeSliceType convertToDatabaseColumn(TimePrimitivePropertyType v) {
            return (com.aixm.delorean.core.helper.time.TimeSliceHelper.parseValidTime(v));
        }
    
        @Override
        public TimePrimitivePropertyType convertToEntityAttribute(AixmTimeSliceType v)  {
            return null;
        }
}