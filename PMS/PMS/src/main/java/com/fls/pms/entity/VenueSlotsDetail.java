/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fls.pms.entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

/**
 *
 * @author HP B&O
 */
@Entity
@Table(name = "tbl_venue_slots_detail")
@NamedQueries({
    @NamedQuery(name = "VenueSlotsDetail.findAll", query = "SELECT v FROM VenueSlotsDetail v")})
public class VenueSlotsDetail implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    @Basic(optional = false)
    @NotNull
    @Column(name = "bike_slots_available")
    private int bikeSlotsAvailable;
    @Basic(optional = false)
    @NotNull
    @Column(name = "car_slots_available")
    private int carSlotsAvailable;
    @JoinColumn(name = "venue_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Venue venue;

    public VenueSlotsDetail() {
    }

    public VenueSlotsDetail(Long id) {
        this.id = id;
    }

    public VenueSlotsDetail(Long id, int bikeSlotsAvailable, int carSlotsAvailable) {
        this.id = id;
        this.bikeSlotsAvailable = bikeSlotsAvailable;
        this.carSlotsAvailable = carSlotsAvailable;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getBikeSlotsAvailable() {
        return bikeSlotsAvailable;
    }

    public void setBikeSlotsAvailable(int bikeSlotsAvailable) {
        this.bikeSlotsAvailable = bikeSlotsAvailable;
    }

    public int getCarSlotsAvailable() {
        return carSlotsAvailable;
    }

    public void setCarSlotsAvailable(int carSlotsAvailable) {
        this.carSlotsAvailable = carSlotsAvailable;
    }

    public Venue getVenue() {
        return venue;
    }

    public void setVenue(Venue venue) {
        this.venue = venue;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof VenueSlotsDetail)) {
            return false;
        }
        VenueSlotsDetail other = (VenueSlotsDetail) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.fls.pms.entity.VenueSlotsDetail[ id=" + id + " ]";
    }
    
}
