//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.schema.a5_1_1.org.gmd;

import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Java class for EX_GeographicDescription_Type complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="EX_GeographicDescription_Type">
 *   <complexContent>
 *     <extension base="{http://www.isotc211.org/2005/gmd}AbstractEX_GeographicExtent_Type">
 *       <sequence>
 *         <element name="geographicIdentifier" type="{http://www.isotc211.org/2005/gmd}MD_Identifier_PropertyType"/>
 *       </sequence>
 *     </extension>
 *   </complexContent>
 * </complexType>
 * }</pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "EX_GeographicDescription_Type", propOrder = {
    "geographicIdentifier"
})
public class EXGeographicDescriptionType
    extends AbstractEXGeographicExtentType
{

    @XmlElement(required = true)
    protected MDIdentifierPropertyType geographicIdentifier;

    /**
     * Gets the value of the geographicIdentifier property.
     * 
     * @return
     *     possible object is
     *     {@link MDIdentifierPropertyType }
     *     
     */
    public MDIdentifierPropertyType getGeographicIdentifier() {
        return geographicIdentifier;
    }

    /**
     * Sets the value of the geographicIdentifier property.
     * 
     * @param value
     *     allowed object is
     *     {@link MDIdentifierPropertyType }
     *     
     */
    public void setGeographicIdentifier(MDIdentifierPropertyType value) {
        this.geographicIdentifier = value;
    }

    public boolean isSetGeographicIdentifier() {
        return (this.geographicIdentifier!= null);
    }

}