package com.aixm.delorean.core.adapter.type.gis;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Embeddable;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.OneToMany;

import java.util.List;

import com.aixm.delorean.core.gis.type.LinestringSegment;

@Embeddable
public class AixmCurveType extends AixmGeometryType {
    
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinTable(name = "master_join_geometry", joinColumns = {
        @JoinColumn(name = "source_id")
    }, inverseJoinColumns = {
        @JoinColumn(name = "target_id")
    })
    protected List<LinestringSegment> segments;

    public List<LinestringSegment> getSegments() {
        return segments;
    }

    public void setSegments(List<LinestringSegment> segments) {
        this.segments = segments;
    }

}
