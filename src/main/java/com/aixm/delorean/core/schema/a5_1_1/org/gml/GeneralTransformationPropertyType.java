//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.schema.a5_1_1.org.gml;

import java.util.ArrayList;
import java.util.List;
import com.aixm.delorean.core.schema.a5_1_1.org.w3.xlink.ActuateType;
import com.aixm.delorean.core.schema.a5_1_1.org.w3.xlink.ShowType;
import com.aixm.delorean.core.schema.a5_1_1.org.w3.xlink.TypeType;
import jakarta.persistence.Transient;
import jakarta.xml.bind.JAXBElement;
import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlAttribute;
import jakarta.xml.bind.annotation.XmlElementRef;
import jakarta.xml.bind.annotation.XmlSchemaType;
import jakarta.xml.bind.annotation.XmlType;


/**
 * gml:GeneralTransformationPropertyType is a property type for association roles to a general transformation, either referencing or containing the definition of that transformation.
 * 
 * <p>Java class for GeneralTransformationPropertyType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="GeneralTransformationPropertyType">
 *   <complexContent>
 *     <restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       <sequence minOccurs="0">
 *         <element ref="{http://www.opengis.net/gml/3.2}AbstractGeneralTransformation"/>
 *       </sequence>
 *       <attGroup ref="{http://www.opengis.net/gml/3.2}AssociationAttributeGroup"/>
 *     </restriction>
 *   </complexContent>
 * </complexType>
 * }</pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "GeneralTransformationPropertyType", propOrder = {
    "abstractGeneralTransformation"
})
public class GeneralTransformationPropertyType {

    /**
     * gml:AbstractGeneralTransformation is an abstract operation on coordinates that usually includes a change of Datum. The parameters of a coordinate transformation are empirically derived from data containing the coordinates of a series of points in both coordinate reference systems. This computational process is usually "over-determined", allowing derivation of error (or accuracy) estimates for the transformation. Also, the stochastic nature of the parameters may result in multiple (different) versions of the same coordinate transformation. The operationVersion, sourceCRS, and targetCRS proeprty elements are mandatory in a coordinate transformation.
     * This abstract complex type is expected to be extended for well-known operation methods with many Transformation instances, in Application Schemas that define operation-method-specialized value element names and contents. This transformation uses an operation method with associated parameter values. However, operation methods and parameter values are directly associated with concrete subtypes, not with this abstract type. All concrete types derived from this type shall extend this type to include a "usesMethod" element that references one "OperationMethod" element. Similarly, all concrete types derived from this type shall extend this type to include one or more elements each named "uses...Value" that each use the type of an element substitutable for the "AbstractGeneralParameterValue" element.
     * 
     */
    @XmlElementRef(name = "AbstractGeneralTransformation", namespace = "http://www.opengis.net/gml/3.2", type = JAXBElement.class, required = false)
    protected JAXBElement<? extends AbstractGeneralTransformationType> abstractGeneralTransformation;
    @XmlAttribute(name = "nilReason")
    protected List<String> nilReason;
    @XmlAttribute(name = "remoteSchema", namespace = "http://www.opengis.net/gml/3.2")
    @XmlSchemaType(name = "anyURI")
    protected String remoteSchema;
    @XmlAttribute(name = "type", namespace = "http://www.w3.org/1999/xlink")
    public static final TypeType TYPE = TypeType.SIMPLE;
    @XmlAttribute(name = "href", namespace = "http://www.w3.org/1999/xlink")
    @Transient
    protected String href;
    @XmlAttribute(name = "role", namespace = "http://www.w3.org/1999/xlink")
    @Transient
    protected String role;
    @XmlAttribute(name = "arcrole", namespace = "http://www.w3.org/1999/xlink")
    @Transient
    protected String arcrole;
    @XmlAttribute(name = "title", namespace = "http://www.w3.org/1999/xlink")
    @Transient
    protected String titleAttribute;
    @XmlAttribute(name = "show", namespace = "http://www.w3.org/1999/xlink")
    @Transient
    protected ShowType show;
    @XmlAttribute(name = "actuate", namespace = "http://www.w3.org/1999/xlink")
    @Transient
    protected ActuateType actuate;

    /**
     * gml:AbstractGeneralTransformation is an abstract operation on coordinates that usually includes a change of Datum. The parameters of a coordinate transformation are empirically derived from data containing the coordinates of a series of points in both coordinate reference systems. This computational process is usually "over-determined", allowing derivation of error (or accuracy) estimates for the transformation. Also, the stochastic nature of the parameters may result in multiple (different) versions of the same coordinate transformation. The operationVersion, sourceCRS, and targetCRS proeprty elements are mandatory in a coordinate transformation.
     * This abstract complex type is expected to be extended for well-known operation methods with many Transformation instances, in Application Schemas that define operation-method-specialized value element names and contents. This transformation uses an operation method with associated parameter values. However, operation methods and parameter values are directly associated with concrete subtypes, not with this abstract type. All concrete types derived from this type shall extend this type to include a "usesMethod" element that references one "OperationMethod" element. Similarly, all concrete types derived from this type shall extend this type to include one or more elements each named "uses...Value" that each use the type of an element substitutable for the "AbstractGeneralParameterValue" element.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link AbstractGeneralTransformationType }{@code >}
     *     {@link JAXBElement }{@code <}{@link TransformationType }{@code >}
     *     
     */
    public JAXBElement<? extends AbstractGeneralTransformationType> getAbstractGeneralTransformation() {
        return abstractGeneralTransformation;
    }

    /**
     * Sets the value of the abstractGeneralTransformation property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link AbstractGeneralTransformationType }{@code >}
     *     {@link JAXBElement }{@code <}{@link TransformationType }{@code >}
     *     
     * @see #getAbstractGeneralTransformation()
     */
    public void setAbstractGeneralTransformation(JAXBElement<? extends AbstractGeneralTransformationType> value) {
        this.abstractGeneralTransformation = value;
    }

    public boolean isSetAbstractGeneralTransformation() {
        return (this.abstractGeneralTransformation!= null);
    }

    /**
     * Gets the value of the nilReason property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the nilReason property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getNilReason().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link String }
     * </p>
     * 
     * 
     * @return
     *     The value of the nilReason property.
     */
    public List<String> getNilReason() {
        if (nilReason == null) {
            nilReason = new ArrayList<>();
        }
        return this.nilReason;
    }

    public boolean isSetNilReason() {
        return ((this.nilReason!= null)&&(!this.nilReason.isEmpty()));
    }

    public void unsetNilReason() {
        this.nilReason = null;
    }

    /**
     * Gets the value of the remoteSchema property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getRemoteSchema() {
        return remoteSchema;
    }

    /**
     * Sets the value of the remoteSchema property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setRemoteSchema(String value) {
        this.remoteSchema = value;
    }

    public boolean isSetRemoteSchema() {
        return (this.remoteSchema!= null);
    }

    /**
     * Gets the value of the href property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getHref() {
        return href;
    }

    /**
     * Sets the value of the href property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setHref(String value) {
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
     *     {@link String }
     *     
     */
    public String getRole() {
        return role;
    }

    /**
     * Sets the value of the role property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setRole(String value) {
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
     *     {@link String }
     *     
     */
    public String getArcrole() {
        return arcrole;
    }

    /**
     * Sets the value of the arcrole property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setArcrole(String value) {
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
     *     {@link String }
     *     
     */
    public String getTitleAttribute() {
        return titleAttribute;
    }

    /**
     * Sets the value of the titleAttribute property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setTitleAttribute(String value) {
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
