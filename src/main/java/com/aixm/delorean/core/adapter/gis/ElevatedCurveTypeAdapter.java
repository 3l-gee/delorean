package com.aixm.delorean.core.adapter.gis;

import jakarta.xml.bind.annotation.adapters.XmlAdapter;

import com.aixm.delorean.core.schema.school.ElevatedCurveType;

public class ElevatedCurveTypeAdapter extends XmlAdapter<ElevatedCurveType, AixmElevatedCurveType>
{

    public AixmElevatedCurveType unmarshal(ElevatedCurveType value) {
        return (com.aixm.delorean.core.util.GeospatialHelper.parseAIXMElevatedCurve(value));
    }

    public ElevatedCurveType marshal(AixmElevatedCurveType value) {
        return (com.aixm.delorean.core.util.GeospatialHelper.printAIXMElevatedCurve(value));
    }

}