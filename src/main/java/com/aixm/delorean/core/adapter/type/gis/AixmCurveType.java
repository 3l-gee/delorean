package com.aixm.delorean.core.adapter.type.gis;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Embeddable;
import jakarta.persistence.FetchType;
import jakarta.persistence.OneToMany;

import java.util.List;

import com.aixm.delorean.core.gis.type.LinestringSegment;

@Embeddable
public class AixmCurveType extends AixmGeometryType {
    
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    protected List<LinestringSegment> segments;

    public List<LinestringSegment> getSegments() {
        return segments;
    }

    public void setSegments(List<LinestringSegment> segments) {
        this.segments = segments;
    }

}
