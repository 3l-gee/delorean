//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.schema.a5_1_1.org.gmd;

import com.aixm.delorean.core.schema.a5_1_1.org.gml.NilReasonType;
import com.aixm.delorean.core.schema.a5_1_1.org.w3.xlink.ActuateType;
import com.aixm.delorean.core.schema.a5_1_1.org.w3.xlink.ArcroleType;
import com.aixm.delorean.core.schema.a5_1_1.org.w3.xlink.HrefType;
import com.aixm.delorean.core.schema.a5_1_1.org.w3.xlink.RoleType;
import com.aixm.delorean.core.schema.a5_1_1.org.w3.xlink.ShowType;
import com.aixm.delorean.core.schema.a5_1_1.org.w3.xlink.TitleAttrType;
import com.aixm.delorean.core.schema.a5_1_1.org.w3.xlink.TypeType;
import jakarta.xml.bind.JAXBElement;
import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlAttribute;
import jakarta.xml.bind.annotation.XmlElementRef;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Java class for DQ_Element_PropertyType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="DQ_Element_PropertyType">
 *   <complexContent>
 *     <restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       <sequence minOccurs="0">
 *         <element ref="{http://www.isotc211.org/2005/gmd}AbstractDQ_Element"/>
 *       </sequence>
 *       <attGroup ref="{http://www.isotc211.org/2005/gco}ObjectReference"/>
 *       <attribute ref="{http://www.isotc211.org/2005/gco}nilReason"/>
 *     </restriction>
 *   </complexContent>
 * </complexType>
 * }</pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "DQ_Element_PropertyType", propOrder = {
    "abstractDQElement"
})
public class DQElementPropertyType {

    @XmlElementRef(name = "AbstractDQ_Element", namespace = "http://www.isotc211.org/2005/gmd", type = JAXBElement.class, required = false)
    protected JAXBElement<? extends AbstractDQElementType> abstractDQElement;
    @XmlAttribute(name = "nilReason", namespace = "http://www.isotc211.org/2005/gco")
    protected NilReasonType nilReason;
    @XmlAttribute(name = "uuidref")
    protected String uuidref;
    @XmlAttribute(name = "type", namespace = "http://www.w3.org/1999/xlink")
    public static final TypeType TYPE = TypeType.SIMPLE;
    @XmlAttribute(name = "href", namespace = "http://www.w3.org/1999/xlink")
    protected HrefType href;
    @XmlAttribute(name = "role", namespace = "http://www.w3.org/1999/xlink")
    protected RoleType role;
    @XmlAttribute(name = "arcrole", namespace = "http://www.w3.org/1999/xlink")
    protected ArcroleType arcrole;
    @XmlAttribute(name = "title", namespace = "http://www.w3.org/1999/xlink")
    protected TitleAttrType titleAttribute;
    @XmlAttribute(name = "show", namespace = "http://www.w3.org/1999/xlink")
    protected ShowType show;
    @XmlAttribute(name = "actuate", namespace = "http://www.w3.org/1999/xlink")
    protected ActuateType actuate;

    /**
     * Gets the value of the abstractDQElement property.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link AbstractDQCompletenessType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractDQElementType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractDQLogicalConsistencyType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractDQPositionalAccuracyType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractDQTemporalAccuracyType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractDQThematicAccuracyType }{@code >}
     *     {@link JAXBElement }{@code <}{@link DQAbsoluteExternalPositionalAccuracyType }{@code >}
     *     {@link JAXBElement }{@code <}{@link DQAccuracyOfATimeMeasurementType }{@code >}
     *     {@link JAXBElement }{@code <}{@link DQCompletenessCommissionType }{@code >}
     *     {@link JAXBElement }{@code <}{@link DQCompletenessOmissionType }{@code >}
     *     {@link JAXBElement }{@code <}{@link DQConceptualConsistencyType }{@code >}
     *     {@link JAXBElement }{@code <}{@link DQDomainConsistencyType }{@code >}
     *     {@link JAXBElement }{@code <}{@link DQFormatConsistencyType }{@code >}
     *     {@link JAXBElement }{@code <}{@link DQGriddedDataPositionalAccuracyType }{@code >}
     *     {@link JAXBElement }{@code <}{@link DQNonQuantitativeAttributeAccuracyType }{@code >}
     *     {@link JAXBElement }{@code <}{@link DQQuantitativeAttributeAccuracyType }{@code >}
     *     {@link JAXBElement }{@code <}{@link DQRelativeInternalPositionalAccuracyType }{@code >}
     *     {@link JAXBElement }{@code <}{@link DQTemporalConsistencyType }{@code >}
     *     {@link JAXBElement }{@code <}{@link DQTemporalValidityType }{@code >}
     *     {@link JAXBElement }{@code <}{@link DQThematicClassificationCorrectnessType }{@code >}
     *     {@link JAXBElement }{@code <}{@link DQTopologicalConsistencyType }{@code >}
     *     
     */
    public JAXBElement<? extends AbstractDQElementType> getAbstractDQElement() {
        return abstractDQElement;
    }

    /**
     * Sets the value of the abstractDQElement property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link AbstractDQCompletenessType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractDQElementType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractDQLogicalConsistencyType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractDQPositionalAccuracyType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractDQTemporalAccuracyType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractDQThematicAccuracyType }{@code >}
     *     {@link JAXBElement }{@code <}{@link DQAbsoluteExternalPositionalAccuracyType }{@code >}
     *     {@link JAXBElement }{@code <}{@link DQAccuracyOfATimeMeasurementType }{@code >}
     *     {@link JAXBElement }{@code <}{@link DQCompletenessCommissionType }{@code >}
     *     {@link JAXBElement }{@code <}{@link DQCompletenessOmissionType }{@code >}
     *     {@link JAXBElement }{@code <}{@link DQConceptualConsistencyType }{@code >}
     *     {@link JAXBElement }{@code <}{@link DQDomainConsistencyType }{@code >}
     *     {@link JAXBElement }{@code <}{@link DQFormatConsistencyType }{@code >}
     *     {@link JAXBElement }{@code <}{@link DQGriddedDataPositionalAccuracyType }{@code >}
     *     {@link JAXBElement }{@code <}{@link DQNonQuantitativeAttributeAccuracyType }{@code >}
     *     {@link JAXBElement }{@code <}{@link DQQuantitativeAttributeAccuracyType }{@code >}
     *     {@link JAXBElement }{@code <}{@link DQRelativeInternalPositionalAccuracyType }{@code >}
     *     {@link JAXBElement }{@code <}{@link DQTemporalConsistencyType }{@code >}
     *     {@link JAXBElement }{@code <}{@link DQTemporalValidityType }{@code >}
     *     {@link JAXBElement }{@code <}{@link DQThematicClassificationCorrectnessType }{@code >}
     *     {@link JAXBElement }{@code <}{@link DQTopologicalConsistencyType }{@code >}
     *     
     */
    public void setAbstractDQElement(JAXBElement<? extends AbstractDQElementType> value) {
        this.abstractDQElement = value;
    }

    public boolean isSetAbstractDQElement() {
        return (this.abstractDQElement!= null);
    }

    /**
     * Gets the value of the nilReason property.
     * 
     * @return
     *     possible object is
     *     {@link NilReasonType }
     *     
     */
    public NilReasonType getNilReason() {
        return nilReason;
    }

    /**
     * Sets the value of the nilReason property.
     * 
     * @param value
     *     allowed object is
     *     {@link NilReasonType }
     *     
     */
    public void setNilReason(NilReasonType value) {
        this.nilReason = value;
    }

    public boolean isSetNilReason() {
        return (this.nilReason!= null);
    }

    /**
     * Gets the value of the uuidref property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getUuidref() {
        return uuidref;
    }

    /**
     * Sets the value of the uuidref property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setUuidref(String value) {
        this.uuidref = value;
    }

    public boolean isSetUuidref() {
        return (this.uuidref!= null);
    }

    /**
     * Gets the value of the href property.
     * 
     * @return
     *     possible object is
     *     {@link HrefType }
     *     
     */
    public HrefType getHref() {
        return href;
    }

    /**
     * Sets the value of the href property.
     * 
     * @param value
     *     allowed object is
     *     {@link HrefType }
     *     
     */
    public void setHref(HrefType value) {
        this.href = value;
    }

    public boolean isSetHref() {
        return (this.href!= null);
    }

    /**
     * Gets the value of the role property.
     * 
     * @return
     *     possible object is
     *     {@link RoleType }
     *     
     */
    public RoleType getRole() {
        return role;
    }

    /**
     * Sets the value of the role property.
     * 
     * @param value
     *     allowed object is
     *     {@link RoleType }
     *     
     */
    public void setRole(RoleType value) {
        this.role = value;
    }

    public boolean isSetRole() {
        return (this.role!= null);
    }

    /**
     * Gets the value of the arcrole property.
     * 
     * @return
     *     possible object is
     *     {@link ArcroleType }
     *     
     */
    public ArcroleType getArcrole() {
        return arcrole;
    }

    /**
     * Sets the value of the arcrole property.
     * 
     * @param value
     *     allowed object is
     *     {@link ArcroleType }
     *     
     */
    public void setArcrole(ArcroleType value) {
        this.arcrole = value;
    }

    public boolean isSetArcrole() {
        return (this.arcrole!= null);
    }

    /**
     * Gets the value of the titleAttribute property.
     * 
     * @return
     *     possible object is
     *     {@link TitleAttrType }
     *     
     */
    public TitleAttrType getTitleAttribute() {
        return titleAttribute;
    }

    /**
     * Sets the value of the titleAttribute property.
     * 
     * @param value
     *     allowed object is
     *     {@link TitleAttrType }
     *     
     */
    public void setTitleAttribute(TitleAttrType value) {
        this.titleAttribute = value;
    }

    public boolean isSetTitleAttribute() {
        return (this.titleAttribute!= null);
    }

    /**
     * Gets the value of the show property.
     * 
     * @return
     *     possible object is
     *     {@link ShowType }
     *     
     */
    public ShowType getShow() {
        return show;
    }

    /**
     * Sets the value of the show property.
     * 
     * @param value
     *     allowed object is
     *     {@link ShowType }
     *     
     */
    public void setShow(ShowType value) {
        this.show = value;
    }

    public boolean isSetShow() {
        return (this.show!= null);
    }

    /**
     * Gets the value of the actuate property.
     * 
     * @return
     *     possible object is
     *     {@link ActuateType }
     *     
     */
    public ActuateType getActuate() {
        return actuate;
    }

    /**
     * Sets the value of the actuate property.
     * 
     * @param value
     *     allowed object is
     *     {@link ActuateType }
     *     
     */
    public void setActuate(ActuateType value) {
        this.actuate = value;
    }

    public boolean isSetActuate() {
        return (this.actuate!= null);
    }

}