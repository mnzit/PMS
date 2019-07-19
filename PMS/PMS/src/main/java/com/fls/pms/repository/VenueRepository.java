/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fls.pms.repository;

import com.fls.pms.entity.Venue;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author HP B&O
 */
@Repository
public interface VenueRepository extends JpaRepository<Venue, Long>{
    
}
