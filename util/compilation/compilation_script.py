import os
import re

adapters_config = []

rename_config = {
    "table_renaming" : {   
        "method" : f'(?<=@Table\(name = ")([^"]+)(?=", schema =)',
        "words" : [
            "airportgroundservice_pg",
            "navaidequipment_pg",
            "propertieswithschedule_pg",
            "segmentpoint_pg",
            "service_pg",
            "navaidequipment_pg",
            "propertieswithschedule_pg",
            "marking_pg",
            "groundlightsystem_pg",
            "procedure_pg",
            "segmentleg_pg",
            "airportheliportprotectionarea_pg",
            "runwaydirection_pg",
            "runwaycentrelinepoint_pg",
            "runway_pg",
            "runwayvisualrange_pg",
            "rulesprocedures_pg",
            "arrestinggear_pg",
            "usagecondition_pg",
            "aerialrefuellinganchor_pg",
            "aerialrefuelling_pg",
            "aerialrefuellingtrack_pg",
            "aeronauticalgroundlight_pg",
            "aircraftcharacteristic_pg",
            "surfacecontamination_pg",
            "aircraftstand_pg",
            "airportheliportavailability_pg",
            "airportheliportcollocation_pg",
            "airportheliport_pg",
            "airporthotspot_pg",
            "airspaceactivation_pg",
            "airspacebordercrossing_pg",
            "airspacegeometrycomponent_pg",
            "airspacelayerclass_pg",
            "airspacelayer_pg",
            "airspace_pg",
            "airspacevolumedependency_pg",
            "altimetersource_pg",
            "altitudeadjustment_pg",
            "angleindication_pg",
            "angleuse_pg",
            "approachaltitudetable_pg",
            "approachcondition_pg",
            "approachdistancetable_pg",
            "apronelement_pg",
            "apron_pg",
            "authorityforspecialnavigationstation_pg",
            "authorityforspecialnavigationsystem_pg",
            "callsigndetail_pg",
            "changeoverpoint_pg",
            "navigationsystemcheckpoint_pg",
            "navigationsystemcheckpoint_pg",
            "circlesector_pg",
            "circlingarea_pg",
            "city_pg",
            "conditioncombination_pg",
            "contactinformation_pg",
            "curve_pg",
            "deicingarea_pg",
            "departurearrivalcondition_pg",
            "departureleg_pg",
            "designatedpoint_pg",
            "directflight_pg",
            "verticalstructure_pg",
            "unit_pg",
            "unitdependency_pg",
            "touchdownliftoff_pg",
            "terminalarrivalarea_pg",
            "terminalarrivalareasector_pg",
            "taxiway_pg",
            "workarea_pg",
            "verticalstructurepart_pg",
            "unplannedholding_pg",
            "timesheet_pg",
            "taxiwayelement_pg",
            "taxiholdingposition_pg",
            "surveycontrolpoint_pg",
            "surveillancegroundstation_pg",
            "surfacecontaminationlayer_pg",
            "surfacecharacteristics_pg",
            "standardlevel_pg",
            "standardleveltable_pg",
            "standardlevelsector_pg",
            "standardlevelcolumn_pg",
            "specialnavigationsystem_pg",
            "specialnavigationstation_pg",
            "specialdate_pg",
            "sectordesign_pg",
            "surveillanceradar_pg",
            "radarequipment_pg",
            "seaplanerampsite_pg",
            "seaplanelandingarea_pgy",
            "safealtitudearea_pg",
            "safealtitudeareasector_pg", 
            "runwayelement_pg",
            "runwaydeclareddistance_pg",
            "runwayblastpad_pg",
            "runwayblastpad_pg",
            "road_pg",
            "pointchoice",
            "airspacevolume_pg",
            "approachtimingtable_pg",
            "apronareaavailability_pg",
            "directionfinder_pg",
            "distanceindication_pg"
            "equipmentunavailableadjustmentcolumn_pg",
            "equipmentunavailableadjustment_pg",
            "fasdatablock_pg",
            "finalleg_pg",
            "finalprofile_pg",
            "flightcharacteristic_pg",
            "flightconditioncircumstance_pg",
            "flightconditionelement_pg",
            "flightrestrictionlevel_pg",
            "flightrestrictionroute_pg",
            "flightrestriction_pg",
            "flightroutingelement_pg",
            "floatingdocksite_pg",
            "fuel_pg",
            "geoborder_pg",
            "guidanceline_pg",
            "holdingassessment_pg",
            "holdingpatterndistance_pg",
            "holdingpatternduration_pg",
            "holdingpattern_pg",
            "holdinguse_pg",
            "landingtakeoffareacollection_pg",
            "lightactivation_pg",
            "lightelement_pg",
            "manoeuvringareaavailability_pg",
            "markingbuoy_pg",
            "markingelement_pg",
            "meteorology_pg",
            "navigationroute_pg",
            "minima_pg",
            "missedapproachgroup_pg",
            "missedapproachleg_pg",
            "navaidcomponent_pg",
            "navaidequipmentdistance_pg",
            "navaid_pg",
            "navigationarearestriction_pg",
            "navigationareasector_pg",
            "navigationarea_pg",
            "nitrogen_pg",
            "nonmovementarea_pg",
            "note_pg",
            "obstaclearea_pg",
            "obstaclearea_pg",
            "obstacleassessmentarea_pg",
            "obstacleplacement_pg",
            "obstruction_pg",
            "oil_pg",
            "organisationauthorityassociation_pg",
            "organisationauthority_pg",
            "oxygen_pg",
            "passengerloadingbridge_pg",
            "pilotcontrolledlighting_pg",
            "pointreference_pg",
            "point_pg",
            "precisionapproachradar_pg",
            "proceduredme_pg",
            "distanceindication_pg",
            "equipmentunavailableadjustmentcolumn_pg",
            "point_pg",
            "proceduretransitionleg_pg",
            "radarcomponent_pg",
            "radarsystem_pg",
            "radiocommunicationchannel_pg",
            "radiofrequencyarea_pg",
            "reflector_pg",
            "ridge_pg",
            "ridge_pg",
            "routedme_pg",
            "routeportion_pg",
            "routesegment_pg",
            "route_pg",
            "seaplanelandingarea_pg",
            "surface_pg",
            "curve_pg",
            "proceduretransition_pg",
            "routeavailability_pg"
            ]
    }
}

class CompilationScript :

    def __init__(self, adapters_config, rename_config, directory) :
        self.adapters_config = adapters_config
        self.rename_config = self.format_config(rename_config)
        self.directory = directory
        self.files = [f for f in os.listdir(directory) if os.path.isfile(os.path.join(directory, f))]

    def format_config(self, config) :
        formatted_config = {}
        for key, value in config.items() :
            formatted_config[key] = {
                "method" : value["method"],
                "words" : sorted(value["words"], key=len, reverse=True)
            }
        return formatted_config

    def run(self) :
        for file in self.files :
            data = self.open_file(self.directory + "/" + file)
            data = self.rename_columns(data)
            self.save_file(self.directory + "/" + file, data)


    def open_file(self, file_name) :
        data = []
        with open(file_name, 'r') as file :
            data = file.readlines()
        file.close()
        return data
    
    def save_file(self, file_name, data) :
        with open(file_name, 'w') as file :
            file.writelines(data)
        file.close()


    def rename_columns(self, data) :
        rename_dict = {}
        for line in data :
            for key, value in self.rename_config.items() :
                new = re.search(value["method"], line)
                if new :
                    rename_dict[key] = new.group()
                    continue

        new_data = []
        for line in data:
            for key, new_name in rename_dict.items():
                    for value in self.rename_config[key]["words"]:
                        if value in line:
                            line = line.replace(value, new_name)

            new_data.append(line)
        return new_data
    
# compilationScript = CompilationScript(adapters_config, rename_config, "util/compilation/test_dir")
# compilationScript.run()

compilationScript = CompilationScript(adapters_config, rename_config, "src/main/java/com/aixm/delorean/core/schema/a5_1/aixm")
compilationScript.run()

compilationScript = CompilationScript(adapters_config, rename_config, "src/main/java/com/aixm/delorean/core/schema/a5_1_1/aixm")
compilationScript.run()
