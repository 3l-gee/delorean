package com.aixm.delorean.core.adapter.gis;

import java.util.List;

import org.locationtech.jts.geom.Point;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.xml.bind.annotation.XmlTransient;

@Embeddable
public class AixmPointType {
        
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    @XmlTransient
    protected String id;

    @Column(name = "point", columnDefinition = "geometry(Point, 4326)")
    protected Point point;

    @Column(name = "horizontalAccuracy")
    protected Long horizontalAccuracy;

    @OneToMany(mappedBy = "id")
    protected List<String> annotation;

    public String getId() {
        return id;
    }

    public void setId(String value) {
        this.id = value;
    }

    public Point getPoint() {
        return point;
    }

    public void setPoint(Point value) {
        this.point = value;
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