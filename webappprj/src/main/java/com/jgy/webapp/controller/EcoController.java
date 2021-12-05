package com.jgy.webapp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jgy.webapp.domain.EcoVO;
import com.jgy.webapp.service.EcoService;

@Controller
public class EcoController {
	@Autowired
	private EcoService serviceE;

	@RequestMapping("/eco_promote/**")
	public String ecoHome(Model model, HttpServletRequest request) throws Exception{
		String url = request.getRequestURI();
		String tmp = url.substring(url.length() - 1);
		
		List<EcoVO> list = null; 
		list = serviceE.listEco();
		
		model.addAttribute("list",list);
		model.addAttribute("ecoCate",tmp);
		
		System.out.println("eco_promote »£√‚");
		System.out.println(list);
		return "term/eco/eco_promote";
	}
	
}
