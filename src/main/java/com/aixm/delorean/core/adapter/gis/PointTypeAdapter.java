package com.aixm.delorean.core.adapter.gis;

import jakarta.xml.bind.annotation.adapters.XmlAdapter;

import com.aixm.delorean.core.adapter.type.gis.AixmPointType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.PointType;

public class PointTypeAdapter extends XmlAdapter<PointType, AixmPointType>
{

    public AixmPointType unmarshal(PointType value) {
        return (com.aixm.delorean.core.helper.gis.GisHelper.parseAIXMPoint(value));
    }

    public PointType marshal(AixmPointType value) {
        return (com.aixm.delorean.core.helper.gis.GisHelper.printAIXMPoint(value));
    }

}
