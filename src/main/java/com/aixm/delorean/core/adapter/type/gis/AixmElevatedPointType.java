package com.aixm.delorean.core.adapter.type.gis;

import java.math.BigDecimal;

import org.locationtech.jts.geom.Point;

import com.aixm.delorean.core.schema.a5_1_1.aixm.CodeVerticalDatumBaseType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.UomDistanceType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.UomDistanceVerticalType;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;

@Embeddable
public class AixmElevatedPointType {

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

    @Column(name = "point_verticalAccuracy_value")
    protected BigDecimal elevation;

    @Enumerated(EnumType.STRING)
    @Column(name = "point_verticalAccuracy_uom")
    protected UomDistanceVerticalType elevation_uom;

    @Column(name = "point_verticalAccuracy_nilReason")
    protected String elevation_nilReason;

    @Column(name = "point_geoidUndulation_value")
    protected BigDecimal geoidUndulation;

    @Enumerated(EnumType.STRING)
    @Column(name = "point_geoidUndulation_uom")
    protected UomDistanceType geoidUndulation_uom;

    @Column(name = "point_geoidUndulation_nilReason")
    protected String geoidUndulation_nilReason;

    @Enumerated(EnumType.STRING)
    @Column(name = "point_verticalDatum")
    protected CodeVerticalDatumBaseType verticalDatum;

    @Column(name = "point_verticalDatum_nilReason")
    protected String verticalDatum_nilReason;

    @Column(name = "point_horizontalAccuracy_value")
    protected BigDecimal verticalAccuracy;

    @Enumerated(EnumType.STRING)
    @Column(name = "point_horizontalAccuracy_uom")
    protected UomDistanceType verticalAccuracy_uom;

    @Column(name = "point_horizontalAccuracy_nilReason")
    protected String verticalAccuracy_nilReason;

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

    public BigDecimal getElevation() {
        return elevation;
    }

    public void setElevation(BigDecimal value) {
        this.elevation = value;
    }

    public UomDistanceVerticalType getElevation_uom() {
        return elevation_uom;
    }

    public void setElevation_uom(UomDistanceVerticalType value) {
        this.elevation_uom = value;
    }

    public String getElevation_nilReason() {
        return elevation_nilReason;
    }

    public void setElevation_nilReason(String value) {
        this.elevation_nilReason = value;
    }

    public BigDecimal getGeoidUndulation() {
        return geoidUndulation;
    }

    public void setGeoidUndulation(BigDecimal value) {
        this.geoidUndulation = value;
    }

    public UomDistanceType getGeoidUndulation_uom() {
        return geoidUndulation_uom;
    }

    public void setGeoidUndulation_uom(UomDistanceType value) {
        this.geoidUndulation_uom = value;
    }

    public String getGeoidUndulation_nilReason() {
        return geoidUndulation_nilReason;
    }

    public void setGeoidUndulation_nilReason(String value) {
        this.geoidUndulation_nilReason = value;
    }

    public CodeVerticalDatumBaseType getVerticalDatum() {
        return verticalDatum;
    }

    public void setVerticalDatum(CodeVerticalDatumBaseType value) {
        this.verticalDatum = value;
    }

    public String getVerticalDatum_nilReason() {
        return verticalDatum_nilReason;
    }

    public void setVerticalDatum_nilReason(String value) {
        this.verticalDatum_nilReason = value;
    }

    public BigDecimal getVerticalAccuracy() {
        return verticalAccuracy;
    }

    public void setVerticalAccuracy(BigDecimal value) {
        this.verticalAccuracy = value;
    }

    public UomDistanceType getVerticalAccuracy_uom() {
        return verticalAccuracy_uom;
    }

    public void setVerticalAccuracy_uom(UomDistanceType value) {
        this.verticalAccuracy_uom = value;
    }

    public String getVerticalAccuracy_nilReason() {
        return verticalAccuracy_nilReason;
    }

    public void setVerticalAccuracy_nilReason(String value) {
        this.verticalAccuracy_nilReason = value;
    }    
}
