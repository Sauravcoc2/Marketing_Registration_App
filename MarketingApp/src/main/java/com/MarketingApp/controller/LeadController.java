package com.MarketingApp.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import com.MarketingApp.dto.LeadDto;
import com.MarketingApp.entities.Lead;
import com.MarketingApp.service.LeadService;
import com.MarketingApp.utility.EmailService;

@Controller
public class LeadController {
	
	@Autowired
	private LeadService leadService;
	
	@Autowired
	private EmailService emailService;
	
	//http://localhost:8080/create			
	@RequestMapping("/create")
	public String viewCreateLead() {
		return "create_lead";
	}	
	
	@RequestMapping("/saveLead")			//saving a record
	public String saveLead(@ModelAttribute Lead lead, ModelMap model) {
		leadService.saveLead(lead);
		emailService.sendEmail(lead.getEmail(),"Test","Welcome");
		model.addAttribute("msg","User record is saved successfully!!");
		return "create_lead";
	}
	
// #Different Approach for Saving Lead (assuming lead a record)
//
//	@RequestMapping("/saveLead")
//	public String saveLead(
//			@RequestParam("firstName") String firstName,
//			@RequestParam("lastName") String lastName,
//			@RequestParam("email") String email,
//			@RequestParam("mobile") Long mobile
//			) {
//		Lead lead = new Lead();
//		lead.setFirstName(firstName);
//		lead.setLastName(lastName);
//		lead.setEmail(email);
//		lead.setMobile(mobile);
//		
//		leadService.saveLead(lead);
//		
//		return "create_lead";
//	}
//	
//	@RequestMapping("/saveLead")
//	public String saveLead(LeadDto leadDto) {
//		Lead lead = new Lead();
//		lead.setFirstName(leadDto.getFirstName());
//		lead.setLastName(leadDto.getLastName());
//		lead.setEmail(leadDto.getEmail());
//		lead.setMobile(leadDto.getMobile());
//		leadService.saveLead(lead);
//		return "create_lead";
//	}
	
	//http://localhost:8080/listall
	@RequestMapping("/listall")				//listing all the record
	public String getAllLeads(Model model) {
		List<Lead> leads = leadService.getAllLeads();
		model.addAttribute("leads", leads);
		return "search_result";
	}
	
	@RequestMapping("/delete")				//deleting a record
	public String deleteLeadByID(@RequestParam("id") long id, Model model) {
		leadService.deleteLeadById(id);
		List<Lead> leads = leadService.getAllLeads();
		model.addAttribute("leads", leads);
		return "search_result";
	}
	
	@RequestMapping("/update")				
	public String getLeadById(@RequestParam("id") long id, Model model) {
		Lead lead = leadService.findLeadById(id);
		model.addAttribute("lead",lead);
		return "update_lead";
	}
	
	@RequestMapping("/updateLead")			//updating a record by using id as Primary key
	public String updateLead(LeadDto dto, Model model) {
		Lead l = new Lead();
		l.setId(dto.getId());
		l.setFirstName(dto.getFirstName());
		l.setLastName(dto.getLastName());
		l.setEmail(dto.getEmail());
		l.setMobile(dto.getMobile());
		leadService.saveLead(l);
		List<Lead> leads = leadService.getAllLeads();
		model.addAttribute("leads", leads);
		return "search_result";
	}	
}
