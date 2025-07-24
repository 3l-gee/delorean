package com.aixm.delorean.core.database;

import org.hibernate.Session;
import org.hibernate.StatelessSession;

import com.aixm.delorean.core.database.DatabaseFunctionHelper.TimeSliceAction;

import java.lang.reflect.Method;
import java.time.Instant;

public class MutationFeatureTimeslice {
    private String identifier;
    private Long featureId;
    private Long sequenceNumber;
    private Long correctionNumber;

    private TimeSliceAction action;
    private Object timeSliceProperty;
    private Instant newTimeSliceStart;

    private String timeSliceSchemaName;

    private Long oldTimeSlicePropertyId;
    private Long oldTimeSliceId;

    public MutationFeatureTimeslice(Long featureId, String identifier, Long sequenceNumber, Long correctionNumber, Long TSPid, Long TSid, String TSschemaName) {
        this.featureId = featureId;
        this.identifier = identifier;
        this.sequenceNumber = sequenceNumber;
        this.correctionNumber = correctionNumber;
        this.oldTimeSlicePropertyId = TSPid;
        this.oldTimeSliceId = TSid;
        this.action = TimeSliceAction.NOTHING;
        this.timeSliceSchemaName = TSschemaName;
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

    public TimeSliceAction getAction(){
        return this.action;
    }

    public void setAction(TimeSliceAction action){
        this.action = action;
    }

    public Object getTimeSliceProperty(){
        return this.timeSliceProperty;
    }

    public void setTimeSliceProperty(Object tsp){
        this.timeSliceProperty = tsp;
    }

    // TODO : disgusting workaround that is needed as all the xxxTimeSliceProprtyType are not extension of a AbstractTimeSliceProprtyType
    private Long extractDbid(Object tsp) {
        try {
            Method m = tsp.getClass().getMethod("getDbid");
            return (Long) m.invoke(tsp);
        } catch (Exception e) {
            throw new RuntimeException("Cannot extract dbid from tsp of type: " + tsp.getClass(), e);
        }
    }

    public String getTimeSliceSchemaName(){
        return this.timeSliceSchemaName;
    }

    public void setTimeSliceSchemaName(String TSSchemaName){
        this.timeSliceSchemaName = TSSchemaName;
    }

    public Instant getNewTimeSliceStart(){
        return this.newTimeSliceStart;
    }

    public void setNewTimeSliceStart(Instant newTSstart){
        this.newTimeSliceStart = newTSstart;
    }

    public void appplyMutationStateless(StatelessSession session){
        switch (this.action) {
            case TimeSliceAction.NEW:
            case TimeSliceAction.NOTHING:
                break;

            case TimeSliceAction.CHANGE:
                this.appendNewTSP(session, this.extractDbid(this.timeSliceProperty));
                this.cutOldTSP(session);
                break;

            case TimeSliceAction.CORRECTION:
                this.appendNewTSP(session, this.extractDbid(this.timeSliceProperty));
                break;
        }
    }

    public void appplyMutation(Session session){
        switch (this.action) {
            case TimeSliceAction.NEW:
                break;
            case TimeSliceAction.NOTHING:
                break;
                                
            case TimeSliceAction.CHANGE:            
                this.appendNewTSP(session, this.extractDbid(this.timeSliceProperty));    
                this.cutOldTSP(session);
                break;

            case TimeSliceAction.CORRECTION:
                this.appendNewTSP(session, this.extractDbid(this.timeSliceProperty));
                break;
        }
    }

    private void appendNewTSP(Session session, Long newTSPid){
        session.createNativeMutationQuery("""
                INSERT INTO master_join (source_id, target_id)
                VALUES (:featureId, :tspId)
            """)
            .setParameter("featureId", this.featureId)
            .setParameter("tspId", newTSPid)
            .executeUpdate();
    }

    private void appendNewTSP(StatelessSession session, Long newTSPid){
        session.createNativeMutationQuery("""
            INSERT INTO master_join (source_id, target_id)
            VALUES (:featureId, :tspId)
        """)
        .setParameter("featureId", this.featureId)
        .setParameter("tspId", newTSPid)
        .executeUpdate();
    }

    private void cutOldTSP(Session session) {
        String sql = """
            UPDATE %s
            SET valid_time_end = :new_begin_position
            WHERE id = :time_slice_id
            """.formatted(this.timeSliceSchemaName + "_ts");

        session.createNativeMutationQuery(sql)
            .setParameter("new_begin_position", this.newTimeSliceStart)
            .setParameter("time_slice_id", this.oldTimeSliceId)
            .executeUpdate();
    }

    private void cutOldTSP(StatelessSession session) {
        String sql = """
            UPDATE %s
            SET valid_time_end = :new_begin_position
            WHERE id = :time_slice_id
            """.formatted(this.timeSliceSchemaName + "_ts");

        session.createNativeMutationQuery(sql)
            .setParameter("new_begin_position", this.newTimeSliceStart)
            .setParameter("time_slice_id", this.oldTimeSliceId)
            .executeUpdate();
    }


}
