package com.aixm.delorean.core.adapter.gis;

import com.aixm.delorean.core.adapter.type.gis.AixmCurveType;

import jakarta.xml.bind.annotation.adapters.XmlAdapter;

public class CurveTypeAdapter extends XmlAdapter<com.aixm.delorean.core.schema.a5_1_1.aixm.CurveType, AixmCurveType>
{

    public AixmCurveType unmarshal(com.aixm.delorean.core.schema.a5_1_1.aixm.CurveType value) {
        return (com.aixm.delorean.core.helper.gis.GisHelper.parseAIXMCurve(value));
    }

    public com.aixm.delorean.core.schema.a5_1_1.aixm.CurveType marshal(AixmCurveType value) {
        return (com.aixm.delorean.core.helper.gis.GisHelper.printAIXMCurve(value));
    }

}
