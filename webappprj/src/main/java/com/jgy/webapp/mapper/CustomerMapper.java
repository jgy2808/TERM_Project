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

	int register( @Param("userid") String userid, @Param("username") String username, @Param("password") String password,
			@Param("email") String email, @Param("nickname") String nickname, @Param("area") String area);

	int selectUserIdDistinct(@Param("id") String id);

	String selectUserIdForFoundid(@Param("username") String username, @Param("email") String email);

	int selectUserPw(@Param("username") String username, @Param("userid") String userid, @Param("email") String email);

	List<BoardVO> list();

	List<BoardVO> listCate(@Param("cate") String cate);

	BoardVO searchItem(@Param("num") String num);
	List<EcoVO> listEco();
	int getCount();

	void write(@Param("data") Map<String, String> data);

	void updateTempUserPw(@Param("userid") String userid, @Param("tempPw") String tempPw);
	
	String search_image(@Param("recycle_title") String recycle_title);

}
