//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.org.gml.v_3_2;

import java.util.ArrayList;
import java.util.List;
import com.aixm.delorean.core.schema.a5_1.aixm.ElevatedCurveType;
import com.aixm.delorean.core.schema.a5_1.aixm.ElevatedPointType;
import com.aixm.delorean.core.schema.a5_1.aixm.ElevatedSurfaceType;
import jakarta.persistence.Column;
import jakarta.persistence.Transient;
import jakarta.xml.bind.JAXBElement;
import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlAttribute;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlElementRef;
import jakarta.xml.bind.annotation.XmlList;
import jakarta.xml.bind.annotation.XmlSchemaType;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Java class for ValuePropertyType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="ValuePropertyType">
 *   <complexContent>
 *     <restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       <sequence minOccurs="0">
 *         <group ref="{http://www.opengis.net/gml/3.2}Value"/>
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
@XmlType(name = "ValuePropertyType", propOrder = {
    "abstractValue",
    "abstractGeometry",
    "abstractTimeObject",
    "_null"
})
public class ValuePropertyType {

    /**
     * gml:AbstractValue is an abstract element which acts as the head of a substitution group which contains gml:AbstractScalarValue, gml:AbstractScalarValueList, gml:CompositeValue and gml:ValueExtent, and (transitively) the elements in their substitution groups.
     * These elements may be used in an application schema as variables, so that in an XML instance document any member of its substitution group may occur.
     * 
     */
    @XmlElementRef(name = "AbstractValue", namespace = "http://www.opengis.net/gml/3.2", type = JAXBElement.class, required = false)
    protected JAXBElement<?> abstractValue;
    /**
     * The AbstractGeometry element is the abstract head of the substitution group for all geometry elements of GML. This includes pre-defined and user-defined geometry elements. Any geometry element shall be a direct or indirect extension/restriction of AbstractGeometryType and shall be directly or indirectly in the substitution group of AbstractGeometry.
     * 
     */
    @XmlElementRef(name = "AbstractGeometry", namespace = "http://www.opengis.net/gml/3.2", type = JAXBElement.class, required = false)
    protected JAXBElement<? extends AbstractGeometryType> abstractGeometry;
    /**
     * gml:AbstractTimeObject acts as the head of a substitution group for all temporal primitives and complexes.
     * 
     */
    @XmlElementRef(name = "AbstractTimeObject", namespace = "http://www.opengis.net/gml/3.2", type = JAXBElement.class, required = false)
    protected JAXBElement<? extends AbstractTimeObjectType> abstractTimeObject;
    @XmlList
    @XmlElement(name = "Null")
    protected List<String> _null;
    @XmlAttribute(name = "nilReason")
    @Column(name = "nilReason")
    protected List<String> nilReason;
    @XmlAttribute(name = "remoteSchema", namespace = "http://www.opengis.net/gml/3.2")
    @XmlSchemaType(name = "anyURI")
    @Transient
    protected String remoteSchema;
    @XmlAttribute(name = "type", namespace = "http://www.w3.org/1999/xlink")
    public static final String TYPE = "simple";
    @XmlAttribute(name = "href", namespace = "http://www.w3.org/1999/xlink")
    @XmlSchemaType(name = "anyURI")
    protected String href;
    @XmlAttribute(name = "role", namespace = "http://www.w3.org/1999/xlink")
    @XmlSchemaType(name = "anyURI")
    protected String role;
    @XmlAttribute(name = "arcrole", namespace = "http://www.w3.org/1999/xlink")
    @XmlSchemaType(name = "anyURI")
    protected String arcrole;
    @XmlAttribute(name = "title", namespace = "http://www.w3.org/1999/xlink")
    protected String title;
    /**
     * The 'show' attribute is used to communicate the desired presentation 
     *         of the ending resource on traversal from the starting resource; it's 
     *         value should be treated as follows: 
     *         new - load ending resource in a new window, frame, pane, or other 
     *               presentation context
     *         replace - load the resource in the same window, frame, pane, or 
     *                   other presentation context
     *         embed - load ending resource in place of the presentation of the 
     *                 starting resource
     *         other - behavior is unconstrained; examine other markup in the 
     *                 link for hints 
     *         none - behavior is unconstrained
     * 
     */
    @XmlAttribute(name = "show", namespace = "http://www.w3.org/1999/xlink")
    protected String show;
    /**
     * The 'actuate' attribute is used to communicate the desired timing 
     *         of traversal from the starting resource to the ending resource; 
     *         it's value should be treated as follows:
     *         onLoad - traverse to the ending resource immediately on loading 
     *                  the starting resource 
     *         onRequest - traverse from the starting resource to the ending 
     *                     resource only on a post-loading event triggered for 
     *                     this purpose 
     *         other - behavior is unconstrained; examine other markup in link 
     *                 for hints 
     *         none - behavior is unconstrained
     * 
     */
    @XmlAttribute(name = "actuate", namespace = "http://www.w3.org/1999/xlink")
    protected String actuate;
    @XmlAttribute(name = "owns")
    @Transient
    protected java.lang.Boolean owns;

    /**
     * gml:AbstractValue is an abstract element which acts as the head of a substitution group which contains gml:AbstractScalarValue, gml:AbstractScalarValueList, gml:CompositeValue and gml:ValueExtent, and (transitively) the elements in their substitution groups.
     * These elements may be used in an application schema as variables, so that in an XML instance document any member of its substitution group may occur.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.org.gml.v_3_2.Boolean }{@code >}
     *     {@link JAXBElement }{@code <}{@link Category }{@code >}
     *     {@link JAXBElement }{@code <}{@link CategoryExtentType }{@code >}
     *     {@link JAXBElement }{@code <}{@link CodeOrNilReasonListType }{@code >}
     *     {@link JAXBElement }{@code <}{@link CompositeValueType }{@code >}
     *     {@link JAXBElement }{@code <}{@link Count }{@code >}
     *     {@link JAXBElement }{@code <}{@link MeasureOrNilReasonListType }{@code >}
     *     {@link JAXBElement }{@code <}{@link Quantity }{@code >}
     *     {@link JAXBElement }{@code <}{@link QuantityExtentType }{@code >}
     *     {@link JAXBElement }{@code <}{@link ValueArrayType }{@code >}
     *     {@link JAXBElement }{@code <}{@link Object }{@code >}
     *     {@link JAXBElement }{@code <}{@link Object }{@code >}
     *     {@link JAXBElement }{@code <}{@link Object }{@code >}
     *     {@link JAXBElement }{@code <}{@link List }{@code <}{@link String }{@code >}{@code >}
     *     {@link JAXBElement }{@code <}{@link List }{@code <}{@link String }{@code >}{@code >}
     *     {@link JAXBElement }{@code <}{@link List }{@code <}{@link String }{@code >}{@code >}
     *     
     */
    public JAXBElement<?> getAbstractValue() {
        return abstractValue;
    }

    /**
     * Sets the value of the abstractValue property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.org.gml.v_3_2.Boolean }{@code >}
     *     {@link JAXBElement }{@code <}{@link Category }{@code >}
     *     {@link JAXBElement }{@code <}{@link CategoryExtentType }{@code >}
     *     {@link JAXBElement }{@code <}{@link CodeOrNilReasonListType }{@code >}
     *     {@link JAXBElement }{@code <}{@link CompositeValueType }{@code >}
     *     {@link JAXBElement }{@code <}{@link Count }{@code >}
     *     {@link JAXBElement }{@code <}{@link MeasureOrNilReasonListType }{@code >}
     *     {@link JAXBElement }{@code <}{@link Quantity }{@code >}
     *     {@link JAXBElement }{@code <}{@link QuantityExtentType }{@code >}
     *     {@link JAXBElement }{@code <}{@link ValueArrayType }{@code >}
     *     {@link JAXBElement }{@code <}{@link Object }{@code >}
     *     {@link JAXBElement }{@code <}{@link Object }{@code >}
     *     {@link JAXBElement }{@code <}{@link Object }{@code >}
     *     {@link JAXBElement }{@code <}{@link List }{@code <}{@link String }{@code >}{@code >}
     *     {@link JAXBElement }{@code <}{@link List }{@code <}{@link String }{@code >}{@code >}
     *     {@link JAXBElement }{@code <}{@link List }{@code <}{@link String }{@code >}{@code >}
     *     
     * @see #getAbstractValue()
     */
    public void setAbstractValue(JAXBElement<?> value) {
        this.abstractValue = value;
    }

    public boolean isSetAbstractValue() {
        return (this.abstractValue!= null);
    }

    /**
     * The AbstractGeometry element is the abstract head of the substitution group for all geometry elements of GML. This includes pre-defined and user-defined geometry elements. Any geometry element shall be a direct or indirect extension/restriction of AbstractGeometryType and shall be directly or indirectly in the substitution group of AbstractGeometry.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link AbstractCurveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractGeometricAggregateType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractGeometricPrimitiveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractGeometryType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractGeometryType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractSolidType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractSurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link CompositeCurveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link CompositeSolidType }{@code >}
     *     {@link JAXBElement }{@code <}{@link CompositeSurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.org.gml.v_3_2.CurveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link GeometricComplexType }{@code >}
     *     {@link JAXBElement }{@code <}{@link GridType }{@code >}
     *     {@link JAXBElement }{@code <}{@link LineStringType }{@code >}
     *     {@link JAXBElement }{@code <}{@link MultiCurveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link MultiGeometryType }{@code >}
     *     {@link JAXBElement }{@code <}{@link MultiPointType }{@code >}
     *     {@link JAXBElement }{@code <}{@link MultiSolidType }{@code >}
     *     {@link JAXBElement }{@code <}{@link MultiSurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link OrientableCurveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link OrientableSurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.org.gml.v_3_2.PointType }{@code >}
     *     {@link JAXBElement }{@code <}{@link PolygonType }{@code >}
     *     {@link JAXBElement }{@code <}{@link RectifiedGridType }{@code >}
     *     {@link JAXBElement }{@code <}{@link SolidType }{@code >}
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.org.gml.v_3_2.SurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.org.gml.v_3_2.SurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.org.gml.v_3_2.SurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link TinType }{@code >}
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.schema.a5_1.aixm.CurveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link ElevatedCurveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link ElevatedPointType }{@code >}
     *     {@link JAXBElement }{@code <}{@link ElevatedSurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.schema.a5_1.aixm.PointType }{@code >}
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.schema.a5_1.aixm.SurfaceType }{@code >}
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
     *     {@link JAXBElement }{@code <}{@link AbstractCurveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractGeometricAggregateType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractGeometricPrimitiveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractGeometryType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractGeometryType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractSolidType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractSurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link CompositeCurveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link CompositeSolidType }{@code >}
     *     {@link JAXBElement }{@code <}{@link CompositeSurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.org.gml.v_3_2.CurveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link GeometricComplexType }{@code >}
     *     {@link JAXBElement }{@code <}{@link GridType }{@code >}
     *     {@link JAXBElement }{@code <}{@link LineStringType }{@code >}
     *     {@link JAXBElement }{@code <}{@link MultiCurveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link MultiGeometryType }{@code >}
     *     {@link JAXBElement }{@code <}{@link MultiPointType }{@code >}
     *     {@link JAXBElement }{@code <}{@link MultiSolidType }{@code >}
     *     {@link JAXBElement }{@code <}{@link MultiSurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link OrientableCurveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link OrientableSurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.org.gml.v_3_2.PointType }{@code >}
     *     {@link JAXBElement }{@code <}{@link PolygonType }{@code >}
     *     {@link JAXBElement }{@code <}{@link RectifiedGridType }{@code >}
     *     {@link JAXBElement }{@code <}{@link SolidType }{@code >}
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.org.gml.v_3_2.SurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.org.gml.v_3_2.SurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.org.gml.v_3_2.SurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link TinType }{@code >}
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.schema.a5_1.aixm.CurveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link ElevatedCurveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link ElevatedPointType }{@code >}
     *     {@link JAXBElement }{@code <}{@link ElevatedSurfaceType }{@code >}
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.schema.a5_1.aixm.PointType }{@code >}
     *     {@link JAXBElement }{@code <}{@link com.aixm.delorean.core.schema.a5_1.aixm.SurfaceType }{@code >}
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
     * gml:AbstractTimeObject acts as the head of a substitution group for all temporal primitives and complexes.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link AbstractTimeComplexType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractTimeGeometricPrimitiveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractTimeObjectType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractTimePrimitiveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractTimeTopologyPrimitiveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link TimeEdgeType }{@code >}
     *     {@link JAXBElement }{@code <}{@link TimeInstantType }{@code >}
     *     {@link JAXBElement }{@code <}{@link TimeNodeType }{@code >}
     *     {@link JAXBElement }{@code <}{@link TimePeriodType }{@code >}
     *     {@link JAXBElement }{@code <}{@link TimeTopologyComplexType }{@code >}
     *     
     */
    public JAXBElement<? extends AbstractTimeObjectType> getAbstractTimeObject() {
        return abstractTimeObject;
    }

    /**
     * Sets the value of the abstractTimeObject property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link AbstractTimeComplexType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractTimeGeometricPrimitiveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractTimeObjectType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractTimePrimitiveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AbstractTimeTopologyPrimitiveType }{@code >}
     *     {@link JAXBElement }{@code <}{@link TimeEdgeType }{@code >}
     *     {@link JAXBElement }{@code <}{@link TimeInstantType }{@code >}
     *     {@link JAXBElement }{@code <}{@link TimeNodeType }{@code >}
     *     {@link JAXBElement }{@code <}{@link TimePeriodType }{@code >}
     *     {@link JAXBElement }{@code <}{@link TimeTopologyComplexType }{@code >}
     *     
     * @see #getAbstractTimeObject()
     */
    public void setAbstractTimeObject(JAXBElement<? extends AbstractTimeObjectType> value) {
        this.abstractTimeObject = value;
    }

    public boolean isSetAbstractTimeObject() {
        return (this.abstractTimeObject!= null);
    }

    /**
     * Gets the value of the null property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the null property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getNull().add(newItem);
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
     *     The value of the null property.
     */
    public List<String> getNull() {
        if (_null == null) {
            _null = new ArrayList<>();
        }
        return this._null;
    }

    public boolean isSetNull() {
        return ((this._null!= null)&&(!this._null.isEmpty()));
    }

    public void unsetNull() {
        this._null = null;
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
     * Gets the value of the title property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getTitle() {
        return title;
    }

    /**
     * Sets the value of the title property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setTitle(String value) {
        this.title = value;
    }

    public boolean isSetTitle() {
        return (this.title!= null);
    }

    /**
     * The 'show' attribute is used to communicate the desired presentation 
     *         of the ending resource on traversal from the starting resource; it's 
     *         value should be treated as follows: 
     *         new - load ending resource in a new window, frame, pane, or other 
     *               presentation context
     *         replace - load the resource in the same window, frame, pane, or 
     *                   other presentation context
     *         embed - load ending resource in place of the presentation of the 
     *                 starting resource
     *         other - behavior is unconstrained; examine other markup in the 
     *                 link for hints 
     *         none - behavior is unconstrained
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getShow() {
        return show;
    }

    /**
     * Sets the value of the show property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     * @see #getShow()
     */
    public void setShow(String value) {
        this.show = value;
    }

    public boolean isSetShow() {
        return (this.show!= null);
    }

    /**
     * The 'actuate' attribute is used to communicate the desired timing 
     *         of traversal from the starting resource to the ending resource; 
     *         it's value should be treated as follows:
     *         onLoad - traverse to the ending resource immediately on loading 
     *                  the starting resource 
     *         onRequest - traverse from the starting resource to the ending 
     *                     resource only on a post-loading event triggered for 
     *                     this purpose 
     *         other - behavior is unconstrained; examine other markup in link 
     *                 for hints 
     *         none - behavior is unconstrained
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getActuate() {
        return actuate;
    }

    /**
     * Sets the value of the actuate property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     * @see #getActuate()
     */
    public void setActuate(String value) {
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
