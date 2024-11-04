package com.aixm.delorean.core.adapter.type.gis;

import org.locationtech.jts.geom.LineString;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;

@Embeddable
public class AixmElevatedCurveType extends AixmElevatedGeometryType {

    @Column(name = "linestring", columnDefinition = "geometry(Linestring, 4326)")
    protected LineString lineString;

    public LineString getLineString() {
        return lineString;
    }

    public void setLineString(LineString value) {
        this.lineString = value;
    }

}