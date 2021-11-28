package com.jgy.webapp.security;

import java.util.Collection;

import org.springframework.data.annotation.Id;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;


@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Getter
@Service
public class CustomUserDetails implements UserDetails{
	private static final long serialVersionUID = 1L;
	
	
	private String userid;
	private String password;
//	private String auth;
	
	private Collection<? extends GrantedAuthority> authorities;
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		System.out.println("CustomUserDetails : getAuthorities");
		return authorities;
	}

	@Override
	public String getPassword() {
		System.out.println("CustomUserDetails : getPassword");
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
//	public String getAuth() {
//		System.out.println("CustomUserDetails : getAuth");
//		return auth;
//	}

	@Override
	public String getUsername() {
		System.out.println("CustomUserDetails : getUsername");
		return userid;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return false;
	}

}
