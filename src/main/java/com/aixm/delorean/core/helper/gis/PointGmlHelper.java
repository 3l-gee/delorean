package com.aixm.delorean.core.helper.gis;

import java.math.BigInteger;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;
import java.util.List;
import java.util.ArrayList;
import java.util.List;

import javax.xml.namespace.QName;

import org.locationtech.jts.geom.Coordinate;
import org.locationtech.jts.geom.GeometryFactory;
import org.locationtech.jts.geom.LineString;
import org.locationtech.jts.geom.LinearRing;
import org.locationtech.jts.geom.Point;
import org.locationtech.jts.geom.Polygon;
import org.locationtech.jts.geom.PrecisionModel;
import org.locationtech.proj4j.CRSFactory;
import org.locationtech.proj4j.CoordinateReferenceSystem;
import org.locationtech.proj4j.CoordinateTransformFactory;
import org.locationtech.proj4j.ProjCoordinate;
import org.locationtech.proj4j.CoordinateTransform;

import jakarta.xml.bind.JAXBElement;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.CurveType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.DirectPositionListType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.DirectPositionType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.GeodesicStringType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.PointType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.PolygonPatchType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.SurfaceType;
import com.aixm.delorean.core.adapter.type.gis.AixmGeometryType;
import com.aixm.delorean.core.adapter.type.gis.AixmElevatedGeometryType;
import com.aixm.delorean.core.adapter.type.gis.AixmCurveType;
import com.aixm.delorean.core.adapter.type.gis.AixmElevatedCurveType;
import com.aixm.delorean.core.adapter.type.gis.AixmElevatedPointType;
import com.aixm.delorean.core.adapter.type.gis.AixmElevatedSurfaceType;
import com.aixm.delorean.core.adapter.type.gis.AixmPointType;
import com.aixm.delorean.core.adapter.type.gis.AixmSurfaceType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.CurveSegmentArrayPropertyType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.AbstractCurveSegmentType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.AbstractRingPropertyType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.SurfacePatchArrayPropertyType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.AbstractSurfacePatchType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.CurvePropertyType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.RingType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.CodeVerticalDatumType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.ElevatedCurveType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.ElevatedPointType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.ElevatedSurfaceType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.ValDistanceSignedType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.ValDistanceType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.ValDistanceVerticalType;

public class PointGmlHelper {
    
    //Point
    public static Point parseGMLPoint (PointType value){
        if (value == null) {
            return null;
        }

        DirectPositionType pos = value.getPos();
        if (pos == null) {
            throw new IllegalArgumentException("DirectPositionType is null");
        }

        String srsName = value.getSrsName();

        if (srsName == null) {
            throw new IllegalArgumentException("srsName is null");
        }

        // BigInteger srsDiemnesion = value.getSrsDimension();
        Coordinate Coordinate = parseDirectPosition(pos);
        if (Coordinate == null) {
            throw new IllegalArgumentException("Coordinate is null");
        }

        return CoordinateTransformeHelper.transformToPoint(srsName, "EPSG:4326", Coordinate);
    }


    public static Coordinate parseDirectPosition (DirectPositionType value) {
        if (value == null) {
            throw new IllegalArgumentException("DirectPositionType is null");
        }
        List<Double> coordinatesList = value.getValue();

        if (coordinatesList == null || coordinatesList.isEmpty()) {
            throw new IllegalArgumentException("list<Double> value is null or empty");
        }

        if (coordinatesList.size() == 2) {
            Double x = coordinatesList.get(0);
            Double y = coordinatesList.get(1);
            if (x == null || y == null) {
                throw new IllegalArgumentException("Coordinate values cannot be null");
            }
            return new Coordinate(x, y);
        } else if (coordinatesList.size() == 3) {
            Double x = coordinatesList.get(0);
            Double y = coordinatesList.get(1);
            Double z = coordinatesList.get(2);
            if (x == null || y == null || z == null) {
                throw new IllegalArgumentException("Coordinate values cannot be null");
            }
            return new Coordinate(x, y, z);
        } else {
            throw new IllegalArgumentException("list<Double> value is not 2 or 3");
        }
    }
   

    public static DirectPositionListType printDirectPosition (Coordinate value) {
        if (value == null) {
            return null;
        } else {
            DirectPositionListType pos = new DirectPositionListType();

            pos.getValue().add(value.getX());
            pos.getValue().add(value.getY());
            if (!Double.isNaN(value.getZ())) {
                pos.getValue().add(value.getZ());
            }

            return pos;
        }

        return new DirectPositionListType();
    }
}
