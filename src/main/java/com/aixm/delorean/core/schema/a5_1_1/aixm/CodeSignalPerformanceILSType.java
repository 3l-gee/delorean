//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.schema.a5_1_1.aixm;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlAttribute;
import jakarta.xml.bind.annotation.XmlType;
import jakarta.xml.bind.annotation.XmlValue;


/**
 * <p>Java class for CodeSignalPerformanceILSType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="CodeSignalPerformanceILSType">
 *   <simpleContent>
 *     <extension base="<http://www.aixm.aero/schema/5.1.1>CodeSignalPerformanceILSBaseType">
 *       <attribute name="nilReason" type="{http://www.opengis.net/gml/3.2}NilReasonEnumeration" />
 *     </extension>
 *   </simpleContent>
 * </complexType>
 * }</pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "CodeSignalPerformanceILSType", propOrder = {
    "value"
})
@Embeddable
public class CodeSignalPerformanceILSType {

    @XmlValue
    protected CodeSignalPerformanceILSBaseType value;
    @XmlAttribute(name = "nilReason")
    @Column(name = "code_signal_performance_ils_base_type_nil_reason")
    protected String nilReason;

    /**
     * Gets the value of the value property.
     * 
     * @return
     *     possible object is
     *     {@link CodeSignalPerformanceILSBaseType }
     *     
     */
    public CodeSignalPerformanceILSBaseType getValue() {
        return value;
    }

    /**
     * Sets the value of the value property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeSignalPerformanceILSBaseType }
     *     
     */
    public void setValue(CodeSignalPerformanceILSBaseType value) {
        this.value = value;
    }

    public boolean isSetValue() {
        return (this.value!= null);
    }

    /**
     * Gets the value of the nilReason property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getNilReason() {
        return nilReason;
    }

    /**
     * Sets the value of the nilReason property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setNilReason(String value) {
        this.nilReason = value;
    }

    public boolean isSetNilReason() {
        return (this.nilReason!= null);
    }

}