package com.aixm.delorean.core.schema.school;

import org.locationtech.jts.geom.Point;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;

@Embeddable
public class PersitentPointType {
    
    @Column(name = "aixmPoint", columnDefinition = "geometry(Point, 4326)")
    protected Point point;
    @Column(name = "horizontalAccuracy")
    protected Long horizontalAccuracy;
    @Column(name = "annotation")
    protected String annotation;

    public Point getPoint() {
        return point;
    }

    public void setPoint(Point point) {
        this.point = point;
    }

    public Long getHorizontalAccuracy() {
        return horizontalAccuracy;
    }

    public void setHorizontalAccuracy(Long horizontalAccuracy) {
        this.horizontalAccuracy = horizontalAccuracy;
    }

    public String getAnnotation() {
        return annotation;
    }

    public void setAnnotation(String annotation) {
        this.annotation = annotation;
    }

}
