//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.org.gss;

import java.util.ArrayList;
import java.util.List;
import com.aixm.delorean.core.aixm.ElevatedCurveType;
import com.aixm.delorean.core.aixm.ElevatedPointType;
import com.aixm.delorean.core.aixm.ElevatedSurfaceType;
import com.aixm.delorean.core.org.gml.AbstractCurveType;
import com.aixm.delorean.core.org.gml.AbstractGeometricAggregateType;
import com.aixm.delorean.core.org.gml.AbstractGeometricPrimitiveType;
import com.aixm.delorean.core.org.gml.AbstractGeometryType;
import com.aixm.delorean.core.org.gml.AbstractRingType;
import com.aixm.delorean.core.org.gml.AbstractSolidType;
import com.aixm.delorean.core.org.gml.AbstractSurfaceType;
import com.aixm.delorean.core.org.gml.CompositeCurveType;
import com.aixm.delorean.core.org.gml.CompositeSolidType;
import com.aixm.delorean.core.org.gml.CompositeSurfaceType;
import com.aixm.delorean.core.org.gml.GeometricComplexType;
import com.aixm.delorean.core.org.gml.GridType;
import com.aixm.delorean.core.org.gml.LineStringType;
import com.aixm.delorean.core.org.gml.LinearRingType;
import com.aixm.delorean.core.org.gml.MultiCurveType;
import com.aixm.delorean.core.org.gml.MultiGeometryType;
import com.aixm.delorean.core.org.gml.MultiPointType;
import com.aixm.delorean.core.org.gml.MultiSolidType;
import com.aixm.delorean.core.org.gml.MultiSurfaceType;
import com.aixm.delorean.core.org.gml.OrientableCurveType;
import com.aixm.delorean.core.org.gml.OrientableSurfaceType;
import com.aixm.delorean.core.org.gml.PolygonType;
import com.aixm.delorean.core.org.gml.RectifiedGridType;
import com.aixm.delorean.core.org.gml.RingType;
import com.aixm.delorean.core.org.gml.ShellType;
import com.aixm.delorean.core.org.gml.SolidType;
import com.aixm.delorean.core.org.gml.TinType;
import com.aixm.delorean.core.org.w3.xlink.ActuateType;
import com.aixm.delorean.core.org.w3.xlink.ShowType;
import com.aixm.delorean.core.org.w3.xlink.TypeType;
import jakarta.xml.bind.JAXBElement;
import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlAttribute;
import jakarta.xml.bind.annotation.XmlElementRef;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Java class for GM_Object_PropertyType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="GM_Object_PropertyType">
 *   <complexContent>
 *     <restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       <sequence minOccurs="0">
 *         <element ref="{http://www.opengis.net/gml/3.2}AbstractGeometry"/>
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
@XmlType(name = "GM_Object_PropertyType", propOrder = {
    "abstractGeometry"
})
public class GMObjectPropertyType {

    /**
     * The AbstractGeometry element is the abstract head of the substitution group for all geometry elements of GML. This includes pre-defined and user-defined geometry elements. Any geometry element shall be a direct or indirect extension/restriction of AbstractGeometryType and shall be directly or indirectly in the substitution group of AbstractGeometry.
     * 
     */
    @XmlElementRef(name = "AbstractGeometry", namespace = "http://www.opengis.net/gml/3.2", type = JAXBElement.class, required = false)
    protected JAXBElement<? extends AbstractGeometryType> abstractGeometry;
    @XmlAttribute(name = "nilReason", namespace = "http://www.isotc211.org/2005/gco")
    protected List<String> nilReason;
    @XmlAttribute(name = "uuidref")
    protected String uuidref;
    @XmlAttribute(name = "type", namespace = "http://www.w3.org/1999/xlink")
    public static final TypeType TYPE = TypeType.SIMPLE;
    @XmlAttribute(name = "href", namespace = "http://www.w3.org/1999/xlink")
    protected String href;
    @XmlAttribute(name = "role", namespace = "http://www.w3.org/1999/xlink")
    protected String role;
    @XmlAttribute(name = "arcrole", namespace = "http://www.w3.org/1999/xlink")
    protected String arcrole;
    @XmlAttribute(name = "title", namespace = "http://www.w3.org/1999/xlink")
    protected String titleAttribute;
    @XmlAttribute(name = "show", namespace = "http://www.w3.org/1999/xlink")
    protected ShowType show;
    @XmlAttribute(name = "actuate", namespace = "http://www.w3.org/1999/xlink")
    protected ActuateType actuate;

    /**
     * The AbstractGeometry element is the abstract head of the substitution group for all geometry elements of GML. This includes pre-defined and user-defined geometry elements. Any geometry element shall be a direct or indirect extension/restriction of AbstractGeometryType and shall be directly or indirectly in the substitution group of AbstractGeometry.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.aixm.CurveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link ElevatedCurveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link ElevatedPointType }{@code >}
     *     {@link JAXBElement }{@code <}{@link ElevatedSurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.aixm.PointType }{@code >}
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.aixm.SurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractCurveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractGeometricAggregateType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractGeometricPrimitiveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractGeometryType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractGeometryType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractRingType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractSolidType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractSurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link CompositeCurveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link CompositeSolidType }{@code >}
     *     {@link JAXBElement }{@code <}{@link CompositeSurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.org.gml.CurveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link GeometricComplexType }{@code >}
     *     {@link JAXBElement }{@code <}{@link GridType }{@code >}
     *     {@link JAXBElement }{@code <}{@link LineStringType }{@code >}
     *     {@link JAXBElement }{@code <}{@link LinearRingType }{@code >}
     *     {@link JAXBElement }{@code <}{@link MultiCurveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link MultiGeometryType }{@code >}
     *     {@link JAXBElement }{@code <}{@link MultiPointType }{@code >}
     *     {@link JAXBElement }{@code <}{@link MultiSolidType }{@code >}
     *     {@link JAXBElement }{@code <}{@link MultiSurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link OrientableCurveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link OrientableSurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.org.gml.PointType }{@code >}
     *     {@link JAXBElement }{@code <}{@link PolygonType }{@code >}
     *     {@link JAXBElement }{@code <}{@link RectifiedGridType }{@code >}
     *     {@link JAXBElement }{@code <}{@link RingType }{@code >}
     *     {@link JAXBElement }{@code <}{@link ShellType }{@code >}
     *     {@link JAXBElement }{@code <}{@link SolidType }{@code >}
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.org.gml.SurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.org.gml.SurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.org.gml.SurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link TinType }{@code >}
     *     
     */
    public JAXBElement<? extends AbstractGeometryType> getAbstractGeometry() {
        return abstractGeometry;
    }

    /**
     * Sets the value of the abstractGeometry property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.aixm.CurveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link ElevatedCurveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link ElevatedPointType }{@code >}
     *     {@link JAXBElement }{@code <}{@link ElevatedSurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.aixm.PointType }{@code >}
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.aixm.SurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractCurveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractGeometricAggregateType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractGeometricPrimitiveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractGeometryType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractGeometryType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractRingType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractSolidType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractSurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link CompositeCurveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link CompositeSolidType }{@code >}
     *     {@link JAXBElement }{@code <}{@link CompositeSurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.org.gml.CurveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link GeometricComplexType }{@code >}
     *     {@link JAXBElement }{@code <}{@link GridType }{@code >}
     *     {@link JAXBElement }{@code <}{@link LineStringType }{@code >}
     *     {@link JAXBElement }{@code <}{@link LinearRingType }{@code >}
     *     {@link JAXBElement }{@code <}{@link MultiCurveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link MultiGeometryType }{@code >}
     *     {@link JAXBElement }{@code <}{@link MultiPointType }{@code >}
     *     {@link JAXBElement }{@code <}{@link MultiSolidType }{@code >}
     *     {@link JAXBElement }{@code <}{@link MultiSurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link OrientableCurveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link OrientableSurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.org.gml.PointType }{@code >}
     *     {@link JAXBElement }{@code <}{@link PolygonType }{@code >}
     *     {@link JAXBElement }{@code <}{@link RectifiedGridType }{@code >}
     *     {@link JAXBElement }{@code <}{@link RingType }{@code >}
     *     {@link JAXBElement }{@code <}{@link ShellType }{@code >}
     *     {@link JAXBElement }{@code <}{@link SolidType }{@code >}
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.org.gml.SurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.org.gml.SurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.org.gml.SurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link TinType }{@code >}
     *     
     * @see #getAbstractGeometry()
     */
    public void setAbstractGeometry(JAXBElement<? extends AbstractGeometryType> value) {
        this.abstractGeometry = value;
    }

    public boolean isSetAbstractGeometry() {
        return (this.abstractGeometry!= null);
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