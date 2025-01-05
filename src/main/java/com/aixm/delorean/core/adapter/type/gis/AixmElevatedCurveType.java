package com.aixm.delorean.core.adapter.type.gis;

import java.util.List;

import com.aixm.delorean.core.gis.type.Segment;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Embeddable;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;

@Embeddable
public class AixmElevatedCurveType extends AixmElevatedGeometryType {

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
    protected List<Segment> segments;

    public List<Segment> getSegments() {
        return segments;
    }

    public void setSegments(List<Segment> segments) {
        this.segments = segments;
    }
}