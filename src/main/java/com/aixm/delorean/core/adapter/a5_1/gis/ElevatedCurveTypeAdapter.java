package com.aixm.delorean.core.adapter.a5_1.gis;

import jakarta.xml.bind.annotation.adapters.XmlAdapter;

import com.aixm.delorean.core.adapter.type.gis.AixmElevatedCurveType;
import com.aixm.delorean.core.schema.a5_1.aixm.ElevatedCurveType;

public class ElevatedCurveTypeAdapter extends XmlAdapter<ElevatedCurveType, AixmElevatedCurveType>
{

    public AixmElevatedCurveType unmarshal(ElevatedCurveType value) {
        return (com.aixm.delorean.core.helper.gis.GisHelper.parseAIXMElevatedCurve(value));
    }

    public ElevatedCurveType marshal(AixmElevatedCurveType value) {
        return (com.aixm.delorean.core.helper.gis.GisHelper.printAIXMElevatedCurve(value, new ElevatedCurveType()));
    }

}