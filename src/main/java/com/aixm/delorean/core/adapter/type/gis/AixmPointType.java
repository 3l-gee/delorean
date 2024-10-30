package com.aixm.delorean.core.adapter.type.gis;

import java.math.BigDecimal;

import org.locationtech.jts.geom.Point;

import com.aixm.delorean.core.schema.a5_1_1.aixm.UomDistanceType;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
@Embeddable
public class AixmPointType {
        
    // @Id
    // @GeneratedValue(strategy = GenerationType.IDENTITY)
    // @Column(name = "id", nullable = false)
    // protected String id;

    // @ElementCollection
    // @Column(name = "point_annotation")
    // protected List<String> annotation;

    @Column(name = "point", columnDefinition = "geometry(Point, 4326)")
    protected Point point;

    @Column(name = "point_horizontalAccuracy_value")
    protected BigDecimal horizontalAccuracy;

    @Enumerated(EnumType.STRING)
    @Column(name = "point_horizontalAccuracy_uom")
    protected UomDistanceType horizontalAccuracy_uom;

    @Column(name = "point_horizontalAccuracy_nilReason")
    protected String horizontalAccuracy_nilReason;

    public Point getPoint() {
        return point;
    }

    public void setPoint(Point value) {
        this.point = value;
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