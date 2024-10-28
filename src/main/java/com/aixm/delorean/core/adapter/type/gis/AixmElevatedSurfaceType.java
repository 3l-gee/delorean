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
public class AixmElevatedSurfaceType {

    @Column(name = "geomSurface", columnDefinition = "geometry(Polygon, 4326)")
    protected Polygon polygon;

    @Column(name = "elevation")
    protected Long elevation;

    @Column(name = "geoidUndulation")
    protected Long geoidUndulation;

    @Column(name = "verticalDatum")
    protected String verticalDatum;

    @Column(name = "verticalAccuracy")
    protected Long verticalAccuracy;

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

    public Long getElevation() {
        return elevation;
    }

    public void setElevation(Long value) {
        this.elevation = value;
    }

    public Long getGeoidUndulation() {
        return geoidUndulation;
    }

    public void setGeoidUndulation(Long value) {
        this.geoidUndulation = value;
    }

    public String getVerticalDatum() {
        return verticalDatum;
    }

    public void setVerticalDatum(String value) {
        this.verticalDatum = value;
    }

    public Long getVerticalAccuracy() {
        return verticalAccuracy;
    }

    public void setVerticalAccuracy(Long value) {
        this.verticalAccuracy = value;
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
