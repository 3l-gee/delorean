package com.aixm.delorean.core.adapter.a5_1.date;

import jakarta.xml.bind.annotation.adapters.XmlAdapter;
import javax.xml.datatype.XMLGregorianCalendar;
import com.aixm.delorean.core.adapter.type.date.AixmTimestamp;
import com.aixm.delorean.core.schema.a5_1.aixm.DateTimeType;
import java.sql.Timestamp;


public class DateTimeTypeAdapter extends XmlAdapter<DateTimeType, AixmTimestamp> {

    @Override
    public AixmTimestamp unmarshal(DateTimeType v) throws Exception {
        if (v == null) {
            return null;
        }

        AixmTimestamp timestamp = new AixmTimestamp();
        timestamp.setTimestamp(new Timestamp(v.getValue().toGregorianCalendar().getTimeInMillis()));
        timestamp.setNilReason(v.getNilReason());

        return timestamp;
    }

    @Override
    public DateTimeType marshal(AixmTimestamp v) throws Exception {
        if (v == null) {
            return null;
        }

        DateTimeType dateTimeType = new DateTimeType();
        if (v.getTimestamp() != null) {
            XMLGregorianCalendar gregorianCalendar = javax.xml.datatype.DatatypeFactory.newInstance().newXMLGregorianCalendar(v.getTimestamp().toString());
            dateTimeType.setValue(gregorianCalendar);
        } else {
            dateTimeType.setValue(null);
        }
        dateTimeType.setNilReason(v.getNilReason());
        return dateTimeType;
    }
}
