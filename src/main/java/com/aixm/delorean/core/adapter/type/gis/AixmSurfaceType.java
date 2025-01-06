package com.aixm.delorean.core.adapter.type.gis;

import java.util.List;

import com.aixm.delorean.core.gis.type.Segment;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Embeddable;
import jakarta.persistence.OneToMany;

@Embeddable
public class AixmSurfaceType extends AixmGeometryType {

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
    protected List<Segment> outerlinestring;

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
    protected List<List<Segment>> interiorlinestrings;

    public List<Segment> getOuterlinestring() {
        return outerlinestring;
    }

    public void setOuterlinestring(List<Segment> value) {
        this.outerlinestring = value;
    }

    public List<List<Segment>> getInteriorlinestrings() {
        return interiorlinestrings;
    }

    public void setInteriorlinestrings(List<List<Segment>> value) {
        this.interiorlinestrings = value;
    }
}
