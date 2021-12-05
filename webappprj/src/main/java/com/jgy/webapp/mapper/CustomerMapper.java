package com.jgy.webapp.mapper;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.jgy.webapp.domain.BoardVO;
import com.jgy.webapp.domain.EcoVO;
import com.jgy.webapp.security.CustomUserDetails;

@Service
public interface CustomerMapper {
	Optional<CustomUserDetails> loadUserByUsername(String id);

	int register(@Param("username") String username, @Param("userid") String userid, @Param("password") String password,
			@Param("email") String email, @Param("nickname") String nickname, @Param("area") String area);

	int insertUserInfo(@Param("id") String id, @Param("pw") String pw, @Param("auth") String auth);

	int selectUserIdDistinct(@Param("id") String id);

	String selectUserIdForFoundid(@Param("username") String username, @Param("email") String email);

	int selectUserPw(@Param("username") String username, @Param("userid") String userid, @Param("email") String email);

	List<BoardVO> list();

	List<BoardVO> listCate(@Param("cate") String cate);

	BoardVO searchItem(@Param("num") String num);
	List<EcoVO> listEco();
	int getCount();

	void write(@Param("data") Map<String, String> data);

	int updateTempUserPw(@Param("userid") String userid, @Param("tempPw") String tempPw);

	String test();
}
