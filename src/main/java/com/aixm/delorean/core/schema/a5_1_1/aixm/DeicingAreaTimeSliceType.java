//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.schema.a5_1_1.aixm;

import java.util.ArrayList;
import java.util.List;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlAttribute;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Java class for DeicingAreaTimeSliceType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="DeicingAreaTimeSliceType">
 *   <complexContent>
 *     <extension base="{http://www.aixm.aero/schema/5.1.1}AbstractAIXMTimeSliceType">
 *       <sequence>
 *         <group ref="{http://www.aixm.aero/schema/5.1.1}DeicingAreaPropertyGroup"/>
 *         <element name="extension" maxOccurs="unbounded" minOccurs="0">
 *           <complexType>
 *             <complexContent>
 *               <restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                 <sequence>
 *                   <element ref="{http://www.aixm.aero/schema/5.1.1}AbstractDeicingAreaExtension"/>
 *                 </sequence>
 *                 <attGroup ref="{http://www.opengis.net/gml/3.2}OwnershipAttributeGroup"/>
 *               </restriction>
 *             </complexContent>
 *           </complexType>
 *         </element>
 *       </sequence>
 *     </extension>
 *   </complexContent>
 * </complexType>
 * }</pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "DeicingAreaTimeSliceType", propOrder = {
    "associatedApron",
    "taxiwayLocation",
    "standLocation",
    "surfaceProperties",
    "extent",
    "annotation",
    "availability",
    "extension"
})
@Entity
@Table(name = "deicingarea_ts", schema = "airport_heliport")
public class DeicingAreaTimeSliceType
    extends AbstractAIXMTimeSliceType
{

    @XmlElement(nillable = true)
    @OneToOne(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinColumn(name = "associatedapron_id", referencedColumnName = "id")
    protected ApronPropertyType associatedApron;
    @XmlElement(nillable = true)
    @OneToOne(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinColumn(name = "taxiwaylocation_id", referencedColumnName = "id")
    protected TaxiwayPropertyType taxiwayLocation;
    @XmlElement(nillable = true)
    @OneToOne(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinColumn(name = "standlocation_id", referencedColumnName = "id")
    protected AircraftStandPropertyType standLocation;
    @XmlElement(nillable = true)
    @OneToOne(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinColumn(name = "surfaceproperties_id", referencedColumnName = "id")
    protected SurfaceCharacteristicsPropertyType surfaceProperties;
    @XmlElement(nillable = true)
    @OneToOne(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinColumn(name = "extent_id", referencedColumnName = "id")
    protected ElevatedSurfacePropertyType extent;
    @XmlElement(nillable = true)
    @OneToMany(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinTable(name = "deicingarea_ts_annotation", joinColumns = {
        @JoinColumn(name = "deicingarea_ts_id")
    }, inverseJoinColumns = {
        @JoinColumn(name = "note_pt_id")
    })
    protected List<NotePropertyType> annotation;
    @XmlElement(nillable = true)
    @OneToMany(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinTable(name = "deicingarea_ts_availability", joinColumns = {
        @JoinColumn(name = "deicingarea_ts_id")
    }, inverseJoinColumns = {
        @JoinColumn(name = "apronareaavailability_pt_id")
    })
    protected List<ApronAreaAvailabilityPropertyType> availability;
    @Transient
    protected List<DeicingAreaTimeSliceType.Extension> extension;

    /**
     * Gets the value of the associatedApron property.
     * 
     * @return
     *     possible object is
     *     {@link ApronPropertyType }
     *     
     */
    public ApronPropertyType getAssociatedApron() {
        return associatedApron;
    }

    /**
     * Sets the value of the associatedApron property.
     * 
     * @param value
     *     allowed object is
     *     {@link ApronPropertyType }
     *     
     */
    public void setAssociatedApron(ApronPropertyType value) {
        this.associatedApron = value;
    }

    public boolean isSetAssociatedApron() {
        return (this.associatedApron!= null);
    }

    /**
     * Gets the value of the taxiwayLocation property.
     * 
     * @return
     *     possible object is
     *     {@link TaxiwayPropertyType }
     *     
     */
    public TaxiwayPropertyType getTaxiwayLocation() {
        return taxiwayLocation;
    }

    /**
     * Sets the value of the taxiwayLocation property.
     * 
     * @param value
     *     allowed object is
     *     {@link TaxiwayPropertyType }
     *     
     */
    public void setTaxiwayLocation(TaxiwayPropertyType value) {
        this.taxiwayLocation = value;
    }

    public boolean isSetTaxiwayLocation() {
        return (this.taxiwayLocation!= null);
    }

    /**
     * Gets the value of the standLocation property.
     * 
     * @return
     *     possible object is
     *     {@link AircraftStandPropertyType }
     *     
     */
    public AircraftStandPropertyType getStandLocation() {
        return standLocation;
    }

    /**
     * Sets the value of the standLocation property.
     * 
     * @param value
     *     allowed object is
     *     {@link AircraftStandPropertyType }
     *     
     */
    public void setStandLocation(AircraftStandPropertyType value) {
        this.standLocation = value;
    }

    public boolean isSetStandLocation() {
        return (this.standLocation!= null);
    }

    /**
     * Gets the value of the surfaceProperties property.
     * 
     * @return
     *     possible object is
     *     {@link SurfaceCharacteristicsPropertyType }
     *     
     */
    public SurfaceCharacteristicsPropertyType getSurfaceProperties() {
        return surfaceProperties;
    }

    /**
     * Sets the value of the surfaceProperties property.
     * 
     * @param value
     *     allowed object is
     *     {@link SurfaceCharacteristicsPropertyType }
     *     
     */
    public void setSurfaceProperties(SurfaceCharacteristicsPropertyType value) {
        this.surfaceProperties = value;
    }

    public boolean isSetSurfaceProperties() {
        return (this.surfaceProperties!= null);
    }

    /**
     * Gets the value of the extent property.
     * 
     * @return
     *     possible object is
     *     {@link ElevatedSurfacePropertyType }
     *     
     */
    public ElevatedSurfacePropertyType getExtent() {
        return extent;
    }

    /**
     * Sets the value of the extent property.
     * 
     * @param value
     *     allowed object is
     *     {@link ElevatedSurfacePropertyType }
     *     
     */
    public void setExtent(ElevatedSurfacePropertyType value) {
        this.extent = value;
    }

    public boolean isSetExtent() {
        return (this.extent!= null);
    }

    /**
     * Gets the value of the annotation property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the annotation property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getAnnotation().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link NotePropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the annotation property.
     */
    public List<NotePropertyType> getAnnotation() {
        if (annotation == null) {
            annotation = new ArrayList<>();
        }
        return this.annotation;
    }

    public boolean isSetAnnotation() {
        return ((this.annotation!= null)&&(!this.annotation.isEmpty()));
    }

    public void unsetAnnotation() {
        this.annotation = null;
    }

    /**
     * Gets the value of the availability property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the availability property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getAvailability().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link ApronAreaAvailabilityPropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the availability property.
     */
    public List<ApronAreaAvailabilityPropertyType> getAvailability() {
        if (availability == null) {
            availability = new ArrayList<>();
        }
        return this.availability;
    }

    public boolean isSetAvailability() {
        return ((this.availability!= null)&&(!this.availability.isEmpty()));
    }

    public void unsetAvailability() {
        this.availability = null;
    }

    /**
     * Gets the value of the extension property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the extension property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getExtension().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link DeicingAreaTimeSliceType.Extension }
     * </p>
     * 
     * 
     * @return
     *     The value of the extension property.
     */
    public List<DeicingAreaTimeSliceType.Extension> getExtension() {
        if (extension == null) {
            extension = new ArrayList<>();
        }
        return this.extension;
    }

    public boolean isSetExtension() {
        return ((this.extension!= null)&&(!this.extension.isEmpty()));
    }

    public void unsetExtension() {
        this.extension = null;
    }


    /**
     * <p>Java class for anonymous complex type</p>.
     * 
     * <p>The following schema fragment specifies the expected content contained within this class.</p>
     * 
     * <pre>{@code
     * <complexType>
     *   <complexContent>
     *     <restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
     *       <sequence>
     *         <element ref="{http://www.aixm.aero/schema/5.1.1}AbstractDeicingAreaExtension"/>
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
    @XmlType(name = "", propOrder = {
        "abstractDeicingAreaExtension"
    })
    public static class Extension {

        @XmlElement(name = "AbstractDeicingAreaExtension", required = true)
        @OneToOne(cascade = {
            CascadeType.ALL
        }, fetch = FetchType.EAGER)
        @JoinColumn(name = "abstractdeicingareaextension_id", referencedColumnName = "id")
        protected AbstractExtensionType abstractDeicingAreaExtension;
        @XmlAttribute(name = "owns")
        @Transient
        protected Boolean owns;

        /**
         * Gets the value of the abstractDeicingAreaExtension property.
         * 
         * @return
         *     possible object is
         *     {@link AbstractExtensionType }
         *     
         */
        public AbstractExtensionType getAbstractDeicingAreaExtension() {
            return abstractDeicingAreaExtension;
        }

        /**
         * Sets the value of the abstractDeicingAreaExtension property.
         * 
         * @param value
         *     allowed object is
         *     {@link AbstractExtensionType }
         *     
         */
        public void setAbstractDeicingAreaExtension(AbstractExtensionType value) {
            this.abstractDeicingAreaExtension = value;
        }

        public boolean isSetAbstractDeicingAreaExtension() {
            return (this.abstractDeicingAreaExtension!= null);
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

}
