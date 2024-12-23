package com.aixm.delorean.core.adapter.type.gis;

import org.locationtech.jts.geom.MultiPolygon;
import org.locationtech.jts.geom.Polygon;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;

@Embeddable
public class AixmSurfaceType extends AixmGeometryType {

    @Column(name = "polygon", columnDefinition = "geometry(MultiPolygon, 4326)")
    protected MultiPolygon multiPolygon;

    public MultiPolygon getMultiPolygon() {
        return multiPolygon;
    }

    public void setMultiPolygon(MultiPolygon value) {
        this.multiPolygon = value;
    }
}
