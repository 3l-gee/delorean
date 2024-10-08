package com.aixm.delorean.core.xml;

import org.locationtech.jts.geom.GeometryFactory;

import javax.xml.parsers.ParserConfigurationException;

import org.locationtech.jts.geom.Coordinate;
import org.locationtech.jts.geom.Point;
import org.locationtech.jts.geom.LineString;
import org.locationtech.jts.geom.Polygon;
import org.locationtech.proj4j.CRSFactory;
import org.locationtech.proj4j.CoordinateTransform;
import org.locationtech.proj4j.CoordinateReferenceSystem;
import org.locationtech.proj4j.CoordinateTransformFactory;
import org.locationtech.proj4j.ProjCoordinate;

import com.aixm.delorean.core.schema.school.org.gml.CurveType;
import com.aixm.delorean.core.schema.school.org.gml.DirectPositionType;
import com.aixm.delorean.core.schema.school.org.gml.PointType;
import com.aixm.delorean.core.schema.school.org.gml.SurfaceType;

import jakarta.xml.bind.JAXBException;
import jakarta.xml.bind.annotation.adapters.XmlAdapter;

public class XMLAdapter {
    
    private GeometryFactory geometryFactory;

    public XMLAdapter() {
        this.geometryFactory = new GeometryFactory();
    }

    public Point parseGMLPoint(PointType value) {
        return null;
    }

    public PointType printGMLPoint(Point value){
        return null;
    }

    public LineString parseGMLCurve(CurveType value) {
        return null;
    }

    public CurveType printGMLCurve(LineString value){
        return null;
    }

    public Polygon parseGMLSurface(SurfaceType value) {
        return null;
    }

    public SurfaceType printGMLSurface(Polygon value){
        return null;
    }
}
