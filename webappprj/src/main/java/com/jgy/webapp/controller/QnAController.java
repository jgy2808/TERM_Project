package com.jgy.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class QnAController {
	@RequestMapping("/qna")
	public String qna()  {
		return "term/qna/qna";
	}
}
