import numpy as np
import xml.etree.ElementTree as ET

# Define the GML input (move the XML declaration to the top)
gml_arc_by_center_point = """
<?xml version="1.0" encoding="UTF-8"?>
<gml:Work xmlns:gml="http://www.opengis.net/gml/3.2">
    <gml:Tasks>
        <gml:ArcByCenterPoint numArc="1" srsName="urn:ogc:def:crs:EPSG::4326">
            <gml:pos>44.82694444445 -0.72111111111</gml:pos>
            <gml:radius uom="[nmi_i]">23.0</gml:radius>
            <gml:startAngle uom="deg">-39.056642</gml:startAngle>
            <gml:endAngle  uom="deg">96.278174</gml:endAngle>
        </gml:ArcByCenterPoint>
        <gml:ArcByCenterPoint numArc="1" srsName="urn:ogc:def:crs:OGC:1.3:CRS84">
            <gml:pos>8.550420833 47.460000556</gml:pos>
            <gml:radius uom="NM">8.974</gml:radius>
            <gml:startAngle uom="deg">179.37175697186672</gml:startAngle>
            <gml:endAngle uom="deg">-19.184697052876686</gml:endAngle>
        </gml:ArcByCenterPoint>
    </gml:Tasks>
</gml:Work>
"""


class GMLTransformer:
    A = 6378137.0  # semi-major axis in meters
    F = 1 / 298.257223563  # flattening
    B = A * (1 - F)  # semi-minor axis

    DISTANCE_UNIT_CONVERSION = {
        "[nmi_i]": 1852,
        'NM': 1852,
        'KM': 1000,
        'M': 1.0,
        'MI': 1609.34,
        'FT': 0.3048
    }

    ANGLE_UNIT_CONVERSION = {
        'deg': np.pi / 180.0,
        'rad': 1.0
    }
    namespace = {'gml': 'http://www.opengis.net/gml/3.2'}

    def __init__(self, gml):
        self.root = ET.fromstring(gml.strip())
        self.tasks = self.root.find('.//{http://www.opengis.net/gml/3.2}Tasks', namespaces=self.namespace)
        self.output = []
        self.runner()

    def pos_to_lon_latI(self, pos, srs):
        x, y = map(float, pos.split())
        if srs == 'urn:ogc:def:crs:OGC:1.3:CRS84':
            return x, y
        
        if srs == 'urn:ogc:def:crs:EPSG::4326':
            return y, x

    def angle_unit_to_rad(self, angle, unit, srs):
        if unit in self.ANGLE_UNIT_CONVERSION:
            if srs == 'urn:ogc:def:crs:OGC:1.3:CRS84':
                return 2 * np.pi - (angle * self.ANGLE_UNIT_CONVERSION[unit]) + np.pi/2
            
            if srs == 'urn:ogc:def:crs:EPSG::4326':
                return angle * self.ANGLE_UNIT_CONVERSION[unit]
                # return (angle * self.ANGLE_UNIT_CONVERSION[unit]) * -1 + np.pi/2
            
            else :
                return angle * self.ANGLE_UNIT_CONVERSION[unit]
        
        else :
            raise ValueError(f"Unknown angle unit: {unit}")

    def distance_unit_to_m(self, distance, unit):
        if unit in self.DISTANCE_UNIT_CONVERSION:
            return distance * self.DISTANCE_UNIT_CONVERSION[unit]
        
        else :
            raise ValueError(f"Unknown distance unit: {unit}")
    

    def runner(self):
        for task in self.tasks:
            print(task.tag)
            print()
            if task.tag == '{http://www.opengis.net/gml/3.2}ArcByCenterPoint':
                self.arc_by_center_point(task)

    def arc_by_center_point(self, task):
        pos = task.find('.//gml:pos', namespaces=self.namespace).text
        
        srs_name = task.get('srsName')

        center_lon, center_lat = self.pos_to_lon_latI(pos, task.get('srsName'))

        radius_raw = float(task.find('.//gml:radius', namespaces=self.namespace).text)
        radius_unit = task.find('.//gml:radius', namespaces=self.namespace).get('uom')

        start_angle_raw = float(task.find('.//gml:startAngle', namespaces=self.namespace).text)
        start_angle_unit = task.find('.//gml:startAngle', namespaces=self.namespace).get('uom')

        end_angle_raw = float(task.find('.//gml:endAngle', namespaces=self.namespace).text)
        end_angle_unit = task.find('.//gml:endAngle', namespaces=self.namespace).get('uom')

        radius = self.distance_unit_to_m(radius_raw, radius_unit)
        start_angle_rad = self.angle_unit_to_rad(start_angle_raw, start_angle_unit, srs_name)
        end_angle_rad = self.angle_unit_to_rad(end_angle_raw, end_angle_unit, srs_name)

        print(f"Center      : {center_lat}, {center_lon}")
        print(f"Radius [m]  : {radius}")
        print(f"srs_name    : {srs_name}")
        print(f"Start angle : {start_angle_rad}")
        print(f"End angle   : {end_angle_rad}")

        start_lon, start_lat = self.compute_new_point(center_lon, center_lat, radius, start_angle_rad)
        end_lon, end_lat = self.compute_new_point(center_lon, center_lat, radius, end_angle_rad)

        return self.output.append(f"LINESTRING ({start_lon} {start_lat}, {center_lon} {center_lat}, {end_lon} {end_lat})")
        
    def compute_new_point(self, lon, lat, radius, angle):

        # Convert latitude and longitude to radians
        lat = np.radians(lat)   
        lon = np.radians(lon)
        radius = radius / self.A

        new_lat = np.arcsin(np.sin(lat) * np.cos(radius) + np.cos(lat) * np.sin(radius) * np.cos(angle))
        new_lon = lon + np.arctan2(np.sin(angle) * np.sin(radius) * np.cos(lat), np.cos(radius) - np.sin(lat) * np.sin(new_lat))

        # Convert back to degrees
        new_lat = np.degrees(new_lat)
        new_lon = np.degrees(new_lon)

        return new_lon, new_lat

    
    def __str__(self):
        return '\n'.join(self.output)
        

print(GMLTransformer(gml_arc_by_center_point))  
