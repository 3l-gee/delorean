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
 * <p>Java class for RunwayCentrelinePointTimeSliceType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="RunwayCentrelinePointTimeSliceType">
 *   <complexContent>
 *     <extension base="{http://www.aixm.aero/schema/5.1}AbstractAIXMTimeSliceType">
 *       <sequence>
 *         <group ref="{http://www.aixm.aero/schema/5.1}RunwayCentrelinePointPropertyGroup"/>
 *         <element name="extension" maxOccurs="unbounded" minOccurs="0">
 *           <complexType>
 *             <complexContent>
 *               <restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                 <sequence>
 *                   <element ref="{http://www.aixm.aero/schema/5.1}AbstractRunwayCentrelinePointExtension"/>
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
@XmlType(name = "RunwayCentrelinePointTimeSliceType", propOrder = {
    "role",
    "designator",
    "location",
    "onRunway",
    "associatedDeclaredDistance",
    "navaidEquipment",
    "annotation",
    "extension"
})
@Entity
@Table(name = "runwaycentrelinepoint_ts", schema = "airport_heliport")
public class RunwayCentrelinePointTimeSliceType
    extends AbstractAIXMTimeSliceType
{

    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "role_value", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "role_nilreason", length = 255, nullable = true, unique = false))
    })
    protected CodeRunwayPointRoleType role;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "designator_value", length = 16, columnDefinition = "TEXT", nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "designator_nilreason", length = 255, nullable = true, unique = false))
    })
    protected TextDesignatorType designator;
    @XmlElement(nillable = true)
    @OneToOne(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinColumn(name = "location_id", referencedColumnName = "id")
    protected ElevatedPointPropertyType location;
    @XmlElement(nillable = true)
    @OneToOne(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinColumn(name = "onrunway_id", referencedColumnName = "id")
    protected RunwayDirectionPropertyType onRunway;
    @XmlElement(nillable = true)
    @OneToMany(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinTable(name = "runwaycentrelinepoint_ts_associateddeclareddistance", joinColumns = {
        @JoinColumn(name = "runwaycentrelinepoint_ts_id")
    }, inverseJoinColumns = {
        @JoinColumn(name = "runwaydeclareddistance_pt_id")
    })
    protected List<RunwayDeclaredDistancePropertyType> associatedDeclaredDistance;
    @XmlElement(nillable = true)
    @OneToMany(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinTable(name = "runwaycentrelinepoint_ts_navaidequipment", joinColumns = {
        @JoinColumn(name = "runwaycentrelinepoint_ts_id")
    }, inverseJoinColumns = {
        @JoinColumn(name = "navaidequipmentdistance_pt_id")
    })
    protected List<NavaidEquipmentDistancePropertyType> navaidEquipment;
    @XmlElement(nillable = true)
    @OneToMany(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinTable(name = "runwaycentrelinepoint_ts_annotation", joinColumns = {
        @JoinColumn(name = "runwaycentrelinepoint_ts_id")
    }, inverseJoinColumns = {
        @JoinColumn(name = "note_pt_id")
    })
    protected List<NotePropertyType> annotation;
    @Transient
    protected List<RunwayCentrelinePointTimeSliceType.Extension> extension;

    /**
     * Gets the value of the role property.
     * 
     * @return
     *     possible object is
     *     {@link CodeRunwayPointRoleType }
     *     
     */
    public CodeRunwayPointRoleType getRole() {
        return role;
    }

    /**
     * Sets the value of the role property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeRunwayPointRoleType }
     *     
     */
    public void setRole(CodeRunwayPointRoleType value) {
        this.role = value;
    }

    public boolean isSetRole() {
        return (this.role!= null);
    }

    /**
     * Gets the value of the designator property.
     * 
     * @return
     *     possible object is
     *     {@link TextDesignatorType }
     *     
     */
    public TextDesignatorType getDesignator() {
        return designator;
    }

    /**
     * Sets the value of the designator property.
     * 
     * @param value
     *     allowed object is
     *     {@link TextDesignatorType }
     *     
     */
    public void setDesignator(TextDesignatorType value) {
        this.designator = value;
    }

    public boolean isSetDesignator() {
        return (this.designator!= null);
    }

    /**
     * Gets the value of the location property.
     * 
     * @return
     *     possible object is
     *     {@link ElevatedPointPropertyType }
     *     
     */
    public ElevatedPointPropertyType getLocation() {
        return location;
    }

    /**
     * Sets the value of the location property.
     * 
     * @param value
     *     allowed object is
     *     {@link ElevatedPointPropertyType }
     *     
     */
    public void setLocation(ElevatedPointPropertyType value) {
        this.location = value;
    }

    public boolean isSetLocation() {
        return (this.location!= null);
    }

    /**
     * Gets the value of the onRunway property.
     * 
     * @return
     *     possible object is
     *     {@link RunwayDirectionPropertyType }
     *     
     */
    public RunwayDirectionPropertyType getOnRunway() {
        return onRunway;
    }

    /**
     * Sets the value of the onRunway property.
     * 
     * @param value
     *     allowed object is
     *     {@link RunwayDirectionPropertyType }
     *     
     */
    public void setOnRunway(RunwayDirectionPropertyType value) {
        this.onRunway = value;
    }

    public boolean isSetOnRunway() {
        return (this.onRunway!= null);
    }

    /**
     * Gets the value of the associatedDeclaredDistance property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the associatedDeclaredDistance property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getAssociatedDeclaredDistance().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link RunwayDeclaredDistancePropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the associatedDeclaredDistance property.
     */
    public List<RunwayDeclaredDistancePropertyType> getAssociatedDeclaredDistance() {
        if (associatedDeclaredDistance == null) {
            associatedDeclaredDistance = new ArrayList<>();
        }
        return this.associatedDeclaredDistance;
    }

    public boolean isSetAssociatedDeclaredDistance() {
        return ((this.associatedDeclaredDistance!= null)&&(!this.associatedDeclaredDistance.isEmpty()));
    }

    public void unsetAssociatedDeclaredDistance() {
        this.associatedDeclaredDistance = null;
    }

    /**
     * Gets the value of the navaidEquipment property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the navaidEquipment property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getNavaidEquipment().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link NavaidEquipmentDistancePropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the navaidEquipment property.
     */
    public List<NavaidEquipmentDistancePropertyType> getNavaidEquipment() {
        if (navaidEquipment == null) {
            navaidEquipment = new ArrayList<>();
        }
        return this.navaidEquipment;
    }

    public boolean isSetNavaidEquipment() {
        return ((this.navaidEquipment!= null)&&(!this.navaidEquipment.isEmpty()));
    }

    public void unsetNavaidEquipment() {
        this.navaidEquipment = null;
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
     * {@link RunwayCentrelinePointTimeSliceType.Extension }
     * </p>
     * 
     * 
     * @return
     *     The value of the extension property.
     */
    public List<RunwayCentrelinePointTimeSliceType.Extension> getExtension() {
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
     *         <element ref="{http://www.aixm.aero/schema/5.1}AbstractRunwayCentrelinePointExtension"/>
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
        "abstractRunwayCentrelinePointExtension"
    })
    public static class Extension {

        @XmlElement(name = "AbstractRunwayCentrelinePointExtension", required = true)
        @OneToOne(cascade = {
            CascadeType.ALL
        }, fetch = FetchType.EAGER)
        @JoinColumn(name = "abstractrunwaycentrelinepointextension_id", referencedColumnName = "id")
        protected AbstractExtensionType abstractRunwayCentrelinePointExtension;
        @XmlAttribute(name = "owns")
        @Transient
        protected Boolean owns;

        /**
         * Gets the value of the abstractRunwayCentrelinePointExtension property.
         * 
         * @return
         *     possible object is
         *     {@link AbstractExtensionType }
         *     
         */
        public AbstractExtensionType getAbstractRunwayCentrelinePointExtension() {
            return abstractRunwayCentrelinePointExtension;
        }

        /**
         * Sets the value of the abstractRunwayCentrelinePointExtension property.
         * 
         * @param value
         *     allowed object is
         *     {@link AbstractExtensionType }
         *     
         */
        public void setAbstractRunwayCentrelinePointExtension(AbstractExtensionType value) {
            this.abstractRunwayCentrelinePointExtension = value;
        }

        public boolean isSetAbstractRunwayCentrelinePointExtension() {
            return (this.abstractRunwayCentrelinePointExtension!= null);
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
