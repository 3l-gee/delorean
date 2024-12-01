package com.aixm.delorean.core.adapter.type.gis;

import java.math.BigDecimal;

import jakarta.persistence.Column;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;

abstract public class AixmElevatedGeometryType extends AixmGeometryType {

    // @Column(name = "point_horizontalAccuracy_value")
    // protected BigDecimal horizontalAccuracy;

    // @Enumerated(EnumType.STRING)
    // @Column(name = "point_horizontalAccuracy_uom")
    // protected UomDistanceType horizontalAccuracy_uom;

    // @Column(name = "point_horizontalAccuracy_nilReason")
    // protected String horizontalAccuracy_nilReason;

    @Column(name = "elevation_value")
    protected BigDecimal elevation;

    @Enumerated(EnumType.STRING)
    @Column(name = "elevation_uom")
    protected String elevation_uom;

    @Column(name = "eleveation_nilReason")
    protected String elevation_nilReason;

    @Column(name = "geoidUndulation_value")
    protected BigDecimal geoidUndulation;

    @Enumerated(EnumType.STRING)
    @Column(name = "geoidUndulation_uom")
    protected String geoidUndulation_uom;

    @Column(name = "geoidUndulation_nilReason")
    protected String geoidUndulation_nilReason;

    @Enumerated(EnumType.STRING)
    @Column(name = "verticalDatum_value")
    protected String verticalDatum;

    @Column(name = "verticalDatum_nilReason")
    protected String verticalDatum_nilReason;

    @Column(name = "verticalAccuracy_value")
    protected BigDecimal verticalAccuracy;

    @Enumerated(EnumType.STRING)
    @Column(name = "verticalAccuracy_uom")
    protected String verticalAccuracy_uom;

    @Column(name = "verticalAccuracy_nilReason")
    protected String verticalAccuracy_nilReason;

    public BigDecimal getHorizontalAccuracy() {
        return horizontalAccuracy;
    }

    public void setHorizontalAccuracy(BigDecimal value) {
        this.horizontalAccuracy = value;
    }

    public String getHorizontalAccuracy_uom() {
        return horizontalAccuracy_uom;
    }

    public void setHorizontalAccuracy_uom(String value) {
        this.horizontalAccuracy_uom = value;
    }

    public String getHorizontalAccuracy_nilReason() {
        return horizontalAccuracy_nilReason;
    }

    public void setHorizontalAccuracy_nilReason(String value) {
        this.horizontalAccuracy_nilReason = value;
    }

    public BigDecimal getElevation() {
        return elevation;
    }

    public void setElevation(BigDecimal value) {
        this.elevation = value;
    }

    public String getElevation_uom() {
        return elevation_uom;
    }

    public void setElevation_uom(String value) {
        this.elevation_uom = value;
    }

    public String getElevation_nilReason() {
        return elevation_nilReason;
    }

    public void setElevation_nilReason(String value) {
        this.elevation_nilReason = value;
    }

    public BigDecimal getGeoidUndulation() {
        return geoidUndulation;
    }

    public void setGeoidUndulation(BigDecimal value) {
        this.geoidUndulation = value;
    }

    public String getGeoidUndulation_uom() {
        return geoidUndulation_uom;
    }

    public void setGeoidUndulation_uom(String value) {
        this.geoidUndulation_uom = value;
    }

    public String getGeoidUndulation_nilReason() {
        return geoidUndulation_nilReason;
    }

    public void setGeoidUndulation_nilReason(String value) {
        this.geoidUndulation_nilReason = value;
    }

    public String getVerticalDatum() {
        return verticalDatum;
    }

    public void setVerticalDatum(String value) {
        this.verticalDatum = value;
    }

    public String getVerticalDatum_nilReason() {
        return verticalDatum_nilReason;
    }

    public void setVerticalDatum_nilReason(String value) {
        this.verticalDatum_nilReason = value;
    }

    public BigDecimal getVerticalAccuracy() {
        return verticalAccuracy;
    }

    public void setVerticalAccuracy(BigDecimal value) {
        this.verticalAccuracy = value;
    }

    public String getVerticalAccuracy_uom() {
        return verticalAccuracy_uom;
    }

    public void setVerticalAccuracy_uom(String value) {
        this.verticalAccuracy_uom = value;
    }

    public String getVerticalAccuracy_nilReason() {
        return verticalAccuracy_nilReason;
    }

    public void setVerticalAccuracy_nilReason(String value) {
        this.verticalAccuracy_nilReason = value;
    }    
}
