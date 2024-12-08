package com.aixm.delorean.core.adapter.type.time;

import javax.xml.datatype.Duration;

import com.aixm.delorean.core.schema.a5_1_1.org.gml.TimeInstantPropertyType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.TimeIntervalLengthType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.TimePositionType;
import java.time.Instant;

public class AixmTimeSliceType {

    protected Instant begin;
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
