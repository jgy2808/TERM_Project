package com.jgy.webapp.security;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.rememberme.TokenBasedRememberMeServices;
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
	
	
//	@Autowired
//	private CustomTokenBasedRememberMeServices customTokenBasedRememberMeServices;
	
//	@Autowired
//	@Qualifier("dataSource")
//	private DataSource dataSource;
//	
//	@Bean
//	public PersistentTokenRepository persistentTokenRepository() {
//		JdbcTokenRepositoryImpl repo = new JdbcTokenRepositoryImpl();
//		repo.setDataSource(dataSource);
//		return repo;
//	}
	
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

		//.antMatchers("/board_admin").hasAnyRole("ROLE_ADMIN").hasAnyRole("ROLE_USER")
		http.authorizeRequests()
			.antMatchers("/main/**").permitAll()
			//.antMatchers("/main/login").anonymous()
			.antMatchers("/board_main/**").authenticated()
			.and()
				.formLogin()
					.loginPage("/main/login")
					.usernameParameter("id")
					.passwordParameter("pw")
					.successHandler(customSuccessHandler)
					.failureHandler(customFailureHandler)
					.failureUrl("/main/login.fail")
			.and()
				.logout()
					.logoutRequestMatcher(new AntPathRequestMatcher("/logout.do"))
					.invalidateHttpSession(true)
					.deleteCookies("JSESSIONID")
					.logoutSuccessUrl("/main/login")
					//.addLogoutHandler(customLogoutHandler)
			.and()
				.rememberMe()
					.key("uniqueAndSecret")
//					.rememberMeParameter("remember_me")
					//.tokenRepository(persistentTokenRepository())
//			        .userDetailsService(customuserDetailsService)
			        .authenticationSuccessHandler(customSuccessHandler)
			        .rememberMeServices(userLoginRememberMeService(customuserDetailsService))
			.and()
				.sessionManagement()
					.sessionFixation().none()
			.and()
				.exceptionHandling().accessDeniedPage("/error/accessDenied")
			.and()
				.authenticationProvider(authenticationProvider)
				.csrf().disable();	
	}
	
	@Bean
	public UserLoginRememberMeService userLoginRememberMeService(CustomUserDetailsService userDetailsService) {
		UserLoginRememberMeService token = new UserLoginRememberMeService(userDetailsService);
		token.setCookieName("REMEMBER-ME");
		token.setParameter("remember_me");
		token.setTokenValiditySeconds(1209600);
		
		return token;
	}
		
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(customuserDetailsService);
	}
}
