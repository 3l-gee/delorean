//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.org.gmd.v2007;

import java.util.ArrayList;
import java.util.List;
import com.aixm.delorean.core.org.gco.v2007.AbstractObjectType;
import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlType;


/**
 * Information identifing the portrayal catalogue used
 * 
 * <p>Java class for MD_PortrayalCatalogueReference_Type complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="MD_PortrayalCatalogueReference_Type">
 *   <complexContent>
 *     <extension base="{http://www.isotc211.org/2005/gco}AbstractObject_Type">
 *       <sequence>
 *         <element name="portrayalCatalogueCitation" type="{http://www.isotc211.org/2005/gmd}CI_Citation_PropertyType" maxOccurs="unbounded"/>
 *       </sequence>
 *     </extension>
 *   </complexContent>
 * </complexType>
 * }</pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "MD_PortrayalCatalogueReference_Type", propOrder = {
    "portrayalCatalogueCitation"
})
public class MDPortrayalCatalogueReferenceType
    extends AbstractObjectType
{

    @XmlElement(required = true)
    protected List<CICitationPropertyType> portrayalCatalogueCitation;

    /**
     * Gets the value of the portrayalCatalogueCitation property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the portrayalCatalogueCitation property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getPortrayalCatalogueCitation().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link CICitationPropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the portrayalCatalogueCitation property.
     */
    public List<CICitationPropertyType> getPortrayalCatalogueCitation() {
        if (portrayalCatalogueCitation == null) {
            portrayalCatalogueCitation = new ArrayList<>();
        }
        return this.portrayalCatalogueCitation;
    }

    public boolean isSetPortrayalCatalogueCitation() {
        return ((this.portrayalCatalogueCitation!= null)&&(!this.portrayalCatalogueCitation.isEmpty()));
    }

    public void unsetPortrayalCatalogueCitation() {
        this.portrayalCatalogueCitation = null;
    }

}
