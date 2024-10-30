package com.aixm.delorean.core.adapter.gis;

import jakarta.xml.bind.annotation.adapters.XmlAdapter;

import com.aixm.delorean.core.adapter.type.gis.AixmElevatedSurfaceType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.ElevatedSurfaceType;

public class ElevatedSurfaceTypeAdapter extends XmlAdapter<ElevatedSurfaceType, AixmElevatedSurfaceType>
{

    public AixmElevatedSurfaceType unmarshal(ElevatedSurfaceType value) {
        return (com.aixm.delorean.core.util.GeospatialHelper.parseAIXMElevatedSurface(value));
    }

    public ElevatedSurfaceType marshal(AixmElevatedSurfaceType value) {
        return (com.aixm.delorean.core.util.GeospatialHelper.printAIXMElevatedSurface(value));
    }

}
