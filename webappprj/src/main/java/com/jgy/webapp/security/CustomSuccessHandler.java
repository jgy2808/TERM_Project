package com.jgy.webapp.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Service;

@Service
public class CustomSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		System.out.println("CustomSuccessHandler.getName : " + authentication.getName());
		HttpSession session = request.getSession();
		session.setAttribute("userID", authentication.getName());
		session.setAttribute("userIP", request.getRemoteAddr());		
		SecurityContextHolder.getContext().setAuthentication(authentication);
		response.sendRedirect("/board");
	}
}