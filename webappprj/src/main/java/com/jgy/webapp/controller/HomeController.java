package com.jgy.webapp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jgy.webapp.service.MemberService;

@Controller
public class HomeController {
	
	//@Autowired
	//private MemberService jcon;
	
//	@RequestMapping("/tm")
//	public String teachableMachine(HttpServletRequest req) {
//		HttpSession session = req.getSession();
//		if (session.getAttribute("userIP") != null && !session.getAttribute("userIP").equals(req.getRemoteAddr())) {
//			// ���� �̸��� �ٲٰ�
//			req.changeSessionId();
//			session = req.getSession();
//			// ���� ������ �Ӽ��� �����
//			session.removeAttribute("userID");
//			session.removeAttribute("userIP");
//			// ���� �̸� �ٲٱ� ���� ������ �Ӽ��� ���������??
//			
//			System.out.println("session userIP : " + session.getAttribute("userIP"));
//			System.out.println("getRemoteAddr : " + req.getRemoteAddr());
//
////			return "redirect:";
//		}
//		return "tm"; 
//	}
	
//	@PostMapping("/admin/board")
//	public String Adminboard(HttpServletRequest req, Model model) throws SQLException {
//		return "admin/board_admin";
//	}
//	@GetMapping("/asdfboard")
//	public String board(HttpServletRequest req, HttpServletResponse response, Model model) throws SQLException, IOException {
//		HttpSession session = req.getSession();
//		if (session.getAttribute("userID").equals("aa")) {
//			return "admin/board_admin";
//		} else {
//			return "user/board_user";
//		}
//	}
//	@GetMapping("/error/accessDenied")
//	public String accessDenied() {
//		return "error/accessDenied";
//	}
//	
//	@RequestMapping("/view/index")
//	public String recycle(String object, Model model) throws SQLException {
//		System.out.println(object);
//		//String recycle = jcon.getRecycle(object);
//		//model.addAttribute("recycle", recycle);
//		return "index";
//	}
	
	@RequestMapping("/board")
	public String home(HttpServletRequest req) {
		System.out.println("called home");
//		HttpSession session = req.getSession();
//		if (session.getAttribute("userIP") != null && !session.getAttribute("userIP").equals(req.getRemoteAddr())) {
//			session.invalidate();
//		}
		return "term/board/board";
	}
}
