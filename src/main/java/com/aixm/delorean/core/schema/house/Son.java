package com.aixm.delorean.core.schema.house;

import java.util.List;

import jakarta.persistence.*;

@Entity
@Table(name = "son", schema = "public") 
public class Son {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    private String name;
    
    @OneToOne
    @JoinColumn(name = "cat_id", unique = true)
    private Cat cat;  // Each Son has one Cat

    @OneToMany
    private List<Dog> dog;  // Each Son has one Dog

    @ManyToMany
    private List<Bird> bird;  // Many Son have many Birds

    // Getters and setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Cat getCat() {
        return cat;
    }

    public void setCat(Cat cat) {
        this.cat = cat;
    }
}
