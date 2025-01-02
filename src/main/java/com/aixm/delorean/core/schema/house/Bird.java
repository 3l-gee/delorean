package com.aixm.delorean.core.schema.house;

import jakarta.persistence.*;

@Entity
@Table(name = "bird", schema = "public")
public class Bird {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    private String name;

    // No owner reference here, as the ownership is with Dad, Mom, or Son
    // No mappings to Dad, Mom, or Son in the Cat class

    // Getters and setters
}
