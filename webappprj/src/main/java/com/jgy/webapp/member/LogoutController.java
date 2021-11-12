package com.jgy.webapp.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LogoutController {
	
	@PostMapping("/view/logout.do")
	public String logout(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		session.removeAttribute("userID");
		session.removeAttribute("userIP");
		return "redirect:/board";
	}
}