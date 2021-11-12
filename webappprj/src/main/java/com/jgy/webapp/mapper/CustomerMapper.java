package com.jgy.webapp.mapper;

import java.util.Optional;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.jgy.webapp.security.CustomUserDetails;

@Service
public interface CustomerMapper {
	Optional<CustomUserDetails> loadUserByUsername(String id);
	int insertUserInfo(@Param("id") String id, @Param("pw") String pw, @Param("auth") String auth);
	int selectUserIdDistinct(@Param("id") String id);
}
