//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.schema.a5_1_1.org.gml;

import com.aixm.delorean.core.schema.a5_1_1.org.w3.xlink.ActuateType;
import com.aixm.delorean.core.schema.a5_1_1.org.w3.xlink.ArcroleType;
import com.aixm.delorean.core.schema.a5_1_1.org.w3.xlink.HrefType;
import com.aixm.delorean.core.schema.a5_1_1.org.w3.xlink.RoleType;
import com.aixm.delorean.core.schema.a5_1_1.org.w3.xlink.ShowType;
import com.aixm.delorean.core.schema.a5_1_1.org.w3.xlink.TitleAttrType;
import com.aixm.delorean.core.schema.a5_1_1.org.w3.xlink.TypeType;
import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlAttribute;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlSchemaType;
import jakarta.xml.bind.annotation.XmlType;


/**
 * gml:OperationMethodPropertyType is a property type for association roles to a concrete general-purpose operation method, either referencing or containing the definition of that method.
 * 
 * <p>Java class for OperationMethodPropertyType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="OperationMethodPropertyType">
 *   <complexContent>
 *     <restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       <sequence minOccurs="0">
 *         <element ref="{http://www.opengis.net/gml/3.2}OperationMethod"/>
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
@XmlType(name = "OperationMethodPropertyType", propOrder = {
    "operationMethod"
})
public class OperationMethodPropertyType {

    /**
     * gml:OperationMethod is a method (algorithm or procedure) used to perform a coordinate operation. Most operation methods use a number of operation parameters, although some coordinate conversions use none. Each coordinate operation using the method assigns values to these parameters.
     * The parameter elements are an unordered list of associations to the set of operation parameters and parameter groups used by this operation method.
     * 
     */
    @XmlElement(name = "OperationMethod")
    protected OperationMethodType operationMethod;
    @XmlAttribute(name = "nilReason")
    protected NilReasonType nilReason;
    @XmlAttribute(name = "remoteSchema", namespace = "http://www.opengis.net/gml/3.2")
    @XmlSchemaType(name = "anyURI")
    protected String remoteSchema;
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
     * gml:OperationMethod is a method (algorithm or procedure) used to perform a coordinate operation. Most operation methods use a number of operation parameters, although some coordinate conversions use none. Each coordinate operation using the method assigns values to these parameters.
     * The parameter elements are an unordered list of associations to the set of operation parameters and parameter groups used by this operation method.
     * 
     * @return
     *     possible object is
     *     {@link OperationMethodType }
     *     
     */
    public OperationMethodType getOperationMethod() {
        return operationMethod;
    }

    /**
     * Sets the value of the operationMethod property.
     * 
     * @param value
     *     allowed object is
     *     {@link OperationMethodType }
     *     
     * @see #getOperationMethod()
     */
    public void setOperationMethod(OperationMethodType value) {
        this.operationMethod = value;
    }

    public boolean isSetOperationMethod() {
        return (this.operationMethod!= null);
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