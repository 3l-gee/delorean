package com.aixm.delorean.core.schema.house;

import jakarta.persistence.*;
import java.util.List;

@Entity
@Table(name = "house", schema = "public")
public class House {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @OneToMany
    @JoinColumn(name = "house_id")
    private List<Dad> dads;   // List of Dads in the house

    @OneToMany
    @JoinColumn(name = "house_id")
    private List<Mom> moms;   // List of Moms in the house

    @OneToMany
    @JoinColumn(name = "house_id")
    private List<Son> sons;   // List of Sons in the house

    @OneToMany
    @JoinColumn(name = "house_id")
    private List<Cat> cats;   // List of Cats in the house

    @OneToMany
    @JoinColumn(name = "house_id")
    private List<Dog> dogs;   // List of Dogs in the house

    @OneToMany
    @JoinColumn(name = "house_id")
    private List<Bird> birds;   // List of Birds in the house

    // Getters and setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public List<Dad> getDads() {
        return dads;
    }

    public void setDads(List<Dad> dads) {
        this.dads = dads;
    }

    public List<Mom> getMoms() {
        return moms;
    }

    public void setMoms(List<Mom> moms) {
        this.moms = moms;
    }

    public List<Son> getSons() {
        return sons;
    }

    public void setSons(List<Son> sons) {
        this.sons = sons;
    }

    public List<Cat> getCats() {
        return cats;
    }

    public void setCats(List<Cat> cats) {
        this.cats = cats;
    }
}
