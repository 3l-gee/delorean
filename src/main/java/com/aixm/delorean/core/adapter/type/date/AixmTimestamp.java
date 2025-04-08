


package com.aixm.delorean.core.adapter.type.date;

import jakarta.persistence.Embeddable;

@Embeddable
public class AixmTimestamp {

    protected java.sql.Timestamp timestamp;

    protected String nilReason;

    public java.sql.Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(java.sql.Timestamp timestamp) {
        this.timestamp = timestamp;
    }

    public String getNilReason() {
        return nilReason;
    }

    public void setNilReason(String nilReason) {
        this.nilReason = nilReason;
    }
     
}