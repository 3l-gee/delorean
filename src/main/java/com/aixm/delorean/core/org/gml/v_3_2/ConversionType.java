//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.org.gml.v_3_2;

import java.util.ArrayList;
import java.util.List;
import jakarta.xml.bind.JAXBElement;
import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlElementRef;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Java class for ConversionType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="ConversionType">
 *   <complexContent>
 *     <extension base="{http://www.opengis.net/gml/3.2}AbstractGeneralConversionType">
 *       <sequence>
 *         <element ref="{http://www.opengis.net/gml/3.2}method"/>
 *         <element ref="{http://www.opengis.net/gml/3.2}parameterValue" maxOccurs="unbounded" minOccurs="0"/>
 *       </sequence>
 *     </extension>
 *   </complexContent>
 * </complexType>
 * }</pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "ConversionType", propOrder = {
    "method",
    "parameterValue"
})
public class ConversionType
    extends AbstractGeneralConversionType
{

    /**
     * gml:method is an association role to the operation method used by a coordinate operation.
     * 
     */
    @XmlElementRef(name = "method", namespace = "http://www.opengis.net/gml/3.2", type = JAXBElement.class)
    protected JAXBElement<OperationMethodPropertyType> method;
    /**
     * gml:parameterValue is a composition association to a parameter value or group of parameter values used by a coordinate operation.
     * 
     */
    @XmlElementRef(name = "parameterValue", namespace = "http://www.opengis.net/gml/3.2", type = JAXBElement.class, required = false)
    protected List<JAXBElement<AbstractGeneralParameterValuePropertyType>> parameterValue;

    /**
     * gml:method is an association role to the operation method used by a coordinate operation.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link OperationMethodPropertyType }{@code >}
     *     {@link JAXBElement }{@code <}{@link OperationMethodPropertyType }{@code >}
     *     
     */
    public JAXBElement<OperationMethodPropertyType> getMethod() {
        return method;
    }

    /**
     * Sets the value of the method property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link OperationMethodPropertyType }{@code >}
     *     {@link JAXBElement }{@code <}{@link OperationMethodPropertyType }{@code >}
     *     
     * @see #getMethod()
     */
    public void setMethod(JAXBElement<OperationMethodPropertyType> value) {
        this.method = value;
    }

    public boolean isSetMethod() {
        return (this.method!= null);
    }

    /**
     * gml:parameterValue is a composition association to a parameter value or group of parameter values used by a coordinate operation.
     * 
     * Gets the value of the parameterValue property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the parameterValue property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getParameterValue().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link JAXBElement }{@code <}{@link AbstractGeneralParameterValuePropertyType }{@code >}
     * {@link JAXBElement }{@code <}{@link AbstractGeneralParameterValuePropertyType }{@code >}
     * {@link JAXBElement }{@code <}{@link AbstractGeneralParameterValuePropertyType }{@code >}
     * </p>
     * 
     * 
     * @return
     *     The value of the parameterValue property.
     */
    public List<JAXBElement<AbstractGeneralParameterValuePropertyType>> getParameterValue() {
        if (parameterValue == null) {
            parameterValue = new ArrayList<>();
        }
        return this.parameterValue;
    }

    public boolean isSetParameterValue() {
        return ((this.parameterValue!= null)&&(!this.parameterValue.isEmpty()));
    }

    public void unsetParameterValue() {
        this.parameterValue = null;
    }

}
