package com.aixm.delorean.core.adapter.date;

import jakarta.xml.bind.annotation.adapters.XmlAdapter;
import javax.xml.datatype.XMLGregorianCalendar;
import java.sql.Timestamp;

public class XMLGregorianCalendarAdapter extends XmlAdapter<XMLGregorianCalendar, Timestamp> {

    @Override
    public Timestamp unmarshal(XMLGregorianCalendar xmlGregorianCalendar) throws Exception {
        if (xmlGregorianCalendar == null) {
            return null;
        }
        return new Timestamp(xmlGregorianCalendar.toGregorianCalendar().getTimeInMillis());
    }

    @Override
    public XMLGregorianCalendar marshal(Timestamp timestamp) throws Exception {
        if (timestamp == null) {
            return null;
        }
        javax.xml.datatype.DatatypeFactory datatypeFactory = javax.xml.datatype.DatatypeFactory.newInstance();
        return datatypeFactory.newXMLGregorianCalendar(
                new java.util.GregorianCalendar() {{
                    setTimeInMillis(timestamp.getTime());
                }}
        );
    }
}
