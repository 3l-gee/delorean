package com.aixm.delorean.core.adapter.gis;

import jakarta.xml.bind.annotation.adapters.XmlAdapter;
import org.locationtech.jts.geom.LineString;

import com.aixm.delorean.core.schema.school.org.gml.CurveType;

public class CurveTypeAdapter extends XmlAdapter<CurveType, LineString>
{

    public LineString unmarshal(CurveType value) {
        return (com.aixm.delorean.core.util.GisUtil.parseGMLCurve(value));
    }

    public CurveType marshal(LineString value) {
        return (com.aixm.delorean.core.util.GisUtil.printGMLCurve(value));
    }

}
