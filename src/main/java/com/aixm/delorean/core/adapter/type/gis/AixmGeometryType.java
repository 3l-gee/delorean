package com.aixm.delorean.core.adapter.type.gis;

import java.math.BigDecimal;

import com.aixm.delorean.core.schema.a5_1_1.aixm.UomDistanceType;

import jakarta.persistence.Column;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

abstract public class AixmGeometryType {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    protected String id;

    // @ElementCollection
    // @Column(name = "point_annotation")
    // protected List<String> annotation;

    @Column(name = "horizontalAccuracy_value")
    protected BigDecimal horizontalAccuracy;

    @Enumerated(EnumType.STRING)
    @Column(name = "horizontalAccuracy_uom")
    protected UomDistanceType horizontalAccuracy_uom;

    @Column(name = "horizontalAccuracy_nilReason")
    protected String horizontalAccuracy_nilReason;

    public String getId() {
        return id;
    }

    public void setId(String value) {
        this.id = value;
    }

    public BigDecimal getHorizontalAccuracy() {
        return horizontalAccuracy;
    }

    public void setHorizontalAccuracy(BigDecimal value) {
        this.horizontalAccuracy = value;
    }

    public UomDistanceType getHorizontalAccuracy_uom() {
        return horizontalAccuracy_uom;
    }

    public void setHorizontalAccuracy_uom(UomDistanceType value) {
        this.horizontalAccuracy_uom = value;
    }

    public String getHorizontalAccuracy_nilReason() {
        return horizontalAccuracy_nilReason;
    }

    public void setHorizontalAccuracy_nilReason(String value) {
        this.horizontalAccuracy_nilReason = value;
    }
}
