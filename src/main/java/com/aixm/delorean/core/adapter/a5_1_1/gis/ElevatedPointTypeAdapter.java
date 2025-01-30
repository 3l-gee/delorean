package com.aixm.delorean.core.adapter.a5_1_1.gis;

import jakarta.xml.bind.annotation.adapters.XmlAdapter;

import com.aixm.delorean.core.adapter.type.gis.AixmElevatedPointType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.ElevatedPointType;

public class ElevatedPointTypeAdapter extends XmlAdapter<ElevatedPointType, AixmElevatedPointType>
{
    @Override
    public AixmElevatedPointType unmarshal(ElevatedPointType value) throws Exception{
        try {
            return (com.aixm.delorean.core.helper.gis.GisHelper.parseAIXMElevatedPoint(value));
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public ElevatedPointType marshal(AixmElevatedPointType value) throws Exception{
        return (com.aixm.delorean.core.helper.gis.GisHelper.printAIXMElevatedPoint(value, new ElevatedPointType()));
    }
}
