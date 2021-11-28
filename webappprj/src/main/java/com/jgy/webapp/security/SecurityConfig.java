package com.jgy.webapp.security;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
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
import org.springframework.security.web.authentication.RememberMeServices;
import org.springframework.security.web.authentication.rememberme.AbstractRememberMeServices;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import org.springframework.security.web.savedrequest.NullRequestCache;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	@Autowired
	private CustomAuthProvider authenticationProvider;
	
	@Autowired
	private CustomSuccessHandler customSuccessHandler;
	
	@Autowired
	private CustomFailureHandler customFailureHandler;
	@Autowired
	private CustomUserDetailsService customuserDetailsService;
	@Autowired
	private UserDetailsService userDetailsService;
	
	@Autowired
	@Qualifier("dataSource")
	private DataSource dataSource;
	
	@Bean
	public PersistentTokenRepository persistentTokenRepository() {
		JdbcTokenRepositoryImpl repo = new JdbcTokenRepositoryImpl();
		repo.setDataSource(dataSource);
		return repo;
	}
	
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

		//.antMatchers("/board_admin").hasAnyRole("ROLE_ADMIN")hasAnyRole("ROLE_USER")
		http.authorizeRequests()
			.antMatchers("/main/**").permitAll()
			.antMatchers("/board/**").authenticated()
			.and()
				.formLogin()
					.loginPage("/main/login")
					.usernameParameter("id")
					.passwordParameter("pw")
					.successHandler(customSuccessHandler)
					.failureHandler(customFailureHandler)
					.failureUrl("/main/login.fail")
			.and()
				.rememberMe()
					.key("spring-remember-me")
					.rememberMeParameter("remember-me")
					.alwaysRemember(true)
					.tokenRepository(persistentTokenRepository())
			.and()
				.logout()
					.logoutRequestMatcher(new AntPathRequestMatcher("/logout.do"))
					.logoutSuccessUrl("/board")
					.invalidateHttpSession(true)
					.deleteCookies("JSESSIONID", "remember-me")
			.and()
				.exceptionHandling().accessDeniedPage("/error/accessDenied")
			.and()
				.authenticationProvider(authenticationProvider)
				.csrf().disable();
	}
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(customuserDetailsService);
	}
}
