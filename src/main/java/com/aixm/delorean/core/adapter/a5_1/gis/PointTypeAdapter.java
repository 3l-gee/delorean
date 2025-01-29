package com.aixm.delorean.core.adapter.a5_1.gis;

import jakarta.xml.bind.annotation.adapters.XmlAdapter;

import com.aixm.delorean.core.adapter.type.gis.AixmPointType;
import com.aixm.delorean.core.schema.a5_1.aixm.PointType;

public class PointTypeAdapter extends XmlAdapter<PointType, AixmPointType>
{
    @Override
    public AixmPointType unmarshal(PointType value) throws Exception {
        try {
            return (com.aixm.delorean.core.helper.gis.GisHelper.parseAIXMPoint(value));
        } catch (IllegalArgumentException e) {
            return null;
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public PointType marshal(AixmPointType value) throws Exception {
        return (com.aixm.delorean.core.helper.gis.GisHelper.printAIXMPoint(value, new PointType()));
    }

}
