//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.schema.school;

import jakarta.xml.bind.annotation.adapters.XmlAdapter;
import org.locationtech.jts.geom.Point;

import com.aixm.delorean.core.schema.school.org.gml.PointType;

public class Adapter1
    extends XmlAdapter<PointType, Point>
{


    public Point unmarshal(PointType value) {
        return (com.aixm.delorean.core.util.GisUtil.parseGMLPoint(value));
    }

    public PointType marshal(Point value) {
        return (com.aixm.delorean.core.util.GisUtil.printGMLPoint(value));
    }

}
