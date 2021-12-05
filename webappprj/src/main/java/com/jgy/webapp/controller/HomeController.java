package com.jgy.webapp.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jgy.webapp.domain.BoardVO;
import com.jgy.webapp.mapper.CustomerMapper;
import com.jgy.webapp.service.BoardService;

@Controller
public class HomeController {
	
	//@Autowired
	//private MemberService jcon;
	
	@Autowired
	private BoardService service;
	
	@Autowired
	private CustomerMapper customerMapper;
	
	
	@RequestMapping("/tm")
	public String teachableMachine(HttpServletRequest req) {
		HttpSession session = req.getSession();
		if (session.getAttribute("userIP") != null && !session.getAttribute("userIP").equals(req.getRemoteAddr())) {
			// 세션 이름을 바꾸고
			req.changeSessionId();
			session = req.getSession();
			// 현재 세션의 속성을 지우면
			session.removeAttribute("userID");
			session.removeAttribute("userIP");
			// 과연 이름 바꾸기 전의 세션의 속성은 지워질까용??
			
			System.out.println("session userIP : " + session.getAttribute("userIP"));
			System.out.println("getRemoteAddr : " + req.getRemoteAddr());

//			return "redirect:";
		}
		return "tm"; 
	}
	
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
	@RequestMapping("/view/index")
	public String recycle(String object, Model model) throws SQLException {
		System.out.println(object);
		//String recycle = jcon.getRecycle(object);
		//model.addAttribute("recycle", recycle);
		return "index";
	}
	
	@RequestMapping("/board_main/**")
	public String getList(Model model, HttpServletRequest request) throws Exception{
		String url = request.getRequestURI();
		if(!(url.equals("/board_main/scrollTop.js"))) {
			String tmp = url.substring(url.length()-1);
//			System.out.println("긁어온 링크 : " + url);
//			System.out.println("렝스 : " + url.length());
//			System.out.println("찾는링크 : " + tmp);
			
			List<BoardVO> list = null;
			if(tmp.equals("1"))
				list = service.listCate("1");
			else if(tmp.equals("2"))
				list = service.listCate("2");
			else
				list = service.list();
			
			model.addAttribute("list", list);
			System.out.println("board_main호출");
			System.out.println(list);
			System.out.println(customerMapper.getCount());
		}
		return "term/board/board_main";
	}
	
	@RequestMapping("/board_write")
	public String board_write() {
		return "term/board/board_write";
	}
	
	@RequestMapping("/detail/**")
	public String board_detail(HttpServletResponse response, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		System.out.println(request.getRequestURI());
		String tmp = request.getRequestURI().substring(8);
		int num = Integer.parseInt(tmp);
		
		List<BoardVO> list = null;
		list = service.list();
		session.setAttribute("list", list);

		if(!tmp.equals("scrollTop.js") && (num < 1 || num > customerMapper.getCount()))
			return "term/detail/board_detail_failed";
		if(!tmp.equals("scrollTop.js")) {
			session.setAttribute("showNum", tmp);
			session.setAttribute("MAX", customerMapper.getCount());
			return "term/detail/board_detail";
		}
		return "term/detail/board_detail";
	}
	
	@ResponseBody
	@RequestMapping(value = "/board_write.do", produces ="application/json; charset=UTF-8", method = RequestMethod.POST)
	public String writeItem(@RequestBody Map<String,String> map, HttpServletResponse response, HttpServletRequest req) throws Exception {
		StringBuilder sb = new StringBuilder();
		HttpSession session = req.getSession();
		String userid = (String) session.getAttribute("userID");
		sb.append((customerMapper.getCount()+1));
		map.put("userid", userid);
		map.put("board_num",sb.toString());
		System.out.println("board_num : " + map.get("board_num"));
		System.out.println("userid : " + map.get("userid"));
		System.out.println("category : " + map.get("category"));
		System.out.println("title : " + map.get("title"));
		System.out.println("contents : " + map.get("contents"));
		service.write(map);
		return "success";
	}

}
