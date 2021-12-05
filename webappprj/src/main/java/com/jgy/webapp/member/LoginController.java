package com.jgy.webapp.member;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jgy.webapp.mapper.CustomerMapper;
import com.jgy.webapp.service.MemberService;
import com.jgy.webapp.service.MemberVO;

@Controller
public class LoginController {
	
	//@Autowired
	//private MemberService jcon;
	
	@Autowired
	private CustomerMapper customerMapper;
	@Autowired
	private MemberService memberService;
	
	private String usernameForFoundid;
	private String useridForFoundid;
	
	@RequestMapping("/main/login")
	public String board_login() {
		System.out.println("LoginController : called login");
		return "term/login/login";
	}
	
	@RequestMapping("/main/login/foundid")
	public String board_login_foundid() {
		System.out.println("LoginController : called foundid");
		return "term/foundid/foundid";	
	}
	
	@RequestMapping("/main/login/foundid_success")
	public String board_login_foundid_success() {
		System.out.println("LoginController : called foundid_success");
		return "term/foundid/foundid_success";	
	}
	
	@RequestMapping("/main/login/foundpw")
	public String board_login_foundpw() {
		System.out.println("LoginController : called foundpw");
		return "term/foundpw/foundpw";	
	}
	
	@RequestMapping("/main/login/foundpw_success")
	public String board_login_foundpw_success() {
		System.out.println("LoginController : called foundpw_success");
		return "term/foundpw/foundpw_success";	
	}
	
	@ResponseBody
	@RequestMapping(value = "/main/login/foundid/foundid.do", produces = "application/json; charset=UTF-8", method = RequestMethod.POST)
	public String foundid_submit(@RequestBody Map<String, String> map) {
		String username = map.get("name");
		String email = map.get("email");
		System.out.println("LoginController foundid_submit()");
		System.out.println("name : " + username);
		System.out.println("email : " + email);
		if (!map.get("email").matches("^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$")) {
			return "email fail";
		}
		
		try {
			String userid = customerMapper.selectUserIdForFoundid(username, email);
			System.out.println("foundid select userid : " + userid);
			usernameForFoundid = username;
			useridForFoundid = userid;
			return userid;
		} catch(Exception e) {
			System.out.println(e);
			e.printStackTrace();
			return "found userid fail";
		}	
	}
	
	@ResponseBody
	@RequestMapping(value = "/main/login/foundid/foundid_success.do")
	public Map<String, String> foundid_success() {
		Map<String, String> map = new HashMap<String, String>();
		System.out.println("LoginController foundid_success()");
		System.out.println("usernameForFoundid : " + usernameForFoundid);
		System.out.println("useridForFoundid : " + useridForFoundid);
		map.put("username", usernameForFoundid);
		map.put("userid", useridForFoundid);
		usernameForFoundid = "";
		useridForFoundid = "";
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/main/login/foundpw/foundpw.do", produces = "application/json; charset=UTF-8", method = RequestMethod.POST)
	public String foundpw_submit(@RequestBody Map<String, String> map) throws Exception {
	
		String username = map.get("username");
		String userid = map.get("userid");
		String email = map.get("email");
		System.out.println("LoginController foundpw_submit()");
		System.out.println("username : " + username);
		System.out.println("userid : " + userid);
		System.out.println("email : " + email);
		if (!map.get("email").matches("^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$")) {
			return "email fail";
		}
		
		if (customerMapper.selectUserPw(username, userid, email) > 0) {
			// 현재 비밀번호를 임시 비밀번호로 바꾸고 email로 보내주어야 함.
			// 임시 비밀번호 영어+숫자 : 10자, 특수문자 2자
			MemberVO vo = new MemberVO();
			String tempPW = "";
			for (int i = 0; i < 10; i++) {
				tempPW += (char) ((Math.random() * 26) + 97);
			}
			char[] tempPW_SpecialCharacter = {'@', '$', '!', '%', '*', '#', '?', '&'};
			for (int i = 0; i < 2; i++) {
				tempPW += tempPW_SpecialCharacter[(int) ((Math.random() * tempPW_SpecialCharacter.length))];
			}
			// 임시비밀번호 생성하면 출력한번 해주기
			System.out.println("tempPW : " + tempPW);
			vo.setUserid(userid);
			vo.setUserpw(tempPW);
			vo.setEmail(email);
			
			BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
			tempPW = bCryptPasswordEncoder.encode(tempPW);
			customerMapper.updateTempUserPw(userid, tempPW);
			
			memberService.sendMail(vo);
			
			return "success";
		} else {
			System.out.println("select userpw false");
			return "found userpw fail";
		}
	}
	
	
	
	
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
