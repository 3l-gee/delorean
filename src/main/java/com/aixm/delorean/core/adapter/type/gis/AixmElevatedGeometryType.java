package com.aixm.delorean.core.adapter.type.gis;

import java.math.BigDecimal;

import jakarta.persistence.Column;
import jakarta.persistence.MappedSuperclass;

@MappedSuperclass
abstract public class AixmElevatedGeometryType extends AixmGeometryType {

    @Column(name = "elevation")
    protected BigDecimal elevation;

    @Column(name = "elevation_uom")
    protected String elevation_uom;

    @Column(name = "eleveation_nilReason")
    protected String elevation_nilReason;

    @Column(name = "geoidUndulation")
    protected BigDecimal geoidUndulation;

    @Column(name = "geoidUndulation_uom")
    protected String geoidUndulation_uom;

    @Column(name = "geoidUndulation_nilReason")
    protected String geoidUndulation_nilReason;

    @Column(name = "verticalDatum")
    protected String verticalDatum;

    @Column(name = "verticalDatum_nilReason")
    protected String verticalDatum_nilReason;

    @Column(name = "verticalAccuracy")
    protected BigDecimal verticalAccuracy;

    @Column(name = "verticalAccuracy_uom")
    protected String verticalAccuracy_uom;

    @Column(name = "verticalAccuracy_nilReason")
    protected String verticalAccuracy_nilReason;

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
