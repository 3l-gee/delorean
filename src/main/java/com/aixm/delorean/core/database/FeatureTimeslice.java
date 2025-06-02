package com.aixm.delorean.core.database;

public class FeatureTimeslice {
    private Long featureId;
    private String identifier;
    private Long sequenceNumber;
    private Long correctionNumber;
    private Long timeSlicePropertyId;
    private Long timeSliceId;

    public FeatureTimeslice(Long featureId, String identifier, Long sequenceNumber, Long correctionNumber) {
        this.featureId = featureId;
        this.identifier = identifier;
        this.sequenceNumber = sequenceNumber;
        this.correctionNumber = correctionNumber;
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

    public Long getTimeSlicePropertyId(){
        return this.timeSlicePropertyId;
    }

    public Long getTimeSliceId(){
        return this.timeSliceId;
    }
}
