package com.jgy.webapp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jgy.webapp.domain.BoardVO;
import com.jgy.webapp.mapper.CustomerMapper;

@Repository
public class BoardDAOlmpl implements BoardDAO {

	@Autowired
	private SqlSession sql;
	private static String namespace = "com.jgy.webapp.mapper.CustomerMapper";
	
	@Override
	public List<BoardVO> list() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".list");
	}
	
	@Override
	public BoardVO searchItem(String num) throws Exception{
		return (BoardVO) sql.selectList(namespace + ".searchItem(" + num + ")");
	}
	
	@Override
	public void write(Map<String, String> map) throws Exception{
		sql.selectOne(namespace + ".write", map);
	}
	
	@Override
	public List<BoardVO> listCate(String cate) {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".listCate", cate);
	}
}
