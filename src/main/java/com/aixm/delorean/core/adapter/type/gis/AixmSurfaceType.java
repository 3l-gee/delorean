package com.aixm.delorean.core.adapter.type.gis;

import java.util.List;

import org.locationtech.jts.geom.LineString;
import org.locationtech.jts.geom.Polygon;

import jakarta.persistence.Column;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Embeddable;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

@Embeddable
public class AixmSurfaceType {

    @Column(name = "geomSurface", columnDefinition = "geometry(Polygon, 4326)")
    protected Polygon polygon;

    @Column(name = "horizontalAccuracy")
    protected Long horizontalAccuracy;
    
    @ElementCollection
    @Column(name = "annotation")
    protected List<String> annotation;

    public Polygon getPolygon() {
        return polygon;
    }

    public void setPolygon(Polygon value) {
        this.polygon = value;
    }

    public Long getHorizontalAccuracy() {
        return horizontalAccuracy;
    }

    public void setHorizontalAccuracy(Long value) {
        this.horizontalAccuracy = value;
    }

    public List<String> getAnnotation() {
        return annotation;
    }

    public void setAnnotation(List<String> value) {
        this.annotation = value;
    }
    
}
