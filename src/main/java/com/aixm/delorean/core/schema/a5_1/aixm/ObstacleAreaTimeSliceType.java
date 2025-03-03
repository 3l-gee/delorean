//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.schema.a5_1.aixm;

import java.util.ArrayList;
import java.util.List;
import jakarta.persistence.AttributeOverride;
import jakarta.persistence.AttributeOverrides;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Embedded;
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
 * <p>Java class for ObstacleAreaTimeSliceType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="ObstacleAreaTimeSliceType">
 *   <complexContent>
 *     <extension base="{http://www.aixm.aero/schema/5.1}AbstractAIXMTimeSliceType">
 *       <sequence>
 *         <group ref="{http://www.aixm.aero/schema/5.1}ObstacleAreaPropertyGroup"/>
 *         <element name="extension" maxOccurs="unbounded" minOccurs="0">
 *           <complexType>
 *             <complexContent>
 *               <restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                 <sequence>
 *                   <element ref="{http://www.aixm.aero/schema/5.1}AbstractObstacleAreaExtension"/>
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
@XmlType(name = "ObstacleAreaTimeSliceType", propOrder = {
    "type",
    "obstructionIdSurfaceCondition",
    "referenceOwnerAirport",
    "referenceOwnerRunway",
    "referenceOwnerOrganisation",
    "surfaceExtent",
    "obstacle",
    "annotation",
    "extension"
})
@Entity
@Table(name = "obstaclearea_ts", schema = "obstacles")
public class ObstacleAreaTimeSliceType
    extends AbstractAIXMTimeSliceType
{

    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "type_value", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "type_nilreason", length = 255, nullable = true, unique = false))
    })
    protected CodeObstacleAreaType type;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "obstructionidsurfacecondition_value", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "obstructionidsurfacecondition_nilreason", length = 255, nullable = true, unique = false))
    })
    protected CodeObstacleAssessmentSurfaceType obstructionIdSurfaceCondition;
    @XmlElement(name = "reference_ownerAirport", nillable = true)
    @OneToOne(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinColumn(name = "reference_ownerairport_id", referencedColumnName = "id")
    protected AirportHeliportPropertyType referenceOwnerAirport;
    @XmlElement(name = "reference_ownerRunway", nillable = true)
    @OneToOne(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinColumn(name = "reference_ownerrunway_id", referencedColumnName = "id")
    protected RunwayDirectionPropertyType referenceOwnerRunway;
    @XmlElement(name = "reference_ownerOrganisation", nillable = true)
    @OneToOne(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinColumn(name = "reference_ownerorganisation_id", referencedColumnName = "id")
    protected OrganisationAuthorityPropertyType referenceOwnerOrganisation;
    @XmlElement(nillable = true)
    @OneToOne(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinColumn(name = "surfaceextent_id", referencedColumnName = "id")
    protected SurfacePropertyType surfaceExtent;
    @XmlElement(nillable = true)
    @OneToMany(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinTable(name = "obstaclearea_ts_obstacle", joinColumns = {
        @JoinColumn(name = "obstaclearea_ts_id")
    }, inverseJoinColumns = {
        @JoinColumn(name = "verticalstructure_pt_id")
    })
    protected List<VerticalStructurePropertyType> obstacle;
    @XmlElement(nillable = true)
    @OneToMany(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinTable(name = "obstaclearea_ts_annotation", joinColumns = {
        @JoinColumn(name = "obstaclearea_ts_id")
    }, inverseJoinColumns = {
        @JoinColumn(name = "note_pt_id")
    })
    protected List<NotePropertyType> annotation;
    @Transient
    protected List<ObstacleAreaTimeSliceType.Extension> extension;

    /**
     * Gets the value of the type property.
     * 
     * @return
     *     possible object is
     *     {@link CodeObstacleAreaType }
     *     
     */
    public CodeObstacleAreaType getType() {
        return type;
    }

    /**
     * Sets the value of the type property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeObstacleAreaType }
     *     
     */
    public void setType(CodeObstacleAreaType value) {
        this.type = value;
    }

    public boolean isSetType() {
        return (this.type!= null);
    }

    /**
     * Gets the value of the obstructionIdSurfaceCondition property.
     * 
     * @return
     *     possible object is
     *     {@link CodeObstacleAssessmentSurfaceType }
     *     
     */
    public CodeObstacleAssessmentSurfaceType getObstructionIdSurfaceCondition() {
        return obstructionIdSurfaceCondition;
    }

    /**
     * Sets the value of the obstructionIdSurfaceCondition property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeObstacleAssessmentSurfaceType }
     *     
     */
    public void setObstructionIdSurfaceCondition(CodeObstacleAssessmentSurfaceType value) {
        this.obstructionIdSurfaceCondition = value;
    }

    public boolean isSetObstructionIdSurfaceCondition() {
        return (this.obstructionIdSurfaceCondition!= null);
    }

    /**
     * Gets the value of the referenceOwnerAirport property.
     * 
     * @return
     *     possible object is
     *     {@link AirportHeliportPropertyType }
     *     
     */
    public AirportHeliportPropertyType getReferenceOwnerAirport() {
        return referenceOwnerAirport;
    }

    /**
     * Sets the value of the referenceOwnerAirport property.
     * 
     * @param value
     *     allowed object is
     *     {@link AirportHeliportPropertyType }
     *     
     */
    public void setReferenceOwnerAirport(AirportHeliportPropertyType value) {
        this.referenceOwnerAirport = value;
    }

    public boolean isSetReferenceOwnerAirport() {
        return (this.referenceOwnerAirport!= null);
    }

    /**
     * Gets the value of the referenceOwnerRunway property.
     * 
     * @return
     *     possible object is
     *     {@link RunwayDirectionPropertyType }
     *     
     */
    public RunwayDirectionPropertyType getReferenceOwnerRunway() {
        return referenceOwnerRunway;
    }

    /**
     * Sets the value of the referenceOwnerRunway property.
     * 
     * @param value
     *     allowed object is
     *     {@link RunwayDirectionPropertyType }
     *     
     */
    public void setReferenceOwnerRunway(RunwayDirectionPropertyType value) {
        this.referenceOwnerRunway = value;
    }

    public boolean isSetReferenceOwnerRunway() {
        return (this.referenceOwnerRunway!= null);
    }

    /**
     * Gets the value of the referenceOwnerOrganisation property.
     * 
     * @return
     *     possible object is
     *     {@link OrganisationAuthorityPropertyType }
     *     
     */
    public OrganisationAuthorityPropertyType getReferenceOwnerOrganisation() {
        return referenceOwnerOrganisation;
    }

    /**
     * Sets the value of the referenceOwnerOrganisation property.
     * 
     * @param value
     *     allowed object is
     *     {@link OrganisationAuthorityPropertyType }
     *     
     */
    public void setReferenceOwnerOrganisation(OrganisationAuthorityPropertyType value) {
        this.referenceOwnerOrganisation = value;
    }

    public boolean isSetReferenceOwnerOrganisation() {
        return (this.referenceOwnerOrganisation!= null);
    }

    /**
     * Gets the value of the surfaceExtent property.
     * 
     * @return
     *     possible object is
     *     {@link SurfacePropertyType }
     *     
     */
    public SurfacePropertyType getSurfaceExtent() {
        return surfaceExtent;
    }

    /**
     * Sets the value of the surfaceExtent property.
     * 
     * @param value
     *     allowed object is
     *     {@link SurfacePropertyType }
     *     
     */
    public void setSurfaceExtent(SurfacePropertyType value) {
        this.surfaceExtent = value;
    }

    public boolean isSetSurfaceExtent() {
        return (this.surfaceExtent!= null);
    }

    /**
     * Gets the value of the obstacle property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the obstacle property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getObstacle().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link VerticalStructurePropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the obstacle property.
     */
    public List<VerticalStructurePropertyType> getObstacle() {
        if (obstacle == null) {
            obstacle = new ArrayList<>();
        }
        return this.obstacle;
    }

    public boolean isSetObstacle() {
        return ((this.obstacle!= null)&&(!this.obstacle.isEmpty()));
    }

    public void unsetObstacle() {
        this.obstacle = null;
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
     * {@link ObstacleAreaTimeSliceType.Extension }
     * </p>
     * 
     * 
     * @return
     *     The value of the extension property.
     */
    public List<ObstacleAreaTimeSliceType.Extension> getExtension() {
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
     *         <element ref="{http://www.aixm.aero/schema/5.1}AbstractObstacleAreaExtension"/>
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
        "abstractObstacleAreaExtension"
    })
    public static class Extension {

        @XmlElement(name = "AbstractObstacleAreaExtension", required = true)
        @OneToOne(cascade = {
            CascadeType.ALL
        }, fetch = FetchType.EAGER)
        @JoinColumn(name = "abstractobstacleareaextension_id", referencedColumnName = "id")
        protected AbstractExtensionType abstractObstacleAreaExtension;
        @XmlAttribute(name = "owns")
        @Transient
        protected Boolean owns;

        /**
         * Gets the value of the abstractObstacleAreaExtension property.
         * 
         * @return
         *     possible object is
         *     {@link AbstractExtensionType }
         *     
         */
        public AbstractExtensionType getAbstractObstacleAreaExtension() {
            return abstractObstacleAreaExtension;
        }

        /**
         * Sets the value of the abstractObstacleAreaExtension property.
         * 
         * @param value
         *     allowed object is
         *     {@link AbstractExtensionType }
         *     
         */
        public void setAbstractObstacleAreaExtension(AbstractExtensionType value) {
            this.abstractObstacleAreaExtension = value;
        }

        public boolean isSetAbstractObstacleAreaExtension() {
            return (this.abstractObstacleAreaExtension!= null);
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
