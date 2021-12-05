package com.jgy.webapp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.jgy.webapp.domain.BoardVO;


public interface BoardDAO {

	public List<BoardVO> list() throws Exception;
	public BoardVO searchItem(String num) throws Exception;
	public void write(Map<String, String> map) throws Exception;
	public List<BoardVO> listCate(@Param("cate") String cate);
}
