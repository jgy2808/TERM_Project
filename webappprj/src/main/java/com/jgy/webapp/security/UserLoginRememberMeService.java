package com.jgy.webapp.security;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.codec.Hex;
import org.springframework.security.crypto.codec.Utf8;
import org.springframework.security.web.authentication.rememberme.AbstractRememberMeServices;
import org.springframework.security.web.authentication.rememberme.InvalidCookieException;
import org.springframework.security.web.authentication.rememberme.RememberMeAuthenticationException;
import org.springframework.security.web.authentication.rememberme.TokenBasedRememberMeServices;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

@Service
public class UserLoginRememberMeService extends AbstractRememberMeServices{

	
	private CustomUserDetailsService customUserDetailsService;

	@Autowired
	protected UserLoginRememberMeService(CustomUserDetailsService userDetailsService) {
		super("uniqueAndSecret", userDetailsService);
		this.customUserDetailsService = userDetailsService;
	}

	@Override
	public void logout(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) {
		System.out.println("UserLoginRememberMeService   logout() ");
		if (logger.isDebugEnabled()) {
			logger.debug("Logout of user "
					+ (authentication == null ? "Unknown" : authentication.getName()));
		}
		cancelCookie(request, response);
	}
	
	protected void cancelCookie(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("UserLoginRememberMeService cancelCookie() ");
		Cookie cookie = new Cookie("REMEMBER-ME", null);
		cookie.setMaxAge(0);
		cookie.setPath(getCookiePath(request));
		if ("REMEMBER-ME" != null) {
			cookie.setDomain("REMEMBER-ME");
		}
		response.addCookie(cookie);
	}
	
	private String getCookiePath(HttpServletRequest request) {
		String contextPath = request.getContextPath();
		return contextPath.length() > 0 ? contextPath : "/";
	}
	
	
	@Override
	protected void onLoginSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication successfulAuthentication) {
		System.out.println("UserLoginRememberMeService   onLoginSuccess() ");
		String username = retrieveUserName(successfulAuthentication);
		String password = retrievePassword(successfulAuthentication);

		// If unable to find a username and password, just abort as
		// TokenBasedRememberMeServices is
		// unable to construct a valid token in this case.
		if (!StringUtils.hasLength(username)) {
			logger.debug("Unable to retrieve username");
			return;
		}

		if (!StringUtils.hasLength(password)) {
			System.out.println("UserLoginRememberMeService onLoginSuccess() 111");
			CustomUserDetails user = (CustomUserDetails) customUserDetailsService.loadUserByUsername(username);
			password = user.getPassword();

			if (!StringUtils.hasLength(password)) {
				System.out.println("UserLoginRememberMeService onLoginSuccess() 222222");
				logger.debug("Unable to obtain password for user: " + username);
				return;
			}
		}

		int tokenLifetime = 1209600;
		long expiryTime = System.currentTimeMillis();
		// SEC-949
		expiryTime += 1000L * (tokenLifetime < 0 ? TWO_WEEKS_S : tokenLifetime);

		String signatureValue = makeTokenSignature(expiryTime, username, password);

		setCookie(new String[] { username, Long.toString(expiryTime), signatureValue },
				tokenLifetime, request, response);

		if (logger.isDebugEnabled()) {
			logger.debug("Added remember-me cookie for user '" + username
					+ "', expiry: '" + new Date(expiryTime) + "'");
		}
	}

	@Override
	protected CustomUserDetails processAutoLoginCookie(String[] cookieTokens, HttpServletRequest request,
			HttpServletResponse response) throws RememberMeAuthenticationException, UsernameNotFoundException {
		System.out.println("UserLoginRememberMeService   processAutoLoginCookie() ");
		
		if (cookieTokens.length != 3) {
			throw new InvalidCookieException("Cookie token did not contain 3"
					+ " tokens, but contained '" + Arrays.asList(cookieTokens) + "'");
		}

		long tokenExpiryTime;

		try {
			tokenExpiryTime = new Long(cookieTokens[1]).longValue();
		}
		catch (NumberFormatException nfe) {
			throw new InvalidCookieException(
					"Cookie token[1] did not contain a valid number (contained '"
							+ cookieTokens[1] + "')");
		}

		if (isTokenExpired(tokenExpiryTime)) {
			throw new InvalidCookieException("Cookie token[1] has expired (expired on '"
					+ new Date(tokenExpiryTime) + "'; current time is '" + new Date()
					+ "')");
		}

		// Check the user exists.
		// Defer lookup until after expiry time checked, to possibly avoid expensive
		// database call.
		CustomUserDetails userDetails = (CustomUserDetails) customUserDetailsService.loadUserByUsername(cookieTokens[0]);
		// Check signature of token matches remaining details.
		// Must do this after user lookup, as we need the DAO-derived password.
		// If efficiency was a major issue, just add in a UserCache implementation,
		// but recall that this method is usually only called once per HttpSession - if
		// the token is valid,
		// it will cause SecurityContextHolder population, whilst if invalid, will cause
		// the cookie to be cancelled.
		String expectedTokenSignature = makeTokenSignature(tokenExpiryTime,
				userDetails.getUsername(), userDetails.getPassword());

		if (!equals(expectedTokenSignature, cookieTokens[2])) {
			throw new InvalidCookieException("Cookie token[2] contained signature '"
					+ cookieTokens[2] + "' but expected '" + expectedTokenSignature + "'");
		}

		return userDetails;
	}
	
	
	
	
	
	private static boolean equals(String expected, String actual) {
		byte[] expectedBytes = bytesUtf8(expected);
		byte[] actualBytes = bytesUtf8(actual);
		if (expectedBytes.length != actualBytes.length) {
			return false;
		}

		int result = 0;
		for (int i = 0; i < expectedBytes.length; i++) {
			result |= expectedBytes[i] ^ actualBytes[i];
		}
		return result == 0;
	}
	private static byte[] bytesUtf8(String s) {
		if (s == null) {
			return null;
		}
		return Utf8.encode(s);
	}
	protected boolean isTokenExpired(long tokenExpiryTime) {
		return tokenExpiryTime < System.currentTimeMillis();
	}
	protected String makeTokenSignature(long tokenExpiryTime, String username,
			String password) {
		String data = username + ":" + tokenExpiryTime + ":" + password + ":" + getKey();
		MessageDigest digest;
		try {
			digest = MessageDigest.getInstance("MD5");
		}
		catch (NoSuchAlgorithmException e) {
			throw new IllegalStateException("No MD5 algorithm available!");
		}

		return new String(Hex.encode(digest.digest(data.getBytes())));
	}
	
	protected String retrieveUserName(Authentication authentication) {
		if (isInstanceOfUserDetails(authentication)) {
			return ((CustomUserDetails) authentication.getPrincipal()).getUsername();
		}
		else {
			return authentication.getPrincipal().toString();
		}
	}

	protected String retrievePassword(Authentication authentication) {
		if (isInstanceOfUserDetails(authentication)) {
			return ((CustomUserDetails) authentication.getPrincipal()).getPassword();
		}
		else {
			if (authentication.getCredentials() == null) {
				return null;
			}
			return authentication.getCredentials().toString();
		}
	}

	private boolean isInstanceOfUserDetails(Authentication authentication) {
		return authentication.getPrincipal() instanceof UserDetails;
	}

//	extends TokenBasedRememberMeServices
//	public CustomTokenBasedRememberMeServices(String key, UserDetailsService userDetailsService) {
//		super(key, userDetailsService);
//	}
//
//	@Override
//	public void onLoginSuccess(HttpServletRequest request, HttpServletResponse response,
//			Authentication successfulAuthentication) {
//
//		String username = retrieveUserName(successfulAuthentication);
//		String password = retrievePassword(successfulAuthentication);
//
//		// If unable to find a username and password, just abort as
//		// TokenBasedRememberMeServices is
//		// unable to construct a valid token in this case.
//		if (!StringUtils.hasLength(username)) {
//			logger.debug("Unable to retrieve username");
//			return;
//		}
//
//		if (!StringUtils.hasLength(password)) {
//			System.out.println("CustomTokenBasedRememberMeServices onLoginSuccess() !!!");
//			UserDetails user = getUserDetailsService().loadUserByUsername(username);
//			password = user.getPassword();
//
//			if (!StringUtils.hasLength(password)) {
//				logger.debug("Unable to obtain password for user: " + username);
//				return;
//			}
//		}
//
//		int tokenLifetime = calculateLoginLifetime(request, successfulAuthentication);
//		long expiryTime = System.currentTimeMillis();
//		// SEC-949
//		expiryTime += 1000L * (tokenLifetime < 0 ? TWO_WEEKS_S : tokenLifetime);
//
//		String signatureValue = makeTokenSignature(expiryTime, username, password);
//
//		setCookie(new String[] { username, Long.toString(expiryTime), signatureValue },
//				tokenLifetime, request, response);
//
//		if (logger.isDebugEnabled()) {
//			logger.debug("Added remember-me cookie for user '" + username
//					+ "', expiry: '" + new Date(expiryTime) + "'");
//		}
//	}
}
