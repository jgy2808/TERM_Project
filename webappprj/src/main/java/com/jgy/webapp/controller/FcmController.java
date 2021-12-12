package com.jgy.webapp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FcmController {

	@RequestMapping("/NewFile")
	public String fcmtest(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

		String tokenId = "d9kgVgQzByc:APA91bGu83ghryq37isfMchs_--Kq7-VTcux2IPFxp7stPG9AYeD08vca1c6RZZrFnmT14eZFvi8Akrwlp6y76SBm67kfK_WonK_L9GXrh17ad-rp3dkm3vxshhdn4QlnGQ-iE7Ek65E";
		String title = "제목입니다";
		String content = "내용입니다";

		FcmUtil FcmUtil = new FcmUtil();
		FcmUtil.send_FCM(tokenId, title, content);
		return "NewFile";
	}

//	@RequestMapping("/index")
//	public String index(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
//
//		return "index";
//	}
}