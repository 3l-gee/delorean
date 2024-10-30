package com.aixm.delorean.core.adapter.type.gis;

import java.math.BigDecimal;

import org.locationtech.jts.geom.LineString;

import com.aixm.delorean.core.schema.a5_1_1.aixm.UomDistanceType;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;

@Embeddable
public class AixmCurveType {
    
    // @Id
    // @GeneratedValue(strategy = GenerationType.IDENTITY)
    // @Column(name = "id"/* , nullable = false*/)
    // protected String id;

    // @ElementCollection
    // @Column(name = "point_annotation")
    // protected List<String> annotation;

    @Column(name = "linestring", columnDefinition = "geometry(Linestring, 4326)")
    protected LineString lineString;

    @Column(name = "linestring_horizontalAccuracy_value")
    protected BigDecimal horizontalAccuracy;
    
    @Enumerated(EnumType.STRING)
    @Column(name = "linestring_horizontalAccuracy_uom")
    protected UomDistanceType horizontalAccuracy_uom;

    @Column(name = "linestring_horizontalAccuracy_nilReason")
    protected String horizontalAccuracy_nilReason;

    public LineString getLineString() {
        return lineString;
    }

    public void setLineString(LineString value) {
        this.lineString = value;
    }

    public BigDecimal getHorizontalAccuracy() {
        return horizontalAccuracy;
    }

    public void setHorizontalAccuracy(BigDecimal value) {
        this.horizontalAccuracy = value;
    }

    public UomDistanceType getHorizontalAccuracy_uom() {
        return horizontalAccuracy_uom;
    }

    public void setHorizontalAccuracy_uom(UomDistanceType value) {
        this.horizontalAccuracy_uom = value;
    }

    public String getHorizontalAccuracy_nilReason() {
        return horizontalAccuracy_nilReason;
    }

    public void setHorizontalAccuracy_nilReason(String value) {
        this.horizontalAccuracy_nilReason = value;
    }
}
