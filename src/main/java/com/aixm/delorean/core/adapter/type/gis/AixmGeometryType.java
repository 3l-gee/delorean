package com.aixm.delorean.core.adapter.type.gis;

import java.math.BigDecimal;

import jakarta.persistence.Column;
import jakarta.persistence.MappedSuperclass;
import jakarta.persistence.Transient;

@MappedSuperclass
abstract public class AixmGeometryType {
    
    @Transient
    protected String xmlId;

    @Column(name = "horizontalAccuracy")
    protected BigDecimal horizontalAccuracy;

    @Column(name = "horizontalAccuracy_uom")
    protected String horizontalAccuracy_uom;

    @Column(name = "horizontalAccuracy_nilReason")
    protected String horizontalAccuracy_nilReason;

    public String getXmlId() {
        return xmlId;
    }

    public void setXmlId(String value) {
        this.xmlId = value;
    }

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
}
