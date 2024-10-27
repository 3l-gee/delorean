package com.aixm.delorean.core.adapter.type.gis;

import java.util.List;

import org.locationtech.jts.geom.Point;

import jakarta.persistence.Column;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Embeddable;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

@Embeddable
public class AixmElevatedPointType {

    // @Id
    // @GeneratedValue(strategy = GenerationType.IDENTITY)
    // @Column(name = "id", nullable = false)
    // protected String id;

    @Column(name = "point", columnDefinition = "geometry(Point, 4326)")
    protected Point point;

    @Column(name = "elevation")
    protected Long elevation;

    @Column(name = "geoidUndulation")
    protected Long geoidUndulation;

    @Column(name = "horizontalDatum")
    protected String verticalDatum;

    @Column(name = "horizontalAccuracy")
    protected Long horizontalAccuracy;

    @Column(name = "verticalAccuracy")
    protected Long verticalAccuracy;

    @ElementCollection
    @Column(name = "annotation")
    protected List<String> annotation;

    // public String getId() {
    //     return id;
    // }

    // public void setId(String value) {
    //     this.id = value;
    // }

    public Point getPoint() {
        return point;
    }   

    public void setPoint(Point value) {
        this.point = value;
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
    
    public Long getHorizontalAccuracy() {
        return horizontalAccuracy;
    }

    public void setHorizontalAccuracy(Long value) {
        this.horizontalAccuracy = value;
    }

    public Long getVerticalAccuracy() {
        return verticalAccuracy;
    }

    public void setVerticalAccuracy(Long value) {
        this.verticalAccuracy = value;
    }

    public List<String> getAnnotation() {
        return annotation;
    }
    
    public void setAnnotation(List<String> value) {
        this.annotation = value;
    }
}
