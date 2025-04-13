package com.aixm.delorean.core.adapter.a5_1.date;

import jakarta.xml.bind.annotation.adapters.XmlAdapter;

import javax.xml.datatype.DatatypeFactory;
import javax.xml.datatype.XMLGregorianCalendar;
import com.aixm.delorean.core.adapter.type.date.AixmTimestamp;
import com.aixm.delorean.core.schema.a5_1.aixm.DateType;
import java.sql.Timestamp;
import java.util.GregorianCalendar;


public class DateTypeAdapter extends XmlAdapter<DateType, AixmTimestamp> {

    @Override
    public AixmTimestamp unmarshal(DateType v) throws Exception {
        if (v == null) {
            return null;
        }

        AixmTimestamp timestamp = new AixmTimestamp();
        timestamp.setTimestamp(new Timestamp(v.getValue().toGregorianCalendar().getTimeInMillis()));
        timestamp.setNilReason(v.getNilReason());

        return timestamp;
    }

    @Override
    public DateType marshal(AixmTimestamp v) throws Exception {
        if (v == null) {
            return null;
        }

        DateType date = new DateType();
        if (v.getTimestamp() != null) {
            GregorianCalendar cal = new GregorianCalendar(java.util.TimeZone.getTimeZone("UTC"));
            cal.setTime(v.getTimestamp());

            XMLGregorianCalendar xmlCal = DatatypeFactory.newInstance().newXMLGregorianCalendar(cal);
            xmlCal.setTimezone(0); // optional, ensures +00:00
            date.setValue(xmlCal);
        } else {
            date.setValue(null);
        }

        date.setNilReason(v.getNilReason());
        return date;
    }

}
