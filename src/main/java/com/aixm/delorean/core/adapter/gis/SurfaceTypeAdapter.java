package com.aixm.delorean.core.adapter.gis;

import jakarta.xml.bind.annotation.adapters.XmlAdapter;
import org.locationtech.jts.geom.Polygon;

import com.aixm.delorean.core.schema.school.org.gml.SurfaceType;

public class SurfaceTypeAdapter extends XmlAdapter<SurfaceType, Polygon>
{

    public Polygon unmarshal(SurfaceType value) {
        return (com.aixm.delorean.core.util.GisUtil.parseGMLSurface(value));
    }

    public SurfaceType marshal(Polygon value) {
        return (com.aixm.delorean.core.util.GisUtil.printGMLSurface(value));
    }

}
