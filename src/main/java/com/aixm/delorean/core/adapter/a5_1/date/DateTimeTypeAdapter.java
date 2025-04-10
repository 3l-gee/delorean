package com.aixm.delorean.core.adapter.a5_1.date;

import jakarta.xml.bind.annotation.adapters.XmlAdapter;

import javax.xml.datatype.DatatypeFactory;
import javax.xml.datatype.XMLGregorianCalendar;
import com.aixm.delorean.core.adapter.type.date.AixmTimestamp;
import com.aixm.delorean.core.schema.a5_1.aixm.DateTimeType;
import java.sql.Timestamp;
import java.util.GregorianCalendar;


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
            GregorianCalendar cal = new GregorianCalendar(java.util.TimeZone.getTimeZone("UTC"));
            cal.setTime(v.getTimestamp());

            XMLGregorianCalendar xmlCal = DatatypeFactory.newInstance().newXMLGregorianCalendar(cal);
            xmlCal.setTimezone(0); // optional, ensures +00:00
            dateTimeType.setValue(xmlCal);
        } else {
            dateTimeType.setValue(null);
        }

        dateTimeType.setNilReason(v.getNilReason());
        return dateTimeType;
    }

}
