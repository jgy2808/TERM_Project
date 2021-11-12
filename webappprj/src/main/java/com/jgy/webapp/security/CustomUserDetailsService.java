package com.jgy.webapp.security;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.jgy.webapp.jpa.UserRepository;
import com.jgy.webapp.mapper.CustomerMapper;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class CustomUserDetailsService  implements UserDetailsService{
	
	@Autowired
	private CustomerMapper customerMapper;
//	private final UserRepository userRepository;
	
	
	@Override
	public CustomUserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("CustomUserDetailsService : loadUserByUsername()");
//		return userRepository.findByUsername(username)
//				.orElseThrow(() -> new UsernameNotFoundException(username + " : 아이디가 존재하지 않습니다."));
		return customerMapper.loadUserByUsername(username)
				.orElseThrow(() -> new UsernameNotFoundException("아이디가 존재하지 않습니다."));
	}	
	
//	public Long save(UserDetailsDTO infoDto) {
//	    BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
//	    infoDto.setPassword(encoder.encode(infoDto.getPassword()));
//	    
//	    return userRepository.save(CustomUserDetails.builder()
//	        .id(infoDto.getUsername())
//	        .auth(infoDto.getAuth())
//	        .pw(infoDto.getPassword()).build()).getCode();
//	}
}
