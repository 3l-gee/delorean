package com.aixm.delorean.core.adapter.gis;

import jakarta.xml.bind.annotation.adapters.XmlAdapter;
import org.locationtech.jts.geom.Point;

import com.aixm.delorean.core.schema.school.org.gml.PointType;

public class PointTypeAdapter extends XmlAdapter<PointType, Point>
{

    public Point unmarshal(PointType value) {
        return (com.aixm.delorean.core.util.GisUtil.parseGMLPoint(value));
    }

    public PointType marshal(Point value) {
        return (com.aixm.delorean.core.util.GisUtil.printGMLPoint(value));
    }

}
