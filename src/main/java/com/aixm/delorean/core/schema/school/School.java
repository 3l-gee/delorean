//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.schema.school;

import java.util.ArrayList;
import java.util.List;
import com.aixm.delorean.core.adapter.gis.CurveTypeAdapter;
import com.aixm.delorean.core.adapter.gis.PointTypeAdapter;
import com.aixm.delorean.core.schema.school.org.gml.CurveType;
import com.aixm.delorean.core.schema.school.org.gml.PointType;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Embedded;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;
import jakarta.xml.bind.annotation.XmlTransient;
import jakarta.xml.bind.annotation.XmlType;
import jakarta.xml.bind.annotation.adapters.XmlJavaTypeAdapter;
import org.locationtech.jts.geom.LineString;
import org.locationtech.jts.geom.Point;
import org.locationtech.jts.geom.Polygon;


/**
 * <p>Java class for school complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="school">
 *   <complexContent>
 *     <restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       <sequence>
 *         <element name="aixmPoint" type="{}AixmPointPropertyType"/>
 *         <element name="aixmElevatedPoint" type="{}ElevatedPointPropertyType"/>
 *         <element name="aixmCurve" type="{}AixmCurvePropertyType"/>
 *         <element name="aixmElevatedCurve" type="{}AixmCurvePropertyType"/>
 *         <element name="geomPoint" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         <element name="geomCurve" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         <element name="geomSurface" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         <element name="classroom" type="{}classroom" maxOccurs="unbounded"/>
 *         <element name="student" type="{}student" maxOccurs="unbounded"/>
 *         <element name="teacher" type="{}teacher" maxOccurs="unbounded"/>
 *       </sequence>
 *       <attribute name="dbid" type="{http://www.w3.org/2001/XMLSchema}long" />
 *     </restriction>
 *   </complexContent>
 * </complexType>
 * }</pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "school", propOrder = {
    "aixmPoint",
    "aixmElevatedPoint",
    "aixmCurve",
    "aixmElevatedCurve",
    "geomPoint",
    "geomCurve",
    "geomSurface",
    "classroom",
    "student",
    "teacher"
})
@XmlRootElement
@Entity
@Table(name = "school")
public class School {

    @XmlElement(required = true)
    @Embedded
    protected AixmPointPropertyType aixmPoint;
    @XmlElement(required = true)
    @Embedded
    protected ElevatedPointPropertyType aixmElevatedPoint;
    @XmlElement(required = true)
    @Embedded
    protected AixmCurvePropertyType aixmCurve;
    @XmlElement(required = true)
    @Embedded
    protected AixmCurvePropertyType aixmElevatedCurve;
    @XmlElement(required = true, type = PointType.class)
    @XmlJavaTypeAdapter(PointTypeAdapter.class)
    @Column(name = "geomPoint", columnDefinition = "geometry(Point, 4326)")
    protected Point geomPoint;
    @XmlElement(required = true, type = CurveType.class)
    @XmlJavaTypeAdapter(CurveTypeAdapter.class)
    @Column(name = "geomCurve", columnDefinition = "geometry(Linestring, 4326)")
    protected LineString geomCurve;
    @XmlElement(required = true, type = String.class)
    @XmlJavaTypeAdapter(Adapter5 .class)
    @Column(name = "geomSurface", columnDefinition = "geometry(Polygon, 4326)")
    @Transient
    protected Polygon geomSurface;
    @XmlElement(required = true)
    @OneToMany(cascade = {
        CascadeType.ALL
    }, orphanRemoval = true, fetch = FetchType.EAGER)
    protected List<Classroom> classroom;
    @XmlElement(required = true)
    @OneToMany(cascade = {
        CascadeType.ALL
    }, orphanRemoval = true, fetch = FetchType.EAGER)
    protected List<Student> student;
    @XmlElement(required = true)
    @OneToMany(cascade = {
        CascadeType.ALL
    }, orphanRemoval = true, fetch = FetchType.EAGER)
    protected List<Teacher> teacher;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "dbid", nullable = false)
    @XmlTransient
    protected Long dbid;

    /**
     * Gets the value of the aixmPoint property.
     * 
     * @return
     *     possible object is
     *     {@link AixmPointPropertyType }
     *     
     */
    public AixmPointPropertyType getAixmPoint() {
        return aixmPoint;
    }

    /**
     * Sets the value of the aixmPoint property.
     * 
     * @param value
     *     allowed object is
     *     {@link AixmPointPropertyType }
     *     
     */
    public void setAixmPoint(AixmPointPropertyType value) {
        this.aixmPoint = value;
    }

    /**
     * Gets the value of the aixmElevatedPoint property.
     * 
     * @return
     *     possible object is
     *     {@link ElevatedPointPropertyType }
     *     
     */
    public ElevatedPointPropertyType getAixmElevatedPoint() {
        return aixmElevatedPoint;
    }

    /**
     * Sets the value of the aixmElevatedPoint property.
     * 
     * @param value
     *     allowed object is
     *     {@link ElevatedPointPropertyType }
     *     
     */
    public void setAixmElevatedPoint(ElevatedPointPropertyType value) {
        this.aixmElevatedPoint = value;
    }

    /**
     * Gets the value of the aixmCurve property.
     * 
     * @return
     *     possible object is
     *     {@link AixmCurvePropertyType }
     *     
     */
    public AixmCurvePropertyType getAixmCurve() {
        return aixmCurve;
    }

    /**
     * Sets the value of the aixmCurve property.
     * 
     * @param value
     *     allowed object is
     *     {@link AixmCurvePropertyType }
     *     
     */
    public void setAixmCurve(AixmCurvePropertyType value) {
        this.aixmCurve = value;
    }

    /**
     * Gets the value of the aixmElevatedCurve property.
     * 
     * @return
     *     possible object is
     *     {@link AixmCurvePropertyType }
     *     
     */
    public AixmCurvePropertyType getAixmElevatedCurve() {
        return aixmElevatedCurve;
    }

    /**
     * Sets the value of the aixmElevatedCurve property.
     * 
     * @param value
     *     allowed object is
     *     {@link AixmCurvePropertyType }
     *     
     */
    public void setAixmElevatedCurve(AixmCurvePropertyType value) {
        this.aixmElevatedCurve = value;
    }

    /**
     * Gets the value of the geomPoint property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public Point getGeomPoint() {
        return geomPoint;
    }

    /**
     * Sets the value of the geomPoint property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setGeomPoint(Point value) {
        this.geomPoint = value;
    }

    /**
     * Gets the value of the geomCurve property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public LineString getGeomCurve() {
        return geomCurve;
    }

    /**
     * Sets the value of the geomCurve property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setGeomCurve(LineString value) {
        this.geomCurve = value;
    }

    /**
     * Gets the value of the geomSurface property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public Polygon getGeomSurface() {
        return geomSurface;
    }

    /**
     * Sets the value of the geomSurface property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setGeomSurface(Polygon value) {
        this.geomSurface = value;
    }

    /**
     * Gets the value of the classroom property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the classroom property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getClassroom().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link Classroom }
     * </p>
     * 
     * 
     * @return
     *     The value of the classroom property.
     */
    public List<Classroom> getClassroom() {
        if (classroom == null) {
            classroom = new ArrayList<>();
        }
        return this.classroom;
    }

    /**
     * Gets the value of the student property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the student property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getStudent().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link Student }
     * </p>
     * 
     * 
     * @return
     *     The value of the student property.
     */
    public List<Student> getStudent() {
        if (student == null) {
            student = new ArrayList<>();
        }
        return this.student;
    }

    /**
     * Gets the value of the teacher property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the teacher property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getTeacher().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link Teacher }
     * </p>
     * 
     * 
     * @return
     *     The value of the teacher property.
     */
    public List<Teacher> getTeacher() {
        if (teacher == null) {
            teacher = new ArrayList<>();
        }
        return this.teacher;
    }

    /**
     * Gets the value of the dbid property.
     * 
     * @return
     *     possible object is
     *     {@link Long }
     *     
     */
    public Long getDbid() {
        return dbid;
    }

    /**
     * Sets the value of the dbid property.
     * 
     * @param value
     *     allowed object is
     *     {@link Long }
     *     
     */
    public void setDbid(Long value) {
        this.dbid = value;
    }

}
