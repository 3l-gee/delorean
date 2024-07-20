package com.aixm.delorean.core.configuration;

public enum TemporalityType {
    NO_TEMPORALITY(1),
    FORWARD_TEMPORALITY(2),
    FORWARD_BACKWARD_TEMPORALITY(3);

    private final int value;

    private TemporalityType(int value) {
        this.value = value;
    }

    public int getValue() {
        return value;
    }
}
