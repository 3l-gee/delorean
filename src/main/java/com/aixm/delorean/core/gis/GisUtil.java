package com.aixm.delorean.core.gis;

import com.aixm.delorean.core.schema.school.org.gml.CurveType;
import com.aixm.delorean.core.schema.school.org.gml.SurfaceType;
import com.aixm.delorean.core.schema.school.org.gml.PointType;

import java.io.ByteArrayOutputStream;
import java.io.StringReader;
import java.io.StringWriter;

import org.locationtech.jts.geom.Point;
import org.locationtech.jts.geom.LineString;
import org.locationtech.jts.geom.Polygon;
import org.locationtech.jts.geom.GeometryFactory;
import org.locationtech.jts.io.gml2.GMLReader;

import org.geotools.gml3.v3_2.GMLConfiguration;
import org.geotools.gml3.bindings.PointTypeBinding;
import org.geotools.xsd.Parser;
import org.geotools.xsd.Encoder;
import org.geotools.geometry.jts.JTSFactoryFinder;

public class GisUtil {

        private static final GeometryFactory geometryFactory = JTSFactoryFinder.getGeometryFactory();
        private static final GMLConfiguration gmlConfiguration = new GMLConfiguration();
        private static Parser parser = new Parser(gmlConfiguration);
        private static Encoder encoder = new Encoder(gmlConfiguration);

        public static Point parseGMLPoint(PointType value) {
                return null;
        }

        public static PointType printGMLPoint(Point value) {
                return null;
        }

        public static LineString parseGMLCurve(CurveType value) {
                return null;
        }

        public static CurveType printGMLCurve(LineString value) {
                return null;
        }

        public static Polygon parseGMLSurface(SurfaceType value) {
                return null;
        }

        public static SurfaceType printGMLSurface(Polygon value) {
                return null;
        }
}