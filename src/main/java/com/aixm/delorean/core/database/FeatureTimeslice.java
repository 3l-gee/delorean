package com.aixm.delorean.core.database;

import jakarta.persistence.SqlResultSetMapping;
import jakarta.persistence.ConstructorResult;
import jakarta.persistence.ColumnResult;

@SqlResultSetMapping(
    name = "FeatureTimesliceMapping",
    classes = @ConstructorResult(
        targetClass = FeatureTimeslice.class,
        columns = {
            @ColumnResult(name = "identifier", type = String.class),
            @ColumnResult(name = "sequence_number", type = Integer.class),
            @ColumnResult(name = "correction_number", type = Integer.class)
        }
    )
)

public class FeatureTimeslice {
    private String identifier;
    private Integer sequenceNumber;
    private Integer correctionNumber;

    public FeatureTimeslice(String identifier, Integer sequenceNumber, Integer correctionNumber) {
        this.identifier = identifier;
        this.sequenceNumber = sequenceNumber;
        this.correctionNumber = correctionNumber;
    }


    public String getIdentifier(){
        return this.identifier;
    }

    public Integer getSequenceNumber(){
        return this.sequenceNumber;
    }

    public Integer getCorrectionNumber(){
        return this.correctionNumber;
    }
}
