package com.aixm.delorean.core.adapter.a5_1.gis;

import jakarta.xml.bind.annotation.adapters.XmlAdapter;

import com.aixm.delorean.core.adapter.type.gis.AixmSurfaceType;
import com.aixm.delorean.core.schema.a5_1.aixm.SurfaceType;

public class SurfaceTypeAdapter extends XmlAdapter<SurfaceType, AixmSurfaceType>
{
    @Override
    public AixmSurfaceType unmarshal(SurfaceType value) throws Exception {
        try {
            return (com.aixm.delorean.core.helper.gis.GisHelper.parseAIXMSurface(value));
        } catch (IllegalArgumentException e) {
            return null;
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public SurfaceType marshal(AixmSurfaceType value) throws Exception {
        return (com.aixm.delorean.core.helper.gis.GisHelper.printAIXMSurface(value, new SurfaceType()));
    }

}
