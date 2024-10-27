package com.aixm.delorean.core.adapter.type.gis;

import java.util.List;

import org.locationtech.jts.geom.LineString;

import jakarta.persistence.Column;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Embeddable;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

@Embeddable
public class AixmCurveType {
    
    // @Id
    // @GeneratedValue(strategy = GenerationType.IDENTITY)
    // @Column(name = "id"/* , nullable = false*/)
    // protected String id;

    @Column(name = "linestring", columnDefinition = "geometry(Linestring, 4326)")
    protected LineString lineString;

    @Column(name = "horizontalAccuracy")
    protected Long horizontalAccuracy;
    
    @ElementCollection
    @Column(name = "annotation")
    protected List<String> annotation;

    // public String getId() {
    //     return id;
    // }

    // public void setId(String value) {
    //     this.id = value;
    // }

    public LineString getLineString() {
        return lineString;
    }

    public void setLineString(LineString value) {
        this.lineString = value;
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

    public void setAnnotation(List<String> annotation) {
        this.annotation = annotation;
    }

}
