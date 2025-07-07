package com.aixm.delorean.core.adapter.type.gis;

import java.util.List;

import com.aixm.delorean.core.gis.type.PolygonSegment;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Embeddable;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.OneToMany;

@Embeddable
public class AixmSurfaceType extends AixmGeometryType {

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinTable(name = "master_join_geometry", joinColumns = {
        @JoinColumn(name = "source_id")
    }, inverseJoinColumns = {
        @JoinColumn(name = "target_id")
    })
    protected List<PolygonSegment> exteriorlinestring;


    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinTable(name = "master_join_geometry", joinColumns = {
        @JoinColumn(name = "source_id")
    }, inverseJoinColumns = {
        @JoinColumn(name = "target_id")
    })
    protected List<PolygonSegment> interiorlinestring;

    public List<PolygonSegment> getExteriorlinestring() {
        return exteriorlinestring;
    }

    public void setExteriorlinestring(List<PolygonSegment> value) {
        this.exteriorlinestring = value;
    }

    public List<PolygonSegment> getInteriorlinestring() {
        return interiorlinestring;
    }

    public void setInteriorlinestring(List<PolygonSegment> value) {
        this.interiorlinestring = value;
    }
}
