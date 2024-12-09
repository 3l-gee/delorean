package com.aixm.delorean.core.converter.type.time;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;

import java.time.Instant;

@Embeddable
public class AixmTimeSliceType {

    @Column(name = "begin", nullable = false)
    protected Instant begin;
    @Column(name = "end")
    protected Instant end;

    public Instant getBegin() {
        return begin;
    }

    public void setBegin(Instant value) {
        this.begin = value;
    }

    public Instant getEnd() {
        return end;
    }

    public void setEnd(Instant value) {
        this.end = value;
    }
    
}
