package com.aixm.delorean.core.gis.type;
import org.locationtech.jts.geom.LineString;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.SequenceGenerator;
import jakarta.xml.bind.annotation.XmlTransient;


@Entity
@Table(name = "segment", schema = "public")
public class Segment {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "segment_seq")
    @SequenceGenerator(name = "segment_seq", sequenceName = "segment_seq", allocationSize = 1)
    @Column(name = "id", nullable = false)
    @XmlTransient
    protected Long dbid;

    @Column(name = "linestring", columnDefinition = "geometry(LineString, 4326)")
    protected LineString lineString;

    @Column(name = "sequence")
    protected Long order;

    public enum Interpretation {
        GEODESIC,
        LINESTRING,
        ARCBYCENTER
    }

    @Column(name = "interpretation")
    protected Interpretation interpretation;

    public Long getId() {
        return dbid;
    }

    public void setId(Long value) {
        this.dbid = value;
    }

    // public String getFeatureId() {
    //     return featureId;
    // }

    // public void setFeatureId(String value) {
    //     this.featureId = value;
    // }

    public LineString getLineString() {
        return lineString;
    }

    public void setLineString(LineString value) {
        this.lineString = value;
    }

    public Interpretation getInterpretation() {
        return interpretation;
    }

    public void setInterpretation(Interpretation value) {
        this.interpretation = value;
    }



}
