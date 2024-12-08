package com.aixm.delorean.core.adapter.type.gis;

import java.math.BigDecimal;

import jakarta.persistence.Column;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.MappedSuperclass;

@MappedSuperclass
abstract public class AixmGeometryType {
    
    @Column(name = "xml_id")
    protected String id;

    @Column(name = "horizontalAccuracy_value")
    protected BigDecimal horizontalAccuracy;

    @Column(name = "horizontalAccuracy_uom")
    protected String horizontalAccuracy_uom;

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
