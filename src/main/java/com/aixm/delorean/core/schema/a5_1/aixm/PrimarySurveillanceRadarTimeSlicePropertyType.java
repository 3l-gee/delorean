//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.schema.a5_1.aixm;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlAttribute;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlTransient;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Java class for PrimarySurveillanceRadarTimeSlicePropertyType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="PrimarySurveillanceRadarTimeSlicePropertyType">
 *   <complexContent>
 *     <restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       <sequence>
 *         <element ref="{http://www.aixm.aero/schema/5.1}PrimarySurveillanceRadarTimeSlice"/>
 *         <element name="dbid" type="{http://www.w3.org/2001/XMLSchema}long"/>
 *       </sequence>
 *       <attGroup ref="{http://www.opengis.net/gml/3.2}OwnershipAttributeGroup"/>
 *     </restriction>
 *   </complexContent>
 * </complexType>
 * }</pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "PrimarySurveillanceRadarTimeSlicePropertyType", propOrder = {
    "primarySurveillanceRadarTimeSlice"
})
@Entity
@Table(name = "primarysurveillanceradar_tsp", schema = "surveillance")
public class PrimarySurveillanceRadarTimeSlicePropertyType {

    @XmlElement(name = "PrimarySurveillanceRadarTimeSlice", required = true)
    @OneToOne(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinColumn(name = "primarysurveillanceradartimeslice_id", referencedColumnName = "id")
    protected PrimarySurveillanceRadarTimeSliceType primarySurveillanceRadarTimeSlice;
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "primarysurveillanceradar_tsp_seq")
    @SequenceGenerator(name = "primarysurveillanceradar_tsp_seq", sequenceName = "primarysurveillanceradar_tsp_seq", allocationSize = 1)
    @Column(name = "id", length = 255, nullable = false, unique = true)
    @XmlTransient
    protected long dbid;
    @XmlAttribute(name = "owns")
    @Transient
    protected Boolean owns;

    /**
     * Gets the value of the primarySurveillanceRadarTimeSlice property.
     * 
     * @return
     *     possible object is
     *     {@link PrimarySurveillanceRadarTimeSliceType }
     *     
     */
    public PrimarySurveillanceRadarTimeSliceType getPrimarySurveillanceRadarTimeSlice() {
        return primarySurveillanceRadarTimeSlice;
    }

    /**
     * Sets the value of the primarySurveillanceRadarTimeSlice property.
     * 
     * @param value
     *     allowed object is
     *     {@link PrimarySurveillanceRadarTimeSliceType }
     *     
     */
    public void setPrimarySurveillanceRadarTimeSlice(PrimarySurveillanceRadarTimeSliceType value) {
        this.primarySurveillanceRadarTimeSlice = value;
    }

    public boolean isSetPrimarySurveillanceRadarTimeSlice() {
        return (this.primarySurveillanceRadarTimeSlice!= null);
    }

    /**
     * Gets the value of the dbid property.
     * 
     */
    public long getDbid() {
        return dbid;
    }

    /**
     * Sets the value of the dbid property.
     * 
     */
    public void setDbid(long value) {
        this.dbid = value;
    }

    public boolean isSetDbid() {
        return true;
    }

    /**
     * Gets the value of the owns property.
     * 
     * @return
     *     possible object is
     *     {@link Boolean }
     *     
     */
    public boolean isOwns() {
        if (owns == null) {
            return false;
        } else {
            return owns;
        }
    }

    /**
     * Sets the value of the owns property.
     * 
     * @param value
     *     allowed object is
     *     {@link Boolean }
     *     
     */
    public void setOwns(boolean value) {
        this.owns = value;
    }

    public boolean isSetOwns() {
        return (this.owns!= null);
    }

    public void unsetOwns() {
        this.owns = null;
    }

}
