import numpy as np
import xml.etree.ElementTree as ET

# Define the GML input (move the XML declaration to the top)
gml_arc_by_center_point = """
<?xml version="1.0" encoding="UTF-8"?>
<gml:Work xmlns:gml="http://www.opengis.net/gml/3.2">
    <gml:Tasks>
        <gml:ArcByCenterPoint numArc="1">
            <gml:pos>46.94809 7.44744</gml:pos>
            <gml:radius uom="NM">50</gml:radius>
            <gml:startAngle uom="deg">96.17559801259146</gml:startAngle>
            <gml:endAngle uom="deg">66.39569333746066</gml:endAngle>
        </gml:ArcByCenterPoint>
    </gml:Tasks>
</gml:Work>
"""


class GMLTransformer:
    RADIUS_EARTH = 6371.0  # km (Used for distance calculation)
    namespace = {'gml': 'http://www.opengis.net/gml/3.2'}

    def __init__(self, gml):
        self.root = ET.fromstring(gml.strip())
        self.tasks = self.root.findall('.//{http://www.opengis.net/gml/3.2}Tasks', namespaces=self.namespace)
        print(self.tasks)
        self.output = []
        self.runner()

    def runner(self):
        for task in self.tasks:
            
            if task.find('.//gml:ArcByCenterPoint', namespaces=self.namespace) is not None:
                self.arc_by_center_point(task)

    def arc_by_center_point(self, task):
        pos = task.find('.//gml:pos', namespaces=self.namespace).text
        center_lon, center_lat = map(float, pos.split())

        radius = float(task.find('.//gml:radius', namespaces=self.namespace).text)

        start_angle = float(task.find('.//gml:startAngle', namespaces=self.namespace).text)
        end_angle = float(task.find('.//gml:endAngle', namespaces=self.namespace).text)

        start_angle_rad = np.radians(start_angle)
        end_angle_rad = np.radians(end_angle)

        start_lon, start_lat = self.compute_new_point(center_lon, center_lat, radius, start_angle_rad)
        end_lon, end_lat = self.compute_new_point(center_lon, center_lat, radius, end_angle_rad)

        line_string = f"LINESTRING ({start_lon} {start_lat}, {center_lon} {center_lat}, {end_lon} {end_lat})"
        self.output.append(line_string)

    def compute_new_point(self, lon, lat, radius, angle):
        lat_rad = np.radians(lat)
        lon_rad = np.radians(lon)

        new_lat_rad = np.arcsin(np.sin(lat_rad) * np.cos(radius / self.RADIUS_EARTH) + np.cos(lat_rad) * np.sin(radius / self.RADIUS_EARTH) * np.cos(angle))
        new_lon_rad = lon_rad + np.arctan2(np.sin(angle) * np.sin(radius / self.RADIUS_EARTH) * np.cos(lat_rad), np.cos(radius / self.RADIUS_EARTH) - np.sin(lat_rad) * np.sin(new_lat_rad))

        new_lat = np.degrees(new_lat_rad)
        new_lon = np.degrees(new_lon_rad)

        return new_lon, new_lat
    
    def __str__(self):
        return str(self.output)
        

print(GMLTransformer(gml_arc_by_center_point))  


# Parse the GML input with the correct namespace
# root = ET.fromstring(gml_arc_by_center_point.strip())

# # Define the namespace for GML elements
# namespace = {'gml': 'http://www.opengis.net/gml/3.2'}

# # Extract the values from the GML using the correct namespace
# pos = root.find('.//gml:pos', namespaces=namespace).text
# center_lon, center_lat = map(float, pos.split())

# radius = float(root.find('.//gml:radius', namespaces=namespace).text)

# start_angle = float(root.find('.//gml:startAngle', namespaces=namespace).text)
# end_angle = float(root.find('.//gml:endAngle', namespaces=namespace).text)

# # Convert angles from degrees to radians
# start_angle_rad = np.radians(start_angle)
# end_angle_rad = np.radians(end_angle)

# # Define the WGS84 constants
# RADIUS_EARTH = 6371.0  # km (Used for distance calculation)

# # Function to compute new coordinates given a start point, distance (radius), and angle
# def compute_new_point(lon, lat, radius, angle):
#     # Convert lat/lon to radians
#     lat_rad = np.radians(lat)
#     lon_rad = np.radians(lon)

#     # Calculate new lat and lon
#     new_lat_rad = np.arcsin(np.sin(lat_rad) * np.cos(radius / RADIUS_EARTH) + np.cos(lat_rad) * np.sin(radius / RADIUS_EARTH) * np.cos(angle))
#     new_lon_rad = lon_rad + np.arctan2(np.sin(angle) * np.sin(radius / RADIUS_EARTH) * np.cos(lat_rad), np.cos(radius / RADIUS_EARTH) - np.sin(lat_rad) * np.sin(new_lat_rad))

#     # Convert back to degrees
#     new_lat = np.degrees(new_lat_rad)
#     new_lon = np.degrees(new_lon_rad)
    
#     return new_lon, new_lat

# # Calculate start and end points
# start_lon, start_lat = compute_new_point(center_lon, center_lat, radius, start_angle_rad)
# end_lon, end_lat = compute_new_point(center_lon, center_lat, radius, end_angle_rad)

# # Prepare the LineString (start, center, end)
# line_string = f"LINESTRING ({start_lon} {start_lat}, {center_lon} {center_lat}, {end_lon} {end_lat})"

# Output the result