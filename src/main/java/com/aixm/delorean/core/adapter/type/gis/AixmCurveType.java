package com.aixm.delorean.core.adapter.type.gis;

import org.locationtech.jts.geom.LineString;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;

@Embeddable
public class AixmCurveType extends AixmGeometryType {
    
    @Column(name = "linestring", columnDefinition = "geometry(LineString, 4326)")
    protected LineString lineString;

    public enum Interpretation {
        GEODESIC,
        LINESTRING
    }

    @Column(name = "interpretation")
    public Interpretation interpretation;

    public LineString getLineString() {
        return lineString;
    }

    public void setLineString(LineString value) {
        this.lineString = value;
    }

    public Interpretation getInterpretation() {
        return interpretation;
    }

    public void setInterpretation(Interpretation value) {
        this.interpretation = value;
    }
}
