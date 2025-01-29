package com.aixm.delorean.core.adapter.a5_1_1.gis;

import jakarta.xml.bind.annotation.adapters.XmlAdapter;

import com.aixm.delorean.core.adapter.type.gis.AixmElevatedSurfaceType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.ElevatedSurfaceType;

public class ElevatedSurfaceTypeAdapter extends XmlAdapter<ElevatedSurfaceType, AixmElevatedSurfaceType>
{
    @Override
    public AixmElevatedSurfaceType unmarshal(ElevatedSurfaceType value) throws Exception{
        try {
            return (com.aixm.delorean.core.helper.gis.GisHelper.parseAIXMElevatedSurface(value));
        } catch (IllegalArgumentException e) {
            return null;
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public ElevatedSurfaceType marshal(AixmElevatedSurfaceType value) throws Exception{
        return (com.aixm.delorean.core.helper.gis.GisHelper.printAIXMElevatedSurface(value, new ElevatedSurfaceType()));
    }
}
