package com.jgy.webapp.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	@Autowired
	private AuthenticationProvider authenticationProvider;
	
	@Autowired
	private AuthenticationSuccessHandler authenticationSuccessHandler;
	
	@Autowired
	private AuthenticationFailureHandler authenticationFailureHandler;
	
	@Autowired
	private UserDetailsService userDetailsService;
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Override
	public void configure(WebSecurity web) throws Exception {
		// 인증을 무시하고 접근할 경로
		web.ignoring().antMatchers("/resources/**");
	}
	
	@Override
	public void configure(HttpSecurity http) throws Exception {
//		http.authorizeRequests()
//			.antMatchers("/admin/**").hasAnyRole("ROLE_ADMIN")
//			.antMatchers("/user/**").hasAnyRole("Role_USER")
//			.antMatchers("/**").permitAll();
		
		http.authorizeRequests()
			.antMatchers("/**").permitAll()
			.antMatchers("/board_admin").hasAnyRole("ROLE_ADMIN")
			.antMatchers("/board").hasAnyRole("ROLE_USER", "ROLE_ADMIN");
		
		http.csrf().disable();
		
		http.formLogin()
			.loginPage("/board/login")
			.usernameParameter("id")
			.passwordParameter("pw")
			.successHandler(authenticationSuccessHandler)
			.failureHandler(authenticationFailureHandler);
		
		http.logout()
			.logoutRequestMatcher(new AntPathRequestMatcher("/logout.do"))
			.logoutSuccessUrl("/board")
			.invalidateHttpSession(true)
			.deleteCookies("JSESSIONID");
		
		http.exceptionHandling().accessDeniedPage("/error/accessDenied");
		
		http.authenticationProvider(authenticationProvider);
	}
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService);
	}
}
