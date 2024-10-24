package com.aixm.delorean.core.adapter.gis;

import java.util.List;

import org.locationtech.jts.geom.Point;

public class AixmPointType {
    
    protected String id;
    protected Point point;
    protected Long horizontalAccuracy;
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