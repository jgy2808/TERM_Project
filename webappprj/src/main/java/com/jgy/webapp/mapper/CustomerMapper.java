package com.jgy.webapp.mapper;

import java.util.Optional;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.jgy.webapp.security.CustomUserDetails;

@Service
public interface CustomerMapper {
	Optional<CustomUserDetails> loadUserByUsername(String id);
	int register(
			@Param("username") String username, @Param("userid") String userid,
			@Param("password") String password, @Param("email") String email,
			@Param("nickname") String nickname, @Param("area") String area
			);
	int insertUserInfo(@Param("id") String id, @Param("pw") String pw, @Param("auth") String auth);
	int selectUserIdDistinct(@Param("id") String id);
	String selectUserIdForFoundid(@Param("username") String username, @Param("email") String email);
	int selectUserPw(@Param("username") String username, @Param("userid") String userid, @Param("email") String email);
	
	int updateTempUserPw(@Param("userid") String userid, @Param("tempPw") String tempPw);
	String test();
}
