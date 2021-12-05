package com.jgy.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EcoCalcController {
	
	@RequestMapping("/eco_calc")
	public String eco_calc() {
		return "term/eco_calc/eco_calc";
	}
}
