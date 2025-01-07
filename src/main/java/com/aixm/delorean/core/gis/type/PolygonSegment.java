package com.aixm.delorean.core.gis.type;
import org.locationtech.jts.geom.LineString;
import org.locationtech.jts.geom.Point;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Index;


@Entity
@Table(
    name = "polygon_segment",
    schema = "public",
    indexes = {
        @Index(name = "idx_polygon_segment_order", columnList = "sequence"),
        @Index(name = "idx_polygon_segment_interpretation", columnList = "interpretation")
    }
)
public class PolygonSegment {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "polygon_segment_seq")
    @SequenceGenerator(name = "polygon_segment_seq", sequenceName = "polygon_segment_seq", allocationSize = 1)
    @Column(name = "id", nullable = false)
    protected Long dbid;

    @Column(name = "linestring", columnDefinition = "geometry(Linestring, 4326)")
    protected LineString lineString;

    @Column(name = "point", columnDefinition = "geometry(Point, 4326)")
    protected Point point;

    @Column(name = "radius", nullable = true)
    protected Double radius;

    @Column(name = "start_angle", nullable = true)
    protected Double startAngle;

    @Column(name = "end_angle", nullable = true)
    protected Double endAngle;

    @Column(name = "sequence")
    protected long sequence;

    @Column(name = "part")
    protected long part;

    public enum Interpretation {
        GEODESIC,
        LINESTRING,
        ARCBYCENTER,
        CIRCLEBYCENTER
    }

    @Column(name = "interpretation")
    protected Interpretation interpretation;

    public Long getId() {
        return dbid;
    }

    public void setId(Long value) {
        this.dbid = value;
    }

    public LineString getLinestring() {
        return lineString;
    }

    public void setLinestring(LineString value) {
        this.lineString = value;
    }

    public Point getPoint() {
        return point;
    }

    public void setPoint(Point value) {
        this.point = value;
    }

    public Double getRadius() {
        return radius;
    }

    public void setRadius(Double value) {
        this.radius = value;
    }

    public Double getStartAngle() {
        return startAngle;
    }

    public void setStartAngle(Double value) {
        this.startAngle = value;
    }

    public Double getEndAngle() {
        return endAngle;
    }

    public void setEndAngle(Double value) {
        this.endAngle = value;
    }

    public Interpretation getInterpretation() {
        return interpretation;
    }

    public void setInterpretation(Interpretation value) {
        this.interpretation = value;
    }

    public long getSequence() {
        return sequence;
    }

    public void setSequence(long value) {
        this.sequence = value;
    }

    public long getPart() {
        return part;
    }

    public void setPart(long value) {
        this.part = value;
    }
}
