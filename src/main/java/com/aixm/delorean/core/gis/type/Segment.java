package com.aixm.delorean.core.gis.type;
import org.locationtech.jts.geom.LineString;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Index;
import org.hibernate.annotations.JdbcTypeCode;
import org.hibernate.type.SqlTypes;


@Entity
@Table(
    name = "segment",
    schema = "public",
    indexes = {
        @Index(name = "idx_order", columnList = "sequence"),
        @Index(name = "idx_interpretation", columnList = "interpretation")
    }
)
public class Segment {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "segment_seq")
    @SequenceGenerator(name = "segment_seq", sequenceName = "segment_seq", allocationSize = 1)
    @Column(name = "id", nullable = false)
    protected Long dbid;

    @Column(name = "linestring", columnDefinition = "geometry(LineString, 4326)")
    // @JdbcTypeCode(SqlTypes.OTHER)
    protected LineString lineString;

    @Column(name = "sequence")
    protected long sequence;

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

    public LineString getLineString() {
        return lineString;
    }

    public void setLineString(LineString value) {
        this.lineString = value;
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
}
