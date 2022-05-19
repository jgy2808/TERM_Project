package com.jgy.webapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jgy.webapp.mapper.CustomerMapper;

@Controller
public class SearchController {
	@Autowired
	private CustomerMapper customerMapper;
	
	@RequestMapping("/search_image")
	public String search_image()  {
		return "term/search/search_image";
	}
	@RequestMapping("/search_text")
	public String search_text()  {
		return "term/search/search_text";
	}
	
	@ResponseBody
	@RequestMapping(value = "/search_image.do", produces = "application/text; charset=UTF-8", method = RequestMethod.POST)
	public String search_image(String recycle_title) {
		System.out.println("recycle_title : " + recycle_title);
		String recycle_contents = customerMapper.search_image(recycle_title);
		System.out.println("recycle_contents : " + recycle_contents);
		return recycle_contents;
	}
}
