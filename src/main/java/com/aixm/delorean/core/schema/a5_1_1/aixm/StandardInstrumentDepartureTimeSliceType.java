//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.schema.a5_1_1.aixm;

import java.util.ArrayList;
import java.util.List;
import jakarta.persistence.AttributeOverride;
import jakarta.persistence.AttributeOverrides;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Embedded;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlAttribute;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Java class for StandardInstrumentDepartureTimeSliceType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="StandardInstrumentDepartureTimeSliceType">
 *   <complexContent>
 *     <extension base="{http://www.aixm.aero/schema/5.1.1}AbstractAIXMTimeSliceType">
 *       <sequence>
 *         <group ref="{http://www.aixm.aero/schema/5.1.1}StandardInstrumentDeparturePropertyGroup"/>
 *         <element name="extension" maxOccurs="unbounded" minOccurs="0">
 *           <complexType>
 *             <complexContent>
 *               <restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                 <choice>
 *                   <element ref="{http://www.aixm.aero/schema/5.1.1}AbstractStandardInstrumentDepartureExtension"/>
 *                   <element ref="{http://www.aixm.aero/schema/5.1.1}AbstractProcedureExtension"/>
 *                 </choice>
 *                 <attGroup ref="{http://www.opengis.net/gml/3.2}OwnershipAttributeGroup"/>
 *               </restriction>
 *             </complexContent>
 *           </complexType>
 *         </element>
 *       </sequence>
 *     </extension>
 *   </complexContent>
 * </complexType>
 * }</pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "StandardInstrumentDepartureTimeSliceType", propOrder = {
    "communicationFailureInstruction",
    "instruction",
    "designCriteria",
    "codingStandard",
    "flightChecked",
    "aixmName",
    "rnav",
    "availability",
    "airportHeliport",
    "aircraftCharacteristic",
    "flightTransition",
    "guidanceFacilitySpecialNavigationSystem",
    "guidanceFacilityRadar",
    "guidanceFacilityNavaid",
    "annotation",
    "safeAltitude",
    "designator",
    "contingencyRoute",
    "takeoff",
    "extension"
})
@Entity
@Table(name = "standardinstrumentdeparture_ts", schema = "procedure")
public class StandardInstrumentDepartureTimeSliceType
    extends AbstractAIXMTimeSliceType
{

    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "communicationfailureinstruction_value", length = 10000, columnDefinition = "TEXT", nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "communicationfailureinstruction_nilreason", length = 255, nullable = true, unique = false))
    })
    protected TextInstructionType communicationFailureInstruction;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "instruction_value", length = 10000, columnDefinition = "TEXT", nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "instruction_nilreason", length = 255, nullable = true, unique = false))
    })
    protected TextInstructionType instruction;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "designcriteria_value", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "designcriteria_nilreason", length = 255, nullable = true, unique = false))
    })
    protected CodeDesignStandardType designCriteria;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "codingstandard_value", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "codingstandard_nilreason", length = 255, nullable = true, unique = false))
    })
    protected CodeProcedureCodingStandardType codingStandard;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "flightchecked_value", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "flightchecked_nilreason", length = 255, nullable = true, unique = false))
    })
    protected CodeYesNoType flightChecked;
    @XmlElement(name = "name", nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "name_value", length = 60, columnDefinition = "TEXT", nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "name_nilreason", length = 255, nullable = true, unique = false))
    })
    protected TextNameType aixmName;
    @XmlElement(name = "RNAV", nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "rnav_value", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "rnav_nilreason", length = 255, nullable = true, unique = false))
    })
    protected CodeYesNoType rnav;
    @XmlElement(nillable = true)
    @OneToMany(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinTable(name = "standardinstrumentdeparture_ts_availability", joinColumns = {
        @JoinColumn(name = "standardinstrumentdeparture_ts_id")
    }, inverseJoinColumns = {
        @JoinColumn(name = "procedureavailability_pt_id")
    })
    protected List<ProcedureAvailabilityPropertyType> availability;
    @XmlElement(nillable = true)
    @OneToMany(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinTable(name = "standardinstrumentdeparture_ts_airportheliport", joinColumns = {
        @JoinColumn(name = "standardinstrumentdeparture_ts_id")
    }, inverseJoinColumns = {
        @JoinColumn(name = "airportheliport_pt_id")
    })
    protected List<AirportHeliportPropertyType> airportHeliport;
    @XmlElement(nillable = true)
    @OneToMany(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinTable(name = "standardinstrumentdeparture_ts_aircraftcharacteristic", joinColumns = {
        @JoinColumn(name = "standardinstrumentdeparture_ts_id")
    }, inverseJoinColumns = {
        @JoinColumn(name = "aircraftcharacteristic_pt_id")
    })
    protected List<AircraftCharacteristicPropertyType> aircraftCharacteristic;
    @XmlElement(nillable = true)
    @OneToMany(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinTable(name = "standardinstrumentdeparture_ts_flighttransition", joinColumns = {
        @JoinColumn(name = "standardinstrumentdeparture_ts_id")
    }, inverseJoinColumns = {
        @JoinColumn(name = "proceduretransition_pt_id")
    })
    protected List<ProcedureTransitionPropertyType> flightTransition;
    @XmlElement(name = "guidanceFacility_specialNavigationSystem", nillable = true)
    @OneToOne(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinColumn(name = "guidancefacility_specialnavigationsystem_id", referencedColumnName = "id")
    protected SpecialNavigationSystemPropertyType guidanceFacilitySpecialNavigationSystem;
    @XmlElement(name = "guidanceFacility_radar", nillable = true)
    @OneToOne(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinColumn(name = "guidancefacility_radar_id", referencedColumnName = "id")
    protected RadarSystemPropertyType guidanceFacilityRadar;
    @XmlElement(name = "guidanceFacility_navaid", nillable = true)
    @OneToOne(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinColumn(name = "guidancefacility_navaid_id", referencedColumnName = "id")
    protected NavaidPropertyType guidanceFacilityNavaid;
    @XmlElement(nillable = true)
    @OneToMany(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinTable(name = "standardinstrumentdeparture_ts_annotation", joinColumns = {
        @JoinColumn(name = "standardinstrumentdeparture_ts_id")
    }, inverseJoinColumns = {
        @JoinColumn(name = "note_pt_id")
    })
    protected List<NotePropertyType> annotation;
    @XmlElement(nillable = true)
    @OneToOne(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinColumn(name = "safealtitude_id", referencedColumnName = "id")
    protected SafeAltitudeAreaPropertyType safeAltitude;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "designator_value", length = 7, columnDefinition = "TEXT", nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "designator_nilreason", length = 255, nullable = true, unique = false))
    })
    protected TextSIDSTARDesignatorType designator;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "contingencyroute_value", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "contingencyroute_nilreason", length = 255, nullable = true, unique = false))
    })
    protected CodeYesNoType contingencyRoute;
    @XmlElement(nillable = true)
    @OneToOne(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinColumn(name = "takeoff_id", referencedColumnName = "id")
    protected LandingTakeoffAreaCollectionPropertyType takeoff;
    @Transient
    protected List<StandardInstrumentDepartureTimeSliceType.Extension> extension;

    /**
     * Gets the value of the communicationFailureInstruction property.
     * 
     * @return
     *     possible object is
     *     {@link TextInstructionType }
     *     
     */
    public TextInstructionType getCommunicationFailureInstruction() {
        return communicationFailureInstruction;
    }

    /**
     * Sets the value of the communicationFailureInstruction property.
     * 
     * @param value
     *     allowed object is
     *     {@link TextInstructionType }
     *     
     */
    public void setCommunicationFailureInstruction(TextInstructionType value) {
        this.communicationFailureInstruction = value;
    }

    public boolean isSetCommunicationFailureInstruction() {
        return (this.communicationFailureInstruction!= null);
    }

    /**
     * Gets the value of the instruction property.
     * 
     * @return
     *     possible object is
     *     {@link TextInstructionType }
     *     
     */
    public TextInstructionType getInstruction() {
        return instruction;
    }

    /**
     * Sets the value of the instruction property.
     * 
     * @param value
     *     allowed object is
     *     {@link TextInstructionType }
     *     
     */
    public void setInstruction(TextInstructionType value) {
        this.instruction = value;
    }

    public boolean isSetInstruction() {
        return (this.instruction!= null);
    }

    /**
     * Gets the value of the designCriteria property.
     * 
     * @return
     *     possible object is
     *     {@link CodeDesignStandardType }
     *     
     */
    public CodeDesignStandardType getDesignCriteria() {
        return designCriteria;
    }

    /**
     * Sets the value of the designCriteria property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeDesignStandardType }
     *     
     */
    public void setDesignCriteria(CodeDesignStandardType value) {
        this.designCriteria = value;
    }

    public boolean isSetDesignCriteria() {
        return (this.designCriteria!= null);
    }

    /**
     * Gets the value of the codingStandard property.
     * 
     * @return
     *     possible object is
     *     {@link CodeProcedureCodingStandardType }
     *     
     */
    public CodeProcedureCodingStandardType getCodingStandard() {
        return codingStandard;
    }

    /**
     * Sets the value of the codingStandard property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeProcedureCodingStandardType }
     *     
     */
    public void setCodingStandard(CodeProcedureCodingStandardType value) {
        this.codingStandard = value;
    }

    public boolean isSetCodingStandard() {
        return (this.codingStandard!= null);
    }

    /**
     * Gets the value of the flightChecked property.
     * 
     * @return
     *     possible object is
     *     {@link CodeYesNoType }
     *     
     */
    public CodeYesNoType getFlightChecked() {
        return flightChecked;
    }

    /**
     * Sets the value of the flightChecked property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeYesNoType }
     *     
     */
    public void setFlightChecked(CodeYesNoType value) {
        this.flightChecked = value;
    }

    public boolean isSetFlightChecked() {
        return (this.flightChecked!= null);
    }

    /**
     * Gets the value of the aixmName property.
     * 
     * @return
     *     possible object is
     *     {@link TextNameType }
     *     
     */
    public TextNameType getAixmName() {
        return aixmName;
    }

    /**
     * Sets the value of the aixmName property.
     * 
     * @param value
     *     allowed object is
     *     {@link TextNameType }
     *     
     */
    public void setAixmName(TextNameType value) {
        this.aixmName = value;
    }

    public boolean isSetAixmName() {
        return (this.aixmName!= null);
    }

    /**
     * Gets the value of the rnav property.
     * 
     * @return
     *     possible object is
     *     {@link CodeYesNoType }
     *     
     */
    public CodeYesNoType getRNAV() {
        return rnav;
    }

    /**
     * Sets the value of the rnav property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeYesNoType }
     *     
     */
    public void setRNAV(CodeYesNoType value) {
        this.rnav = value;
    }

    public boolean isSetRNAV() {
        return (this.rnav!= null);
    }

    /**
     * Gets the value of the availability property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the availability property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getAvailability().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link ProcedureAvailabilityPropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the availability property.
     */
    public List<ProcedureAvailabilityPropertyType> getAvailability() {
        if (availability == null) {
            availability = new ArrayList<>();
        }
        return this.availability;
    }

    public boolean isSetAvailability() {
        return ((this.availability!= null)&&(!this.availability.isEmpty()));
    }

    public void unsetAvailability() {
        this.availability = null;
    }

    /**
     * Gets the value of the airportHeliport property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the airportHeliport property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getAirportHeliport().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link AirportHeliportPropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the airportHeliport property.
     */
    public List<AirportHeliportPropertyType> getAirportHeliport() {
        if (airportHeliport == null) {
            airportHeliport = new ArrayList<>();
        }
        return this.airportHeliport;
    }

    public boolean isSetAirportHeliport() {
        return ((this.airportHeliport!= null)&&(!this.airportHeliport.isEmpty()));
    }

    public void unsetAirportHeliport() {
        this.airportHeliport = null;
    }

    /**
     * Gets the value of the aircraftCharacteristic property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the aircraftCharacteristic property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getAircraftCharacteristic().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link AircraftCharacteristicPropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the aircraftCharacteristic property.
     */
    public List<AircraftCharacteristicPropertyType> getAircraftCharacteristic() {
        if (aircraftCharacteristic == null) {
            aircraftCharacteristic = new ArrayList<>();
        }
        return this.aircraftCharacteristic;
    }

    public boolean isSetAircraftCharacteristic() {
        return ((this.aircraftCharacteristic!= null)&&(!this.aircraftCharacteristic.isEmpty()));
    }

    public void unsetAircraftCharacteristic() {
        this.aircraftCharacteristic = null;
    }

    /**
     * Gets the value of the flightTransition property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the flightTransition property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getFlightTransition().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link ProcedureTransitionPropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the flightTransition property.
     */
    public List<ProcedureTransitionPropertyType> getFlightTransition() {
        if (flightTransition == null) {
            flightTransition = new ArrayList<>();
        }
        return this.flightTransition;
    }

    public boolean isSetFlightTransition() {
        return ((this.flightTransition!= null)&&(!this.flightTransition.isEmpty()));
    }

    public void unsetFlightTransition() {
        this.flightTransition = null;
    }

    /**
     * Gets the value of the guidanceFacilitySpecialNavigationSystem property.
     * 
     * @return
     *     possible object is
     *     {@link SpecialNavigationSystemPropertyType }
     *     
     */
    public SpecialNavigationSystemPropertyType getGuidanceFacilitySpecialNavigationSystem() {
        return guidanceFacilitySpecialNavigationSystem;
    }

    /**
     * Sets the value of the guidanceFacilitySpecialNavigationSystem property.
     * 
     * @param value
     *     allowed object is
     *     {@link SpecialNavigationSystemPropertyType }
     *     
     */
    public void setGuidanceFacilitySpecialNavigationSystem(SpecialNavigationSystemPropertyType value) {
        this.guidanceFacilitySpecialNavigationSystem = value;
    }

    public boolean isSetGuidanceFacilitySpecialNavigationSystem() {
        return (this.guidanceFacilitySpecialNavigationSystem!= null);
    }

    /**
     * Gets the value of the guidanceFacilityRadar property.
     * 
     * @return
     *     possible object is
     *     {@link RadarSystemPropertyType }
     *     
     */
    public RadarSystemPropertyType getGuidanceFacilityRadar() {
        return guidanceFacilityRadar;
    }

    /**
     * Sets the value of the guidanceFacilityRadar property.
     * 
     * @param value
     *     allowed object is
     *     {@link RadarSystemPropertyType }
     *     
     */
    public void setGuidanceFacilityRadar(RadarSystemPropertyType value) {
        this.guidanceFacilityRadar = value;
    }

    public boolean isSetGuidanceFacilityRadar() {
        return (this.guidanceFacilityRadar!= null);
    }

    /**
     * Gets the value of the guidanceFacilityNavaid property.
     * 
     * @return
     *     possible object is
     *     {@link NavaidPropertyType }
     *     
     */
    public NavaidPropertyType getGuidanceFacilityNavaid() {
        return guidanceFacilityNavaid;
    }

    /**
     * Sets the value of the guidanceFacilityNavaid property.
     * 
     * @param value
     *     allowed object is
     *     {@link NavaidPropertyType }
     *     
     */
    public void setGuidanceFacilityNavaid(NavaidPropertyType value) {
        this.guidanceFacilityNavaid = value;
    }

    public boolean isSetGuidanceFacilityNavaid() {
        return (this.guidanceFacilityNavaid!= null);
    }

    /**
     * Gets the value of the annotation property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the annotation property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getAnnotation().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link NotePropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the annotation property.
     */
    public List<NotePropertyType> getAnnotation() {
        if (annotation == null) {
            annotation = new ArrayList<>();
        }
        return this.annotation;
    }

    public boolean isSetAnnotation() {
        return ((this.annotation!= null)&&(!this.annotation.isEmpty()));
    }

    public void unsetAnnotation() {
        this.annotation = null;
    }

    /**
     * Gets the value of the safeAltitude property.
     * 
     * @return
     *     possible object is
     *     {@link SafeAltitudeAreaPropertyType }
     *     
     */
    public SafeAltitudeAreaPropertyType getSafeAltitude() {
        return safeAltitude;
    }

    /**
     * Sets the value of the safeAltitude property.
     * 
     * @param value
     *     allowed object is
     *     {@link SafeAltitudeAreaPropertyType }
     *     
     */
    public void setSafeAltitude(SafeAltitudeAreaPropertyType value) {
        this.safeAltitude = value;
    }

    public boolean isSetSafeAltitude() {
        return (this.safeAltitude!= null);
    }

    /**
     * Gets the value of the designator property.
     * 
     * @return
     *     possible object is
     *     {@link TextSIDSTARDesignatorType }
     *     
     */
    public TextSIDSTARDesignatorType getDesignator() {
        return designator;
    }

    /**
     * Sets the value of the designator property.
     * 
     * @param value
     *     allowed object is
     *     {@link TextSIDSTARDesignatorType }
     *     
     */
    public void setDesignator(TextSIDSTARDesignatorType value) {
        this.designator = value;
    }

    public boolean isSetDesignator() {
        return (this.designator!= null);
    }

    /**
     * Gets the value of the contingencyRoute property.
     * 
     * @return
     *     possible object is
     *     {@link CodeYesNoType }
     *     
     */
    public CodeYesNoType getContingencyRoute() {
        return contingencyRoute;
    }

    /**
     * Sets the value of the contingencyRoute property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeYesNoType }
     *     
     */
    public void setContingencyRoute(CodeYesNoType value) {
        this.contingencyRoute = value;
    }

    public boolean isSetContingencyRoute() {
        return (this.contingencyRoute!= null);
    }

    /**
     * Gets the value of the takeoff property.
     * 
     * @return
     *     possible object is
     *     {@link LandingTakeoffAreaCollectionPropertyType }
     *     
     */
    public LandingTakeoffAreaCollectionPropertyType getTakeoff() {
        return takeoff;
    }

    /**
     * Sets the value of the takeoff property.
     * 
     * @param value
     *     allowed object is
     *     {@link LandingTakeoffAreaCollectionPropertyType }
     *     
     */
    public void setTakeoff(LandingTakeoffAreaCollectionPropertyType value) {
        this.takeoff = value;
    }

    public boolean isSetTakeoff() {
        return (this.takeoff!= null);
    }

    /**
     * Gets the value of the extension property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the extension property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getExtension().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link StandardInstrumentDepartureTimeSliceType.Extension }
     * </p>
     * 
     * 
     * @return
     *     The value of the extension property.
     */
    public List<StandardInstrumentDepartureTimeSliceType.Extension> getExtension() {
        if (extension == null) {
            extension = new ArrayList<>();
        }
        return this.extension;
    }

    public boolean isSetExtension() {
        return ((this.extension!= null)&&(!this.extension.isEmpty()));
    }

    public void unsetExtension() {
        this.extension = null;
    }


    /**
     * <p>Java class for anonymous complex type</p>.
     * 
     * <p>The following schema fragment specifies the expected content contained within this class.</p>
     * 
     * <pre>{@code
     * <complexType>
     *   <complexContent>
     *     <restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
     *       <choice>
     *         <element ref="{http://www.aixm.aero/schema/5.1.1}AbstractStandardInstrumentDepartureExtension"/>
     *         <element ref="{http://www.aixm.aero/schema/5.1.1}AbstractProcedureExtension"/>
     *       </choice>
     *       <attGroup ref="{http://www.opengis.net/gml/3.2}OwnershipAttributeGroup"/>
     *     </restriction>
     *   </complexContent>
     * </complexType>
     * }</pre>
     * 
     * 
     */
    @XmlAccessorType(XmlAccessType.FIELD)
    @XmlType(name = "", propOrder = {
        "abstractStandardInstrumentDepartureExtension",
        "abstractProcedureExtension"
    })
    public static class Extension {

        @XmlElement(name = "AbstractStandardInstrumentDepartureExtension")
        @OneToOne(cascade = {
            CascadeType.ALL
        }, fetch = FetchType.EAGER)
        @JoinColumn(name = "abstractstandardinstrumentdepartureextension_id", referencedColumnName = "id")
        protected AbstractExtensionType abstractStandardInstrumentDepartureExtension;
        @XmlElement(name = "AbstractProcedureExtension")
        @OneToOne(cascade = {
            CascadeType.ALL
        }, fetch = FetchType.EAGER)
        @JoinColumn(name = "abstractprocedureextension_id", referencedColumnName = "id")
        protected AbstractExtensionType abstractProcedureExtension;
        @XmlAttribute(name = "owns")
        @Transient
        protected Boolean owns;

        /**
         * Gets the value of the abstractStandardInstrumentDepartureExtension property.
         * 
         * @return
         *     possible object is
         *     {@link AbstractExtensionType }
         *     
         */
        public AbstractExtensionType getAbstractStandardInstrumentDepartureExtension() {
            return abstractStandardInstrumentDepartureExtension;
        }

        /**
         * Sets the value of the abstractStandardInstrumentDepartureExtension property.
         * 
         * @param value
         *     allowed object is
         *     {@link AbstractExtensionType }
         *     
         */
        public void setAbstractStandardInstrumentDepartureExtension(AbstractExtensionType value) {
            this.abstractStandardInstrumentDepartureExtension = value;
        }

        public boolean isSetAbstractStandardInstrumentDepartureExtension() {
            return (this.abstractStandardInstrumentDepartureExtension!= null);
        }

        /**
         * Gets the value of the abstractProcedureExtension property.
         * 
         * @return
         *     possible object is
         *     {@link AbstractExtensionType }
         *     
         */
        public AbstractExtensionType getAbstractProcedureExtension() {
            return abstractProcedureExtension;
        }

        /**
         * Sets the value of the abstractProcedureExtension property.
         * 
         * @param value
         *     allowed object is
         *     {@link AbstractExtensionType }
         *     
         */
        public void setAbstractProcedureExtension(AbstractExtensionType value) {
            this.abstractProcedureExtension = value;
        }

        public boolean isSetAbstractProcedureExtension() {
            return (this.abstractProcedureExtension!= null);
        }

        /**
         * Gets the value of the owns property.
         * 
         * @return
         *     possible object is
         *     {@link Boolean }
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
         *     {@link Boolean }
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

}
