package com.aixm.delorean.core.adapter.gis;

import jakarta.xml.bind.annotation.adapters.XmlAdapter;

import com.aixm.delorean.core.adapter.type.gis.AixmElevatedCurveType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.ElevatedCurveType;

public class ElevatedCurveTypeAdapter extends XmlAdapter<ElevatedCurveType, AixmElevatedCurveType>
{

    public AixmElevatedCurveType unmarshal(ElevatedCurveType value) {
        return (com.aixm.delorean.core.util.GeospatialHelper.parseAIXMElevatedCurve(value));
    }

    public ElevatedCurveType marshal(AixmElevatedCurveType value) {
        return (com.aixm.delorean.core.util.GeospatialHelper.printAIXMElevatedCurve(value));
    }

}