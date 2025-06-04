package com.aixm.delorean.core.database;

import java.util.Map;

import org.hibernate.Session;
import org.javatuple

import java.time.Instant;
import java.util.List;

import com.aixm.delorean.core.log.ConsoleLogger;
import com.aixm.delorean.core.log.LogLevel;
import com.aixm.delorean.core.schema.a5_1.aixm.*;
import com.aixm.delorean.core.schema.a5_1.aixm.message.BasicMessageMemberAIXMPropertyType;

public class DatabaseFunctionHelper {

    public static <T extends AbstractAIXMFeatureType> Pair<Long, Long> A5_1mergeTimeSlice(
            BasicMessageMemberAIXMPropertyType basicMessageMember, 
            FeatureTimeslice existing, 
            Session session) {
        AbstractAIXMFeatureType abstractFeature = basicMessageMember.getAbstractAIXMFeature(); 

        if (abstractFeature instanceof AirportProtectionAreaMarkingType feature) {
            for (AirportProtectionAreaMarkingTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                AirportProtectionAreaMarkingTimeSliceType ts = tsp.getAirportProtectionAreaMarkingTimeSlice();
                Long tspId = tsp.getDbid();
                return DatabaseFunctionHelper.handleTimeSlice(ts, tsp, tspId,  feature, existing, basicMessageMember, session);

            }
        } else if (abstractFeature instanceof ApronMarkingType feature) {
            for (ApronMarkingTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                ApronMarkingTimeSliceType ts = tsp.getApronMarkingTimeSlice();
                Long tspId = tsp.getDbid();
                return DatabaseFunctionHelper.handleTimeSlice(ts, tsp, tspId, feature, existing, basicMessageMember, session);

            }  
        } else {
            return new Pair<Long, Long>();
        }

    }

    private static Pair<Long, Long> handleTimeSlice(
            AbstractAIXMTimeSliceType ts,
            Object tsp,
            Long tspId,
            AbstractAIXMFeatureType feature,
            FeatureTimeslice existing,
            BasicMessageMemberAIXMPropertyType bmm,
            Session session) {

        if (ts == null) return;

        int incomingSeq = ts.getSequenceNumber().intValue();
        int incomingCorr = ts.getCorrectionNumber().intValue();

        if (existing == null) {
            session.persist(bmm);

        } else if (incomingSeq > existing.getSequenceNumber()) {
            if (incomingSeq != existing.getSequenceNumber() + 1) {
                ConsoleLogger.log(LogLevel.WARN, "Missing Timeslice for feature [" + feature.getClass().getSimpleName() + "] : " +  existing.getIdentifier() + " between sequence numbers: " + existing.getSequenceNumber() + " and " + incomingSeq);
            }
            session.persist(tsp);
            return new Pair<Long, Long>(existing.getFeatureId(), tspId);

        } else if (incomingSeq == existing.getSequenceNumber() && incomingCorr > existing.getCorrectionNumber()) {
            session.persist(tsp);
        }
    }


}
