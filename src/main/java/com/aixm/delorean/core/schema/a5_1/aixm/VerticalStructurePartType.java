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
 * <p>Java class for VerticalStructurePartType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="VerticalStructurePartType">
 *   <complexContent>
 *     <extension base="{http://www.aixm.aero/schema/5.1}AbstractPropertiesWithScheduleType">
 *       <sequence>
 *         <group ref="{http://www.aixm.aero/schema/5.1}PropertiesWithSchedulePropertyGroup"/>
 *         <group ref="{http://www.aixm.aero/schema/5.1}VerticalStructurePartPropertyGroup"/>
 *         <element name="extension" maxOccurs="unbounded" minOccurs="0">
 *           <complexType>
 *             <complexContent>
 *               <restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                 <choice>
 *                   <element ref="{http://www.aixm.aero/schema/5.1}AbstractPropertiesWithScheduleExtension"/>
 *                   <element ref="{http://www.aixm.aero/schema/5.1}AbstractVerticalStructurePartExtension"/>
 *                 </choice>
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
@XmlType(name = "VerticalStructurePartType", propOrder = {
    "timeInterval",
    "annotation",
    "specialDateAuthority",
    "verticalExtent",
    "verticalExtentAccuracy",
    "type",
    "constructionStatus",
    "markingPattern",
    "markingFirstColour",
    "markingSecondColour",
    "mobile",
    "frangible",
    "visibleMaterial",
    "designator",
    "horizontalProjectionLocation",
    "horizontalProjectionLinearExtent",
    "horizontalProjectionSurfaceExtent",
    "lighting",
    "extension"
})
@Entity
@Table(name = "verticalstructurepart", schema = "obstacles")
public class VerticalStructurePartType
    extends AbstractPropertiesWithScheduleType
{

    @XmlElement(nillable = true)
    @OneToMany(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinTable(name = "verticalstructurepart_timeinterval", joinColumns = {
        @JoinColumn(name = "verticalstructurepart_id")
    }, inverseJoinColumns = {
        @JoinColumn(name = "timesheet_pt_id")
    })
    protected List<TimesheetPropertyType> timeInterval;
    @XmlElement(nillable = true)
    @OneToMany(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinTable(name = "verticalstructurepart_annotation", joinColumns = {
        @JoinColumn(name = "verticalstructurepart_id")
    }, inverseJoinColumns = {
        @JoinColumn(name = "note_pt_id")
    })
    protected List<NotePropertyType> annotation;
    @XmlElement(nillable = true)
    @OneToMany(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinTable(name = "verticalstructurepart_specialdateauthority", joinColumns = {
        @JoinColumn(name = "verticalstructurepart_id")
    }, inverseJoinColumns = {
        @JoinColumn(name = "organisationauthority_pt_id")
    })
    protected List<OrganisationAuthorityPropertyType> specialDateAuthority;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "verticalextent_value", length = 255, columnDefinition = "DECIMAL", nullable = true, unique = false)),
        @AttributeOverride(name = "uom", column = @Column(name = "verticalextent_uom", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "verticalextent_nilreason", length = 255, nullable = true, unique = false))
    })
    protected ValDistanceType verticalExtent;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "verticalextentaccuracy_value", length = 255, columnDefinition = "DECIMAL", nullable = true, unique = false)),
        @AttributeOverride(name = "uom", column = @Column(name = "verticalextentaccuracy_uom", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "verticalextentaccuracy_nilreason", length = 255, nullable = true, unique = false))
    })
    protected ValDistanceType verticalExtentAccuracy;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "type_value", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "type_nilreason", length = 255, nullable = true, unique = false))
    })
    protected CodeVerticalStructureType type;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "constructionstatus_value", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "constructionstatus_nilreason", length = 255, nullable = true, unique = false))
    })
    protected CodeStatusConstructionType constructionStatus;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "markingpattern_value", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "markingpattern_nilreason", length = 255, nullable = true, unique = false))
    })
    protected CodeVerticalStructureMarkingType markingPattern;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "markingfirstcolour_value", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "markingfirstcolour_nilreason", length = 255, nullable = true, unique = false))
    })
    protected CodeColourType markingFirstColour;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "markingsecondcolour_value", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "markingsecondcolour_nilreason", length = 255, nullable = true, unique = false))
    })
    protected CodeColourType markingSecondColour;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "mobile_value", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "mobile_nilreason", length = 255, nullable = true, unique = false))
    })
    protected CodeYesNoType mobile;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "frangible_value", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "frangible_nilreason", length = 255, nullable = true, unique = false))
    })
    protected CodeYesNoType frangible;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "visiblematerial_value", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "visiblematerial_nilreason", length = 255, nullable = true, unique = false))
    })
    protected CodeVerticalStructureMaterialType visibleMaterial;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "designator_value", length = 16, columnDefinition = "TEXT", nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "designator_nilreason", length = 255, nullable = true, unique = false))
    })
    protected TextDesignatorType designator;
    @XmlElement(name = "horizontalProjection_location", nillable = true)
    @OneToOne(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinColumn(name = "horizontalprojection_location_id", referencedColumnName = "id")
    protected ElevatedPointPropertyType horizontalProjectionLocation;
    @XmlElement(name = "horizontalProjection_linearExtent", nillable = true)
    @OneToOne(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinColumn(name = "horizontalprojection_linearextent_id", referencedColumnName = "id")
    protected ElevatedCurvePropertyType horizontalProjectionLinearExtent;
    @XmlElement(name = "horizontalProjection_surfaceExtent", nillable = true)
    @OneToOne(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinColumn(name = "horizontalprojection_surfaceextent_id", referencedColumnName = "id")
    protected ElevatedSurfacePropertyType horizontalProjectionSurfaceExtent;
    @XmlElement(nillable = true)
    @OneToMany(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinTable(name = "verticalstructurepart_lighting", joinColumns = {
        @JoinColumn(name = "verticalstructurepart_id")
    }, inverseJoinColumns = {
        @JoinColumn(name = "lightelement_pt_id")
    })
    protected List<LightElementPropertyType> lighting;
    @Transient
    protected List<VerticalStructurePartType.Extension> extension;

    /**
     * Gets the value of the timeInterval property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the timeInterval property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getTimeInterval().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link TimesheetPropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the timeInterval property.
     */
    public List<TimesheetPropertyType> getTimeInterval() {
        if (timeInterval == null) {
            timeInterval = new ArrayList<>();
        }
        return this.timeInterval;
    }

    public boolean isSetTimeInterval() {
        return ((this.timeInterval!= null)&&(!this.timeInterval.isEmpty()));
    }

    public void unsetTimeInterval() {
        this.timeInterval = null;
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
     * Gets the value of the specialDateAuthority property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the specialDateAuthority property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getSpecialDateAuthority().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link OrganisationAuthorityPropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the specialDateAuthority property.
     */
    public List<OrganisationAuthorityPropertyType> getSpecialDateAuthority() {
        if (specialDateAuthority == null) {
            specialDateAuthority = new ArrayList<>();
        }
        return this.specialDateAuthority;
    }

    public boolean isSetSpecialDateAuthority() {
        return ((this.specialDateAuthority!= null)&&(!this.specialDateAuthority.isEmpty()));
    }

    public void unsetSpecialDateAuthority() {
        this.specialDateAuthority = null;
    }

    /**
     * Gets the value of the verticalExtent property.
     * 
     * @return
     *     possible object is
     *     {@link ValDistanceType }
     *     
     */
    public ValDistanceType getVerticalExtent() {
        return verticalExtent;
    }

    /**
     * Sets the value of the verticalExtent property.
     * 
     * @param value
     *     allowed object is
     *     {@link ValDistanceType }
     *     
     */
    public void setVerticalExtent(ValDistanceType value) {
        this.verticalExtent = value;
    }

    public boolean isSetVerticalExtent() {
        return (this.verticalExtent!= null);
    }

    /**
     * Gets the value of the verticalExtentAccuracy property.
     * 
     * @return
     *     possible object is
     *     {@link ValDistanceType }
     *     
     */
    public ValDistanceType getVerticalExtentAccuracy() {
        return verticalExtentAccuracy;
    }

    /**
     * Sets the value of the verticalExtentAccuracy property.
     * 
     * @param value
     *     allowed object is
     *     {@link ValDistanceType }
     *     
     */
    public void setVerticalExtentAccuracy(ValDistanceType value) {
        this.verticalExtentAccuracy = value;
    }

    public boolean isSetVerticalExtentAccuracy() {
        return (this.verticalExtentAccuracy!= null);
    }

    /**
     * Gets the value of the type property.
     * 
     * @return
     *     possible object is
     *     {@link CodeVerticalStructureType }
     *     
     */
    public CodeVerticalStructureType getType() {
        return type;
    }

    /**
     * Sets the value of the type property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeVerticalStructureType }
     *     
     */
    public void setType(CodeVerticalStructureType value) {
        this.type = value;
    }

    public boolean isSetType() {
        return (this.type!= null);
    }

    /**
     * Gets the value of the constructionStatus property.
     * 
     * @return
     *     possible object is
     *     {@link CodeStatusConstructionType }
     *     
     */
    public CodeStatusConstructionType getConstructionStatus() {
        return constructionStatus;
    }

    /**
     * Sets the value of the constructionStatus property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeStatusConstructionType }
     *     
     */
    public void setConstructionStatus(CodeStatusConstructionType value) {
        this.constructionStatus = value;
    }

    public boolean isSetConstructionStatus() {
        return (this.constructionStatus!= null);
    }

    /**
     * Gets the value of the markingPattern property.
     * 
     * @return
     *     possible object is
     *     {@link CodeVerticalStructureMarkingType }
     *     
     */
    public CodeVerticalStructureMarkingType getMarkingPattern() {
        return markingPattern;
    }

    /**
     * Sets the value of the markingPattern property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeVerticalStructureMarkingType }
     *     
     */
    public void setMarkingPattern(CodeVerticalStructureMarkingType value) {
        this.markingPattern = value;
    }

    public boolean isSetMarkingPattern() {
        return (this.markingPattern!= null);
    }

    /**
     * Gets the value of the markingFirstColour property.
     * 
     * @return
     *     possible object is
     *     {@link CodeColourType }
     *     
     */
    public CodeColourType getMarkingFirstColour() {
        return markingFirstColour;
    }

    /**
     * Sets the value of the markingFirstColour property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeColourType }
     *     
     */
    public void setMarkingFirstColour(CodeColourType value) {
        this.markingFirstColour = value;
    }

    public boolean isSetMarkingFirstColour() {
        return (this.markingFirstColour!= null);
    }

    /**
     * Gets the value of the markingSecondColour property.
     * 
     * @return
     *     possible object is
     *     {@link CodeColourType }
     *     
     */
    public CodeColourType getMarkingSecondColour() {
        return markingSecondColour;
    }

    /**
     * Sets the value of the markingSecondColour property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeColourType }
     *     
     */
    public void setMarkingSecondColour(CodeColourType value) {
        this.markingSecondColour = value;
    }

    public boolean isSetMarkingSecondColour() {
        return (this.markingSecondColour!= null);
    }

    /**
     * Gets the value of the mobile property.
     * 
     * @return
     *     possible object is
     *     {@link CodeYesNoType }
     *     
     */
    public CodeYesNoType getMobile() {
        return mobile;
    }

    /**
     * Sets the value of the mobile property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeYesNoType }
     *     
     */
    public void setMobile(CodeYesNoType value) {
        this.mobile = value;
    }

    public boolean isSetMobile() {
        return (this.mobile!= null);
    }

    /**
     * Gets the value of the frangible property.
     * 
     * @return
     *     possible object is
     *     {@link CodeYesNoType }
     *     
     */
    public CodeYesNoType getFrangible() {
        return frangible;
    }

    /**
     * Sets the value of the frangible property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeYesNoType }
     *     
     */
    public void setFrangible(CodeYesNoType value) {
        this.frangible = value;
    }

    public boolean isSetFrangible() {
        return (this.frangible!= null);
    }

    /**
     * Gets the value of the visibleMaterial property.
     * 
     * @return
     *     possible object is
     *     {@link CodeVerticalStructureMaterialType }
     *     
     */
    public CodeVerticalStructureMaterialType getVisibleMaterial() {
        return visibleMaterial;
    }

    /**
     * Sets the value of the visibleMaterial property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeVerticalStructureMaterialType }
     *     
     */
    public void setVisibleMaterial(CodeVerticalStructureMaterialType value) {
        this.visibleMaterial = value;
    }

    public boolean isSetVisibleMaterial() {
        return (this.visibleMaterial!= null);
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
     * Gets the value of the horizontalProjectionLocation property.
     * 
     * @return
     *     possible object is
     *     {@link ElevatedPointPropertyType }
     *     
     */
    public ElevatedPointPropertyType getHorizontalProjectionLocation() {
        return horizontalProjectionLocation;
    }

    /**
     * Sets the value of the horizontalProjectionLocation property.
     * 
     * @param value
     *     allowed object is
     *     {@link ElevatedPointPropertyType }
     *     
     */
    public void setHorizontalProjectionLocation(ElevatedPointPropertyType value) {
        this.horizontalProjectionLocation = value;
    }

    public boolean isSetHorizontalProjectionLocation() {
        return (this.horizontalProjectionLocation!= null);
    }

    /**
     * Gets the value of the horizontalProjectionLinearExtent property.
     * 
     * @return
     *     possible object is
     *     {@link ElevatedCurvePropertyType }
     *     
     */
    public ElevatedCurvePropertyType getHorizontalProjectionLinearExtent() {
        return horizontalProjectionLinearExtent;
    }

    /**
     * Sets the value of the horizontalProjectionLinearExtent property.
     * 
     * @param value
     *     allowed object is
     *     {@link ElevatedCurvePropertyType }
     *     
     */
    public void setHorizontalProjectionLinearExtent(ElevatedCurvePropertyType value) {
        this.horizontalProjectionLinearExtent = value;
    }

    public boolean isSetHorizontalProjectionLinearExtent() {
        return (this.horizontalProjectionLinearExtent!= null);
    }

    /**
     * Gets the value of the horizontalProjectionSurfaceExtent property.
     * 
     * @return
     *     possible object is
     *     {@link ElevatedSurfacePropertyType }
     *     
     */
    public ElevatedSurfacePropertyType getHorizontalProjectionSurfaceExtent() {
        return horizontalProjectionSurfaceExtent;
    }

    /**
     * Sets the value of the horizontalProjectionSurfaceExtent property.
     * 
     * @param value
     *     allowed object is
     *     {@link ElevatedSurfacePropertyType }
     *     
     */
    public void setHorizontalProjectionSurfaceExtent(ElevatedSurfacePropertyType value) {
        this.horizontalProjectionSurfaceExtent = value;
    }

    public boolean isSetHorizontalProjectionSurfaceExtent() {
        return (this.horizontalProjectionSurfaceExtent!= null);
    }

    /**
     * Gets the value of the lighting property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the lighting property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getLighting().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link LightElementPropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the lighting property.
     */
    public List<LightElementPropertyType> getLighting() {
        if (lighting == null) {
            lighting = new ArrayList<>();
        }
        return this.lighting;
    }

    public boolean isSetLighting() {
        return ((this.lighting!= null)&&(!this.lighting.isEmpty()));
    }

    public void unsetLighting() {
        this.lighting = null;
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
     * {@link VerticalStructurePartType.Extension }
     * </p>
     * 
     * 
     * @return
     *     The value of the extension property.
     */
    public List<VerticalStructurePartType.Extension> getExtension() {
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
     *       <choice>
     *         <element ref="{http://www.aixm.aero/schema/5.1}AbstractPropertiesWithScheduleExtension"/>
     *         <element ref="{http://www.aixm.aero/schema/5.1}AbstractVerticalStructurePartExtension"/>
     *       </choice>
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
        "abstractPropertiesWithScheduleExtension",
        "abstractVerticalStructurePartExtension"
    })
    public static class Extension {

        @XmlElement(name = "AbstractPropertiesWithScheduleExtension")
        @OneToOne(cascade = {
            CascadeType.ALL
        }, fetch = FetchType.EAGER)
        @JoinColumn(name = "abstractpropertieswithscheduleextension_id", referencedColumnName = "id")
        protected AbstractExtensionType abstractPropertiesWithScheduleExtension;
        @XmlElement(name = "AbstractVerticalStructurePartExtension")
        @OneToOne(cascade = {
            CascadeType.ALL
        }, fetch = FetchType.EAGER)
        @JoinColumn(name = "abstractverticalstructurepartextension_id", referencedColumnName = "id")
        protected AbstractExtensionType abstractVerticalStructurePartExtension;
        @XmlAttribute(name = "owns")
        @Transient
        protected Boolean owns;

        /**
         * Gets the value of the abstractPropertiesWithScheduleExtension property.
         * 
         * @return
         *     possible object is
         *     {@link AbstractExtensionType }
         *     
         */
        public AbstractExtensionType getAbstractPropertiesWithScheduleExtension() {
            return abstractPropertiesWithScheduleExtension;
        }

        /**
         * Sets the value of the abstractPropertiesWithScheduleExtension property.
         * 
         * @param value
         *     allowed object is
         *     {@link AbstractExtensionType }
         *     
         */
        public void setAbstractPropertiesWithScheduleExtension(AbstractExtensionType value) {
            this.abstractPropertiesWithScheduleExtension = value;
        }

        public boolean isSetAbstractPropertiesWithScheduleExtension() {
            return (this.abstractPropertiesWithScheduleExtension!= null);
        }

        /**
         * Gets the value of the abstractVerticalStructurePartExtension property.
         * 
         * @return
         *     possible object is
         *     {@link AbstractExtensionType }
         *     
         */
        public AbstractExtensionType getAbstractVerticalStructurePartExtension() {
            return abstractVerticalStructurePartExtension;
        }

        /**
         * Sets the value of the abstractVerticalStructurePartExtension property.
         * 
         * @param value
         *     allowed object is
         *     {@link AbstractExtensionType }
         *     
         */
        public void setAbstractVerticalStructurePartExtension(AbstractExtensionType value) {
            this.abstractVerticalStructurePartExtension = value;
        }

        public boolean isSetAbstractVerticalStructurePartExtension() {
            return (this.abstractVerticalStructurePartExtension!= null);
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
