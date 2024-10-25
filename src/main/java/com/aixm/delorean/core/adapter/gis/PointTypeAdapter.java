package com.aixm.delorean.core.adapter.gis;

import jakarta.xml.bind.annotation.adapters.XmlAdapter;

import com.aixm.delorean.core.schema.school.PointType;

public class PointTypeAdapter extends XmlAdapter<PointType, AixmPointType>
{

    public AixmPointType unmarshal(PointType value) {
        return (com.aixm.delorean.core.util.GeospatialHelper.parseAIXMPoint(value));
    }

    public PointType marshal(AixmPointType value) {
        return (com.aixm.delorean.core.util.GeospatialHelper.printAIXMPoint(value));
    }

}
