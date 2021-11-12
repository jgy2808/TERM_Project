package com.jgy.webapp.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jgy.webapp.mapper.CustomerMapper;
import com.jgy.webapp.security.CustomUserDetailsService;

@Controller
public class SignupController {

	//@Autowired
	//private MemberService jcon;
	
	@Autowired
	private CustomerMapper customerMapper;
	
	@RequestMapping("/signup")
	public String signup() {
		return "term/signup/signup";
	}
	
	@PostMapping("/signup.do")
	public String signup_do(String name, String id, String pw, String pw_check, 
							String phone, String phone_certification, String email,
							String nickname, String area,
							HttpServletResponse response) throws SQLException, IOException {
		boolean idChk = false;
		System.out.println("id : " + id);
		System.out.println("pw : " + pw);
		BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
		pw = bCryptPasswordEncoder.encode(pw);
		
		if (customerMapper.selectUserIdDistinct(id) > 0) {
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('중복된 아이디가 존재합니다.'); </script>");
			out.flush();
		} else {
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('사용 가능한 아이디입니다.'); </script>");
			out.flush();
			idChk = true;
		}
		
		if (customerMapper.insertUserInfo(id, pw, "USER") == 1) {
			return "redirect:/board/login";
		} else {
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('인증번호가 틀립니다'); </script>");
			out.flush();
			return "redirect:/signup";
		}
	}
	
	@RequestMapping(value = "/idChecking", method = RequestMethod.POST)
	@ResponseBody
	public void idChecking() {
		System.out.println("SignupController : idChecking()");
	}
	
	
}
