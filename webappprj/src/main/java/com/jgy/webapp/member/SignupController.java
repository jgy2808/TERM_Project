package com.jgy.webapp.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	private boolean idDuplication = false;
	private String idChecked;
	
	@RequestMapping("/signup")
	public String signup() {
		return "term/signup/signup";
	}

//	String name, String id, String pw, String pw_check, 
//		String email, String nickname, String area,
	@ResponseBody
	@RequestMapping(value = "/signup/signup.do", produces = "application/json; charset=UTF-8", method = RequestMethod.POST)
	public String signup_do(@RequestBody Map<String, String> map,
							HttpServletResponse response) throws SQLException, IOException {
		String username = map.get("name");
		String userid = map.get("id");
		String password = map.get("pw");
		String pw_check = map.get("pw_check");
		String email = map.get("email");
		String nickname = map.get("nickname");
		String area = map.get("area");
		System.out.println("name : " + username);
		System.out.println("id : " + userid);
		System.out.println("pw : " + password);
		System.out.println("pw_check : " + pw_check);
		System.out.println("email : " + email);
		System.out.println("nickname : " + nickname);
		System.out.println("area : " + area);
		BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
		
		
		if (!idChecked.equals(userid) || !idDuplication) {
			return "id";
		}
		
		if (!password.matches("^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$")) {
			return "pw";
		} 
		if (!password.equals(pw_check)) {
			return "pw_check";
		} else {
			password = bCryptPasswordEncoder.encode(password);
		}

		if (!map.get("email").matches("^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$")) {
			return "email";
		}
		if (customerMapper.register(username, userid, password, email, nickname, area) == 1) {
			return "success";	
		} else {
			return "register error";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/signup/IdChecking.do", produces = "application/text; charset=UTF-8", method = RequestMethod.POST)
	public String idChecking(String id) {
		System.out.println("SignupController idChecking() : " + id);
		if (customerMapper.selectUserIdDistinct(id) == 0) {
			idDuplication = true;
			idChecked = id;
			return "사용 가능한 아이디입니다.";
		}
		return "이미 존재하는 아이디입니다.";
	}
	
	
}
