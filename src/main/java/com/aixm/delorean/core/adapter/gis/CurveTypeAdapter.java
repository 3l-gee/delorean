package com.aixm.delorean.core.adapter.gis;

import jakarta.xml.bind.annotation.adapters.XmlAdapter;

public class CurveTypeAdapter extends XmlAdapter<com.aixm.delorean.core.schema.school.CurveType, AixmCurveType>
{

    public AixmCurveType unmarshal(com.aixm.delorean.core.schema.school.CurveType value) {
        return (com.aixm.delorean.core.util.GeospatialHelper.parseAIXMCurve(value));
    }

    public com.aixm.delorean.core.schema.school.CurveType marshal(AixmCurveType value) {
        return (com.aixm.delorean.core.util.GeospatialHelper.printAIXMCurve(value));
    }

}
