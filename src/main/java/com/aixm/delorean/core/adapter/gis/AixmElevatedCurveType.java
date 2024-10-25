package com.aixm.delorean.core.adapter.gis;

import java.util.List;

import org.locationtech.jts.geom.LineString;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.xml.bind.annotation.XmlTransient;

@Embeddable
public class AixmElevatedCurveType {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    @XmlTransient
    protected String id;

    @Column(name = "linestring", columnDefinition = "geometry(Linestring, 4326)")
    protected LineString lineString;

    @Column(name = "horizontalAccuracy")
    protected long elevation;

    @Column(name = "geoidUndulation")
    protected long geoidUndulation;

    @Column(name = "horizontalDatum")
    protected String verticalDatum;

    @Column(name = "horizontalAccuracy")
    protected long horizontalAccuracy;

    @Column(name = "verticalAccuracy")
    protected long verticalAccuracy;

    @OneToMany(mappedBy = "id")
    protected List<String> annotation;

    public String getId() {
        return id;
    }

    public void setId(String value) {
        this.id = value;
    }

    public LineString getLineString() {
        return lineString;
    }

    public void setLineString(LineString value) {
        this.lineString = value;
    }

    public long getElevation() {
        return elevation;
    }

    public void setElevation(long value) {
        this.elevation = value;
    }

    public long getGeoidUndulation() {
        return geoidUndulation;
    }

    public void setGeoidUndulation(long value) {
        this.geoidUndulation = value;
    }

    public String getVerticalDatum() {
        return verticalDatum;
    }

    public void setVerticalDatum(String value) {
        this.verticalDatum = value;
    }

    public long getHorizontalAccuracy() {
        return horizontalAccuracy;
    }

    public void setHorizontalAccuracy(long value) {
        this.horizontalAccuracy = value;
    }

    public long getVerticalAccuracy() {
        return verticalAccuracy;
    }

    public void setVerticalAccuracy(long value) {
        this.verticalAccuracy = value;
    }

    public List<String> getAnnotation() {
        return annotation;
    }

    public void setAnnotation(List<String> annotation) {
        this.annotation = annotation;
    }
}