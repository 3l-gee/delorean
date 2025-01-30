package com.aixm.delorean.core.adapter.a5_1.gis;

import com.aixm.delorean.core.adapter.type.gis.AixmCurveType;

import jakarta.xml.bind.annotation.adapters.XmlAdapter;

public class CurveTypeAdapter extends XmlAdapter<com.aixm.delorean.core.schema.a5_1.aixm.CurveType, AixmCurveType>
{
    @Override
    public AixmCurveType unmarshal(com.aixm.delorean.core.schema.a5_1.aixm.CurveType value) throws Exception {
        try {
            return (com.aixm.delorean.core.helper.gis.GisHelper.parseAIXMCurve(value));
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public com.aixm.delorean.core.schema.a5_1.aixm.CurveType marshal(AixmCurveType value) throws Exception {
        return (com.aixm.delorean.core.helper.gis.GisHelper.printAIXMCurve(value, new com.aixm.delorean.core.schema.a5_1.aixm.CurveType()));
    }
}
