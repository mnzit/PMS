/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fls.pms.controller;

import com.fls.pms.repository.VenueRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author HP B&O
 */
@Controller
@RequestMapping(value = "/")
public class DashboardController {
    
    @Autowired
    private VenueRepository venueRepo;
    
    @GetMapping(value = "/customers/index")
    public String index(Model model) {
        model.addAttribute("venues",venueRepo.findAll());
        return "customers/index";
    }
    
    @GetMapping(value = "/customers/setlocation/{id}")
    public String park(@PathVariable("id") long id,Model model){
        model.addAttribute("venue", venueRepo.getOne(id));
        return "customers/setlocation";
    }
}
