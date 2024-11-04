package com.aixm.delorean.core.adapter.type.gis;

import org.locationtech.jts.geom.Polygon;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;

@Embeddable
public class AixmElevatedSurfaceType extends AixmElevatedGeometryType {

    @Column(name = "geomSurface", columnDefinition = "geometry(Polygon, 4326)")
    protected Polygon polygon;

    public Polygon getPolygon() {
        return polygon;
    }

    public void setPolygon(Polygon value) {
        this.polygon = value;
    }

}
