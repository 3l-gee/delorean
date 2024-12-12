package com.aixm.delorean.core.converter.time;

import java.time.Instant;
import java.time.LocalDateTime;

import com.aixm.delorean.core.adapter.type.time.AixmTimeSliceType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.TimePrimitivePropertyType;
import jakarta.persistence.AttributeConverter;
import jakarta.persistence.Converter;
import org.postgresql.util.PGobject;
import java.sql.SQLException;


@Converter(autoApply = false)
public class TimePrimitivePropertyTypeConverter implements AttributeConverter<TimePrimitivePropertyType, String> {
    
        @Override
        public String convertToDatabaseColumn(TimePrimitivePropertyType v) {
            // Use hardcoded static dates for testing
            String startDate = "2024-01-01 08:00:00";
            String endDate = "2024-01-01 09:00:00";  // Different end time for the range

            // Format the range string: "[start, end)" for inclusive start and exclusive end
            String range = "'[" + startDate + ", " + endDate + "]'::tsrange";

            return range;
            // return (com.aixm.delorean.core.helper.time.TimeSliceHelper.parseValidTime(v));
        }
    
        @Override
        public TimePrimitivePropertyType convertToEntityAttribute(String v)  {
            return null;
        }
}