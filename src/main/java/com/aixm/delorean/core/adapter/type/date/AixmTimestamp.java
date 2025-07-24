package com.aixm.delorean.core.adapter.type.date;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;

@Embeddable
public class AixmTimestamp {

    @Column(name = "value", columnDefinition = "TIMESTAMP")
    protected java.sql.Timestamp value;

    @Column(name = "nilReason", length = 255)
    protected String nilReason;

    public java.sql.Timestamp getTimestamp() {
        return value;
    }

    public void setTimestamp(java.sql.Timestamp value) {
        this.value = value;
    }

    public String getNilReason() {
        return nilReason;
    }

    public void setNilReason(String nilReason) {
        this.nilReason = nilReason;
    }
     
}