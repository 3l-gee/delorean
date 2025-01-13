package com.aixm.delorean.core.adapter.type.gis;

import org.locationtech.jts.geom.Point;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;

@Embeddable
public class AixmPointType extends AixmGeometryType {

    @Column(name = "point", columnDefinition = "geometry(Point, 4326)")
    protected Point point;

    @Column(name = "point_ref")
    protected String pointRef;

    public Point getPoint() {
        return point;
    }

    public void setPoint(Point value) {
        this.point = value;
    }

    public String getPointRef() {
        return pointRef;
    }

    public void setPointRef(String value) {
        this.pointRef = value;
    }
}