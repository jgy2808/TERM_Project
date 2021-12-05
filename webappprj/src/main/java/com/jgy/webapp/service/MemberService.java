package com.jgy.webapp.service;

import org.springframework.stereotype.Service;

@Service
public interface MemberService {
//	public String getRecycle(String object) throws SQLException;
//	public int Login(String id, String pw) throws SQLException;
//	public int Signup(String id, String pw) throws SQLException;
	
	public void sendMail(MemberVO vo) throws Exception;
}
