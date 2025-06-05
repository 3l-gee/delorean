package com.aixm.delorean.core.database;

import org.hibernate.Session;

public class MutationFeatureTimeslice {
    private String identifier;
    private Long featureId;
    private Long sequenceNumber;
    private Long correctionNumber;

    private Long oldTimeSlicePropertyId;
    private Long oldTimeSliceId;

    private Long newTimeSlicePropertyId;
    private Long newTimeSliceId;

    public MutationFeatureTimeslice(Long featureId, String identifier, Long sequenceNumber, Long correctionNumber, Long timeSlicePropertyId, Long timeSliceId) {
        this.featureId = featureId;
        this.identifier = identifier;
        this.sequenceNumber = sequenceNumber;
        this.correctionNumber = correctionNumber;
        this.oldTimeSlicePropertyId = timeSlicePropertyId;
        this.oldTimeSliceId = timeSliceId;
        this.newTimeSlicePropertyId = null;
        this.newTimeSliceId = null;
    }

    public Long getFeatureId(){
        return this.featureId;
    }

    public String getIdentifier(){
        return this.identifier;
    }

    public Long getSequenceNumber(){
        return this.sequenceNumber;
    }

    public Long getCorrectionNumber(){
        return this.correctionNumber;
    }

    public Long getOldTimeSlicePropertyId(){
        return this.oldTimeSlicePropertyId;
    }

    public Long getOldTimeSliceId(){
        return this.oldTimeSliceId;
    }

    public Long getNewTimeSlicePropertyId(){
        return this.newTimeSlicePropertyId;
    }

    public Long getnewTimeSliceId(){
        return this.newTimeSliceId;
    }

    private void appendNewTSP(Session session){
        session.createNativeMutationQuery("""
                INSERT INTO master_join (source_id, target_id)
                VALUES (:featureId, :tspId)
            """)
            .setParameter("featureId", this.featureId)
            .setParameter("tspId", this.newTimeSlicePropertyId)
            .executeUpdate();
    }

    private void cutOldTSP(Session session){
        Instant newBeginPosition = tsp.getDesignatedPointTimeSlice().getValidTime().getBeginPosition();

        session.createNativeMutationQuery("""
            UPDATE navaids_points.designatedpoint_ts
            SET valid_time_end = :new_begin_position
            WHERE id = :time_slice_id
        """)
            .setParameter("new_begin_position", newBeginPosition)
            .setParameter("time_slice_id", this.oldTimeSliceId)
            .executeUpdate();
    }

}
