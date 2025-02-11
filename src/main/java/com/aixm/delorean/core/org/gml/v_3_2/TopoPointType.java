//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.org.gml.v_3_2;

import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Java class for TopoPointType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="TopoPointType">
 *   <complexContent>
 *     <extension base="{http://www.opengis.net/gml/3.2}AbstractTopologyType">
 *       <sequence>
 *         <element ref="{http://www.opengis.net/gml/3.2}directedNode"/>
 *       </sequence>
 *     </extension>
 *   </complexContent>
 * </complexType>
 * }</pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "TopoPointType", propOrder = {
    "directedNode"
})
public class TopoPointType
    extends AbstractTopologyType
{

    /**
     * A gml:directedNode property element describes the boundary of topology edges and is used in the support of topological point features via the gml:TopoPoint expression, see below. The orientation attribute of type gml:SignType expresses the sense in which the included node is used: start (“-“) or end (“+”) node.
     * 
     */
    @XmlElement(required = true)
    protected DirectedNodePropertyType directedNode;

    /**
     * A gml:directedNode property element describes the boundary of topology edges and is used in the support of topological point features via the gml:TopoPoint expression, see below. The orientation attribute of type gml:SignType expresses the sense in which the included node is used: start (“-“) or end (“+”) node.
     * 
     * @return
     *     possible object is
     *     {@link DirectedNodePropertyType }
     *     
     */
    public DirectedNodePropertyType getDirectedNode() {
        return directedNode;
    }

    /**
     * Sets the value of the directedNode property.
     * 
     * @param value
     *     allowed object is
     *     {@link DirectedNodePropertyType }
     *     
     * @see #getDirectedNode()
     */
    public void setDirectedNode(DirectedNodePropertyType value) {
        this.directedNode = value;
    }

    public boolean isSetDirectedNode() {
        return (this.directedNode!= null);
    }

}
