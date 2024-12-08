package com.aixm.delorean.core.adapter.gis;

import jakarta.xml.bind.annotation.adapters.XmlAdapter;

import com.aixm.delorean.core.adapter.type.gis.AixmElevatedPointType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.ElevatedPointType;

public class ElevatedPointTypeAdapter extends XmlAdapter<ElevatedPointType, AixmElevatedPointType>
{

    public AixmElevatedPointType unmarshal(ElevatedPointType value) {
        return (com.aixm.delorean.core.helper.gis.GisHelper.parseAIXMElevatedPoint(value));
    }

    public ElevatedPointType marshal(AixmElevatedPointType value) {
        return (com.aixm.delorean.core.helper.gis.GisHelper.printAIXMElevatedPoint(value));
    }

}
