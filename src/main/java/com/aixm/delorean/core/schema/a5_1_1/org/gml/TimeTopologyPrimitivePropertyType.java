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
import jakarta.xml.bind.JAXBElement;
import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlAttribute;
import jakarta.xml.bind.annotation.XmlElementRef;
import jakarta.xml.bind.annotation.XmlSchemaType;
import jakarta.xml.bind.annotation.XmlType;


/**
 * gml:TimeTopologyPrimitivePropertyType provides for associating a gml:AbstractTimeTopologyPrimitive with an object.
 * 
 * <p>Java class for TimeTopologyPrimitivePropertyType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="TimeTopologyPrimitivePropertyType">
 *   <complexContent>
 *     <restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       <sequence minOccurs="0">
 *         <element ref="{http://www.opengis.net/gml/3.2}AbstractTimeTopologyPrimitive"/>
 *       </sequence>
 *       <attGroup ref="{http://www.opengis.net/gml/3.2}AssociationAttributeGroup"/>
 *       <attGroup ref="{http://www.opengis.net/gml/3.2}OwnershipAttributeGroup"/>
 *     </restriction>
 *   </complexContent>
 * </complexType>
 * }</pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "TimeTopologyPrimitivePropertyType", propOrder = {
    "abstractTimeTopologyPrimitive"
})
public class TimeTopologyPrimitivePropertyType {

    /**
     * gml:TimeTopologyPrimitive acts as the head of a substitution group for topological temporal primitives.
     * Temporal topology primitives shall imply the ordering information between features or feature properties. The temporal connection of features can be examined if they have temporal topology primitives as values of their properties. Usually, an instantaneous feature associates with a time node, and a static feature associates with a time edge.  A feature with both modes associates with the temporal topology primitive: a supertype of time nodes and time edges.
     * A topological primitive is always connected to one or more other topological primitives, and is, therefore, always a member of a topological complex. In a GML instance, this will often be indicated by the primitives being described by elements that are descendents of an element describing a complex. However, in order to support the case where a temporal topological primitive is described in another context, the optional complex property is provided, which carries a reference to the parent temporal topological complex.
     * 
     */
    @XmlElementRef(name = "AbstractTimeTopologyPrimitive", namespace = "http://www.opengis.net/gml/3.2", type = JAXBElement.class, required = false)
    protected JAXBElement<? extends AbstractTimeTopologyPrimitiveType> abstractTimeTopologyPrimitive;
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
    @XmlAttribute(name = "owns")
    protected java.lang.Boolean owns;

    /**
     * gml:TimeTopologyPrimitive acts as the head of a substitution group for topological temporal primitives.
     * Temporal topology primitives shall imply the ordering information between features or feature properties. The temporal connection of features can be examined if they have temporal topology primitives as values of their properties. Usually, an instantaneous feature associates with a time node, and a static feature associates with a time edge.  A feature with both modes associates with the temporal topology primitive: a supertype of time nodes and time edges.
     * A topological primitive is always connected to one or more other topological primitives, and is, therefore, always a member of a topological complex. In a GML instance, this will often be indicated by the primitives being described by elements that are descendents of an element describing a complex. However, in order to support the case where a temporal topological primitive is described in another context, the optional complex property is provided, which carries a reference to the parent temporal topological complex.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link AbstractTimeTopologyPrimitiveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link TimeEdgeType }{@code >}
     *     {@link JAXBElement }{@code <}{@link TimeNodeType }{@code >}
     *     
     */
    public JAXBElement<? extends AbstractTimeTopologyPrimitiveType> getAbstractTimeTopologyPrimitive() {
        return abstractTimeTopologyPrimitive;
    }

    /**
     * Sets the value of the abstractTimeTopologyPrimitive property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link AbstractTimeTopologyPrimitiveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link TimeEdgeType }{@code >}
     *     {@link JAXBElement }{@code <}{@link TimeNodeType }{@code >}
     *     
     * @see #getAbstractTimeTopologyPrimitive()
     */
    public void setAbstractTimeTopologyPrimitive(JAXBElement<? extends AbstractTimeTopologyPrimitiveType> value) {
        this.abstractTimeTopologyPrimitive = value;
    }

    public boolean isSetAbstractTimeTopologyPrimitive() {
        return (this.abstractTimeTopologyPrimitive!= null);
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

    /**
     * Gets the value of the owns property.
     * 
     * @return
     *     possible object is
     *     {@link java.lang.Boolean }
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
     *     {@link java.lang.Boolean }
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