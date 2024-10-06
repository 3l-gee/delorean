package com.aixm.delorean.core.schema.school.adapter;

import org.locationtech.jts.geom.GeometryFactory;

import javax.xml.parsers.ParserConfigurationException;

import org.locationtech.jts.geom.Coordinate;
import org.locationtech.jts.geom.Point;

import com.aixm.delorean.core.schema.school.org.gml.DirectPositionType;
import com.aixm.delorean.core.schema.school.org.gml.PointType;

import jakarta.xml.bind.JAXBException;
import jakarta.xml.bind.annotation.adapters.XmlAdapter;

public class GeometryAdapter extends XmlAdapter<PointType, Point> {

    private static final GeometryFactory geometryFactory = new GeometryFactory();

    public static Point GmlToPostgis_PointType(PointType valuetype) throws JAXBException {

        DirectPositionType pos = valuetype.getPos();
        double x = pos.getValue().get(0);
        double y = pos.getValue().get(1);

        return geometryFactory.createPoint(new Coordinate(x, y));
    }

    // Method to convert JTS Point to GML (PointType)
    public static PointType PotstgisToGml_PointType(Point boundtype) throws JAXBException, ParserConfigurationException {

        DirectPositionType pos = new DirectPositionType();
        pos.getValue().add(boundtype.getX());
        pos.getValue().add(boundtype.getY());
        if (boundtype.getSRID() != 0) {
            pos.setSrsName("EPSG:" + boundtype.getSRID());
        }

        // Create a new GML PointType and set the DirectPositionType
        PointType pointType = new PointType();
        pointType.setPos(pos);

        return pointType;
    }
    

    @Override
    public Point unmarshal(PointType v) throws Exception {
        return GmlToPostgis_PointType(v);
    }

    @Override
    public PointType marshal(Point v) throws Exception {
        return PotstgisToGml_PointType(v);
    }
}
