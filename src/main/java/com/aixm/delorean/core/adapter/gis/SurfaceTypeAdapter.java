package com.aixm.delorean.core.adapter.gis;

import jakarta.xml.bind.annotation.adapters.XmlAdapter;

import com.aixm.delorean.core.adapter.type.gis.AixmSurfaceType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.SurfaceType;

public class SurfaceTypeAdapter extends XmlAdapter<SurfaceType, AixmSurfaceType>
{

    public AixmSurfaceType unmarshal(SurfaceType value) {
        return (com.aixm.delorean.core.helper.gis.GisHelper.parseAIXMSurface(value));
    }

    public SurfaceType marshal(AixmSurfaceType value) {
        return (com.aixm.delorean.core.helper.gis.GisHelper.printAIXMSurface(value));
    }

}
