//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.org.gml.v_3_2;

import jakarta.xml.bind.JAXBElement;
import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlElementRef;
import jakarta.xml.bind.annotation.XmlSeeAlso;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Java class for AbstractGeneralDerivedCRSType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="AbstractGeneralDerivedCRSType">
 *   <complexContent>
 *     <extension base="{http://www.opengis.net/gml/3.2}AbstractCRSType">
 *       <sequence>
 *         <element ref="{http://www.opengis.net/gml/3.2}conversion"/>
 *       </sequence>
 *     </extension>
 *   </complexContent>
 * </complexType>
 * }</pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "AbstractGeneralDerivedCRSType", propOrder = {
    "conversion"
})
@XmlSeeAlso({
    ProjectedCRSType.class,
    DerivedCRSType.class
})
public abstract class AbstractGeneralDerivedCRSType
    extends AbstractCRSType
{

    /**
     * gml:conversion is an association role to the coordinate conversion used to define the derived CRS.
     * 
     */
    @XmlElementRef(name = "conversion", namespace = "http://www.opengis.net/gml/3.2", type = JAXBElement.class)
    protected JAXBElement<GeneralConversionPropertyType> conversion;

    /**
     * gml:conversion is an association role to the coordinate conversion used to define the derived CRS.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link GeneralConversionPropertyType }{@code >}
     *     {@link JAXBElement }{@code <}{@link GeneralConversionPropertyType }{@code >}
     *     
     */
    public JAXBElement<GeneralConversionPropertyType> getConversion() {
        return conversion;
    }

    /**
     * Sets the value of the conversion property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link GeneralConversionPropertyType }{@code >}
     *     {@link JAXBElement }{@code <}{@link GeneralConversionPropertyType }{@code >}
     *     
     * @see #getConversion()
     */
    public void setConversion(JAXBElement<GeneralConversionPropertyType> value) {
        this.conversion = value;
    }

    public boolean isSetConversion() {
        return (this.conversion!= null);
    }

}
