//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.org.gmd.v2007;

import com.aixm.delorean.core.org.gco.v2007.AbstractObjectType;
import com.aixm.delorean.core.org.gco.v2007.CharacterStringPropertyType;
import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlType;


/**
 * Graphic that provides an illustration of the dataset (should include a legend for the graphic)
 * 
 * <p>Java class for MD_BrowseGraphic_Type complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="MD_BrowseGraphic_Type">
 *   <complexContent>
 *     <extension base="{http://www.isotc211.org/2005/gco}AbstractObject_Type">
 *       <sequence>
 *         <element name="fileName" type="{http://www.isotc211.org/2005/gco}CharacterString_PropertyType"/>
 *         <element name="fileDescription" type="{http://www.isotc211.org/2005/gco}CharacterString_PropertyType" minOccurs="0"/>
 *         <element name="fileType" type="{http://www.isotc211.org/2005/gco}CharacterString_PropertyType" minOccurs="0"/>
 *       </sequence>
 *     </extension>
 *   </complexContent>
 * </complexType>
 * }</pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "MD_BrowseGraphic_Type", propOrder = {
    "fileName",
    "fileDescription",
    "fileType"
})
public class MDBrowseGraphicType
    extends AbstractObjectType
{

    @XmlElement(required = true)
    protected CharacterStringPropertyType fileName;
    protected CharacterStringPropertyType fileDescription;
    protected CharacterStringPropertyType fileType;

    /**
     * Gets the value of the fileName property.
     * 
     * @return
     *     possible object is
     *     {@link CharacterStringPropertyType }
     *     
     */
    public CharacterStringPropertyType getFileName() {
        return fileName;
    }

    /**
     * Sets the value of the fileName property.
     * 
     * @param value
     *     allowed object is
     *     {@link CharacterStringPropertyType }
     *     
     */
    public void setFileName(CharacterStringPropertyType value) {
        this.fileName = value;
    }

    public boolean isSetFileName() {
        return (this.fileName!= null);
    }

    /**
     * Gets the value of the fileDescription property.
     * 
     * @return
     *     possible object is
     *     {@link CharacterStringPropertyType }
     *     
     */
    public CharacterStringPropertyType getFileDescription() {
        return fileDescription;
    }

    /**
     * Sets the value of the fileDescription property.
     * 
     * @param value
     *     allowed object is
     *     {@link CharacterStringPropertyType }
     *     
     */
    public void setFileDescription(CharacterStringPropertyType value) {
        this.fileDescription = value;
    }

    public boolean isSetFileDescription() {
        return (this.fileDescription!= null);
    }

    /**
     * Gets the value of the fileType property.
     * 
     * @return
     *     possible object is
     *     {@link CharacterStringPropertyType }
     *     
     */
    public CharacterStringPropertyType getFileType() {
        return fileType;
    }

    /**
     * Sets the value of the fileType property.
     * 
     * @param value
     *     allowed object is
     *     {@link CharacterStringPropertyType }
     *     
     */
    public void setFileType(CharacterStringPropertyType value) {
        this.fileType = value;
    }

    public boolean isSetFileType() {
        return (this.fileType!= null);
    }

}
