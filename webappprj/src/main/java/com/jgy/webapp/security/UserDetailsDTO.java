package com.jgy.webapp.security;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserDetailsDTO {
	private String username;
	private String password;
	private String auth;
}
