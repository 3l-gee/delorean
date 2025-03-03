//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.org.gmd.v2007;

import java.util.ArrayList;
import java.util.List;
import com.aixm.delorean.core.org.gco.v2007.CharacterStringPropertyType;
import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Java class for MD_DataIdentification_Type complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="MD_DataIdentification_Type">
 *   <complexContent>
 *     <extension base="{http://www.isotc211.org/2005/gmd}AbstractMD_Identification_Type">
 *       <sequence>
 *         <element name="spatialRepresentationType" type="{http://www.isotc211.org/2005/gmd}MD_SpatialRepresentationTypeCode_PropertyType" maxOccurs="unbounded" minOccurs="0"/>
 *         <element name="spatialResolution" type="{http://www.isotc211.org/2005/gmd}MD_Resolution_PropertyType" maxOccurs="unbounded" minOccurs="0"/>
 *         <element name="language" type="{http://www.isotc211.org/2005/gco}CharacterString_PropertyType" maxOccurs="unbounded"/>
 *         <element name="characterSet" type="{http://www.isotc211.org/2005/gmd}MD_CharacterSetCode_PropertyType" maxOccurs="unbounded" minOccurs="0"/>
 *         <element name="topicCategory" type="{http://www.isotc211.org/2005/gmd}MD_TopicCategoryCode_PropertyType" maxOccurs="unbounded" minOccurs="0"/>
 *         <element name="environmentDescription" type="{http://www.isotc211.org/2005/gco}CharacterString_PropertyType" minOccurs="0"/>
 *         <element name="extent" type="{http://www.isotc211.org/2005/gmd}EX_Extent_PropertyType" maxOccurs="unbounded" minOccurs="0"/>
 *         <element name="supplementalInformation" type="{http://www.isotc211.org/2005/gco}CharacterString_PropertyType" minOccurs="0"/>
 *       </sequence>
 *     </extension>
 *   </complexContent>
 * </complexType>
 * }</pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "MD_DataIdentification_Type", propOrder = {
    "spatialRepresentationType",
    "spatialResolution",
    "language",
    "characterSet",
    "topicCategory",
    "environmentDescription",
    "extent",
    "supplementalInformation"
})
public class MDDataIdentificationType
    extends AbstractMDIdentificationType
{

    protected List<MDSpatialRepresentationTypeCodePropertyType> spatialRepresentationType;
    protected List<MDResolutionPropertyType> spatialResolution;
    @XmlElement(required = true)
    protected List<CharacterStringPropertyType> language;
    protected List<MDCharacterSetCodePropertyType> characterSet;
    protected List<MDTopicCategoryCodePropertyType> topicCategory;
    protected CharacterStringPropertyType environmentDescription;
    protected List<EXExtentPropertyType> extent;
    protected CharacterStringPropertyType supplementalInformation;

    /**
     * Gets the value of the spatialRepresentationType property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the spatialRepresentationType property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getSpatialRepresentationType().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link MDSpatialRepresentationTypeCodePropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the spatialRepresentationType property.
     */
    public List<MDSpatialRepresentationTypeCodePropertyType> getSpatialRepresentationType() {
        if (spatialRepresentationType == null) {
            spatialRepresentationType = new ArrayList<>();
        }
        return this.spatialRepresentationType;
    }

    public boolean isSetSpatialRepresentationType() {
        return ((this.spatialRepresentationType!= null)&&(!this.spatialRepresentationType.isEmpty()));
    }

    public void unsetSpatialRepresentationType() {
        this.spatialRepresentationType = null;
    }

    /**
     * Gets the value of the spatialResolution property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the spatialResolution property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getSpatialResolution().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link MDResolutionPropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the spatialResolution property.
     */
    public List<MDResolutionPropertyType> getSpatialResolution() {
        if (spatialResolution == null) {
            spatialResolution = new ArrayList<>();
        }
        return this.spatialResolution;
    }

    public boolean isSetSpatialResolution() {
        return ((this.spatialResolution!= null)&&(!this.spatialResolution.isEmpty()));
    }

    public void unsetSpatialResolution() {
        this.spatialResolution = null;
    }

    /**
     * Gets the value of the language property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the language property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getLanguage().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link CharacterStringPropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the language property.
     */
    public List<CharacterStringPropertyType> getLanguage() {
        if (language == null) {
            language = new ArrayList<>();
        }
        return this.language;
    }

    public boolean isSetLanguage() {
        return ((this.language!= null)&&(!this.language.isEmpty()));
    }

    public void unsetLanguage() {
        this.language = null;
    }

    /**
     * Gets the value of the characterSet property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the characterSet property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getCharacterSet().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link MDCharacterSetCodePropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the characterSet property.
     */
    public List<MDCharacterSetCodePropertyType> getCharacterSet() {
        if (characterSet == null) {
            characterSet = new ArrayList<>();
        }
        return this.characterSet;
    }

    public boolean isSetCharacterSet() {
        return ((this.characterSet!= null)&&(!this.characterSet.isEmpty()));
    }

    public void unsetCharacterSet() {
        this.characterSet = null;
    }

    /**
     * Gets the value of the topicCategory property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the topicCategory property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getTopicCategory().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link MDTopicCategoryCodePropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the topicCategory property.
     */
    public List<MDTopicCategoryCodePropertyType> getTopicCategory() {
        if (topicCategory == null) {
            topicCategory = new ArrayList<>();
        }
        return this.topicCategory;
    }

    public boolean isSetTopicCategory() {
        return ((this.topicCategory!= null)&&(!this.topicCategory.isEmpty()));
    }

    public void unsetTopicCategory() {
        this.topicCategory = null;
    }

    /**
     * Gets the value of the environmentDescription property.
     * 
     * @return
     *     possible object is
     *     {@link CharacterStringPropertyType }
     *     
     */
    public CharacterStringPropertyType getEnvironmentDescription() {
        return environmentDescription;
    }

    /**
     * Sets the value of the environmentDescription property.
     * 
     * @param value
     *     allowed object is
     *     {@link CharacterStringPropertyType }
     *     
     */
    public void setEnvironmentDescription(CharacterStringPropertyType value) {
        this.environmentDescription = value;
    }

    public boolean isSetEnvironmentDescription() {
        return (this.environmentDescription!= null);
    }

    /**
     * Gets the value of the extent property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the extent property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getExtent().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link EXExtentPropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the extent property.
     */
    public List<EXExtentPropertyType> getExtent() {
        if (extent == null) {
            extent = new ArrayList<>();
        }
        return this.extent;
    }

    public boolean isSetExtent() {
        return ((this.extent!= null)&&(!this.extent.isEmpty()));
    }

    public void unsetExtent() {
        this.extent = null;
    }

    /**
     * Gets the value of the supplementalInformation property.
     * 
     * @return
     *     possible object is
     *     {@link CharacterStringPropertyType }
     *     
     */
    public CharacterStringPropertyType getSupplementalInformation() {
        return supplementalInformation;
    }

    /**
     * Sets the value of the supplementalInformation property.
     * 
     * @param value
     *     allowed object is
     *     {@link CharacterStringPropertyType }
     *     
     */
    public void setSupplementalInformation(CharacterStringPropertyType value) {
        this.supplementalInformation = value;
    }

    public boolean isSetSupplementalInformation() {
        return (this.supplementalInformation!= null);
    }

}
