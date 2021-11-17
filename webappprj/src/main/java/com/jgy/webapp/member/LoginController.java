package com.jgy.webapp.member;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

//import com.jgy.webapp.security.CustomAuthenticationProvider;
import com.jgy.webapp.service.MemberService;

@Controller
public class LoginController {
	
	//@Autowired
	//private MemberService jcon;
	
//	@RequestMapping("/view/login")
//	public String login() {
//		return "login";
//	}
	
//	@PostMapping("/view/login.do")
//	public String login_do(String id, String pw, HttpServletRequest req) throws SQLException {
//		HttpSession session = req.getSession();
////		Authentication auth = 
//		if (jcon.Login(id, pw) == 1) {
//			System.out.println("session : " + session);
//			session.setAttribute("memId", id);
//			session.setAttribute("memIp", req.getRemoteAddr());
//			
//			return "redirect:/tm";
//		} else {
//			return "redirect:/view/login";
//		}
//	}

}
