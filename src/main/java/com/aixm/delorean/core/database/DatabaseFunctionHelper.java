package com.aixm.delorean.core.database;

import java.util.Map;

import org.hibernate.Session;
import org.javatuples.Quintet;

import java.time.Instant;
import java.util.List;

import com.aixm.delorean.core.log.ConsoleLogger;
import com.aixm.delorean.core.log.LogLevel;
import com.aixm.delorean.core.schema.a5_1.aixm.*;
import com.aixm.delorean.core.schema.a5_1.aixm.message.BasicMessageMemberAIXMPropertyType;

public class DatabaseFunctionHelper {

    public static <T extends AbstractAIXMFeatureType> Quintet<Long, Long, Long, String, Instant> A5_1HandelTimeSlice(
            BasicMessageMemberAIXMPropertyType basicMessageMember, 
            FeatureTopTimeslice existing, 
            Session session) {
        AbstractAIXMFeatureType abstractFeature = basicMessageMember.getAbstractAIXMFeature(); 

        if (abstractFeature instanceof AirportProtectionAreaMarkingType feature) {
            for (AirportProtectionAreaMarkingTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                AirportProtectionAreaMarkingTimeSliceType ts = tsp.getAirportProtectionAreaMarkingTimeSlice();
                Long tspId = tsp.getDbid();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, tspId,  feature, existing, basicMessageMember, session);

            }
        } else if (abstractFeature instanceof ApronMarkingType feature) {
            for (ApronMarkingTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                ApronMarkingTimeSliceType ts = tsp.getApronMarkingTimeSlice();
                Long tspId = tsp.getDbid();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, tspId, feature, existing, basicMessageMember, session);

            }  
        } else {
            return new Quintet<Long, Long, Long, String, Instant>(null, null, null, null, null);
        }

        return new Quintet<Long, Long, Long, String, Instant>(null, null, null, null, null);

    }

    private static Quintet<Long, Long, Long, String, Instant> mergeTimeSlice(
            AbstractAIXMTimeSliceType ts,
            Object tsp,
            Long tspId,
            AbstractAIXMFeatureType feature,
            FeatureTopTimeslice existing,
            BasicMessageMemberAIXMPropertyType bmm,
            Session session) {

        if (ts == null) {
            return new Quintet<Long, Long, Long, String, Instant>(null, null, null, null, null);
        }

        int incomingSeq = ts.getSequenceNumber().intValue();
        int incomingCorr = ts.getCorrectionNumber().intValue();

        if (existing == null) {
            session.persist(bmm);
            return new Quintet<Long, Long, Long, String, Instant>(null, null, null, null, null);

        } else if (incomingSeq > existing.getSequenceNumber()) {
            if (incomingSeq != existing.getSequenceNumber() + 1) {
                ConsoleLogger.log(LogLevel.WARN, "Missing Timeslice for feature [" + feature.getClass().getSimpleName() + "] : " +  existing.getIdentifier() + " between sequence numbers: " + existing.getSequenceNumber() + " and " + incomingSeq);
            }
            session.persist(tsp);
        
            Instant newBeginPosition = ts.getValidTime().getBeginPosition();

            return new Quintet<Long, Long, Long, String, Instant>(existing.getFeatureId(), tspId, existing.getTimeSliceId(), null, ts.getValidTime().getBeginPosition(););

        } else if (incomingSeq == existing.getSequenceNumber() && incomingCorr > existing.getCorrectionNumber()) {
            session.persist(tsp);
            return new Quintet<Long, Long, Long, String, Instant>(existing.getFeatureId(), tspId, null, null, null);
        } else {

            return new Quintet<Long, Long, Long, String, Instant>(null, null, null, null, null);
        }
    }


}
