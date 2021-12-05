package com.jgy.webapp.security;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import com.jgy.webapp.mapper.CustomerMapper;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class CustomUserDetailsService  implements UserDetailsService{
	
	@Autowired
	private CustomerMapper customerMapper;
	
	
	@Override
	public CustomUserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("CustomUserDetailsService : loadUserByUsername()");
		return customerMapper.loadUserByUsername(username)
				.orElseThrow(() -> new UsernameNotFoundException("���̵� �������� �ʽ��ϴ�."));
	}
}
