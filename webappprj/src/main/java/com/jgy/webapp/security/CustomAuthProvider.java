package com.jgy.webapp.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Service
public class CustomAuthProvider implements AuthenticationProvider {
	
	@Autowired
	private CustomUserDetailsService customUserDetailsService;
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		System.out.println("CustomAuthProvider : authenticate()");
		String id = authentication.getName();
		String pwd = (String) authentication.getCredentials();
//		System.out.println("CustomAuthProvider : getName : " + id);
//		System.out.println("CustomAuthProvider : getCredentials : " + pwd);
		CustomUserDetails user = (CustomUserDetails) customUserDetailsService.loadUserByUsername(id);
//		System.out.println("CustomAuthProvider : userPW : " + user.getPassword());
		if (!passwordEncoder.matches(pwd, user.getPassword())) {
			throw new BadCredentialsException("비밀번호가 맞지 않습니다.");
		} else {
			System.out.println("Password Matches Success !!");
		}
		List<GrantedAuthority> authorities = new ArrayList<>();
//		authorities.add(new SimpleGrantedAuthority("ROLE_" + user.getAuth()));
		authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
//		user.setPassword(null);
		return new UsernamePasswordAuthenticationToken(id, pwd, authorities);
	}

	@Override
	public boolean supports(Class<?> authentication) {
		
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}
	
	
}
