package com.MarketingApp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.MarketingApp.entities.Lead;

public interface LeadRepository extends JpaRepository<Lead, Long> {

}
