package com.aixm.delorean.core.adapter.type.gis;

import org.locationtech.jts.geom.Polygon;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;

@Embeddable
public class AixmSurfaceType extends AixmGeometryType {

    @Column(name = "surface", columnDefinition = "geometry(Polygon, 4326)")
    protected Polygon polygon;

    public Polygon getPolygon() {
        return polygon;
    }

    public void setPolygon(Polygon value) {
        this.polygon = value;
    }
}
