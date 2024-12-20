//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.schema.a5_1_1.org.gml;

import java.util.ArrayList;
import java.util.List;
import com.aixm.delorean.core.schema.a5_1_1.aixm.ElevatedCurveType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.ElevatedPointType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.ElevatedSurfaceType;
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
 * A property that has a geometric primitive as its value domain may either be an appropriate geometry element encapsulated in an element of this type or an XLink reference to a remote geometry element (where remote includes geometry elements located elsewhere in the same document). Either the reference or the contained element shall be given, but neither both nor none.
 * 
 * <p>Java class for GeometricPrimitivePropertyType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="GeometricPrimitivePropertyType">
 *   <complexContent>
 *     <restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       <sequence minOccurs="0">
 *         <element ref="{http://www.opengis.net/gml/3.2}AbstractGeometricPrimitive"/>
 *       </sequence>
 *       <attGroup ref="{http://www.opengis.net/gml/3.2}OwnershipAttributeGroup"/>
 *       <attGroup ref="{http://www.opengis.net/gml/3.2}AssociationAttributeGroup"/>
 *     </restriction>
 *   </complexContent>
 * </complexType>
 * }</pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "GeometricPrimitivePropertyType", propOrder = {
    "abstractGeometricPrimitive"
})
public class GeometricPrimitivePropertyType {

    /**
     * The AbstractGeometricPrimitive element is the abstract head of the substitution group for all (pre- and user-defined) geometric primitives.
     * 
     */
    @XmlElementRef(name = "AbstractGeometricPrimitive", namespace = "http://www.opengis.net/gml/3.2", type = JAXBElement.class, required = false)
    protected JAXBElement<? extends AbstractGeometricPrimitiveType> abstractGeometricPrimitive;
    @XmlAttribute(name = "owns")
    protected java.lang.Boolean owns;
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
     * The AbstractGeometricPrimitive element is the abstract head of the substitution group for all (pre- and user-defined) geometric primitives.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.schema.a5_1_1.aixm.CurveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link ElevatedCurveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link ElevatedPointType }{@code >}
     *     {@link JAXBElement }{@code <}{@link ElevatedSurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.schema.a5_1_1.aixm.PointType }{@code >}
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.schema.a5_1_1.aixm.SurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractCurveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractGeometricPrimitiveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractRingType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractSolidType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractSurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link CompositeCurveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link CompositeSolidType }{@code >}
     *     {@link JAXBElement }{@code <}{@link CompositeSurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.schema.a5_1_1.org.gml.CurveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link LineStringType }{@code >}
     *     {@link JAXBElement }{@code <}{@link LinearRingType }{@code >}
     *     {@link JAXBElement }{@code <}{@link OrientableCurveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link OrientableSurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.schema.a5_1_1.org.gml.PointType }{@code >}
     *     {@link JAXBElement }{@code <}{@link PolygonType }{@code >}
     *     {@link JAXBElement }{@code <}{@link RingType }{@code >}
     *     {@link JAXBElement }{@code <}{@link ShellType }{@code >}
     *     {@link JAXBElement }{@code <}{@link SolidType }{@code >}
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.schema.a5_1_1.org.gml.SurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.schema.a5_1_1.org.gml.SurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.schema.a5_1_1.org.gml.SurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link TinType }{@code >}
     *     
     */
    public JAXBElement<? extends AbstractGeometricPrimitiveType> getAbstractGeometricPrimitive() {
        return abstractGeometricPrimitive;
    }

    /**
     * Sets the value of the abstractGeometricPrimitive property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.schema.a5_1_1.aixm.CurveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link ElevatedCurveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link ElevatedPointType }{@code >}
     *     {@link JAXBElement }{@code <}{@link ElevatedSurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.schema.a5_1_1.aixm.PointType }{@code >}
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.schema.a5_1_1.aixm.SurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractCurveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractGeometricPrimitiveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractRingType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractSolidType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractSurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link CompositeCurveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link CompositeSolidType }{@code >}
     *     {@link JAXBElement }{@code <}{@link CompositeSurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.schema.a5_1_1.org.gml.CurveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link LineStringType }{@code >}
     *     {@link JAXBElement }{@code <}{@link LinearRingType }{@code >}
     *     {@link JAXBElement }{@code <}{@link OrientableCurveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link OrientableSurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.schema.a5_1_1.org.gml.PointType }{@code >}
     *     {@link JAXBElement }{@code <}{@link PolygonType }{@code >}
     *     {@link JAXBElement }{@code <}{@link RingType }{@code >}
     *     {@link JAXBElement }{@code <}{@link ShellType }{@code >}
     *     {@link JAXBElement }{@code <}{@link SolidType }{@code >}
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.schema.a5_1_1.org.gml.SurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.schema.a5_1_1.org.gml.SurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.schema.a5_1_1.org.gml.SurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link TinType }{@code >}
     *     
     * @see #getAbstractGeometricPrimitive()
     */
    public void setAbstractGeometricPrimitive(JAXBElement<? extends AbstractGeometricPrimitiveType> value) {
        this.abstractGeometricPrimitive = value;
    }

    public boolean isSetAbstractGeometricPrimitive() {
        return (this.abstractGeometricPrimitive!= null);
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
