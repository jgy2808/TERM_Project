package com.jgy.webapp.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jgy.webapp.dao.BoardDAO;
import com.jgy.webapp.domain.BoardVO;

@Service
public class BoardServicelmpl implements BoardService {
	@Autowired
	private BoardDAO dao;
	
	@Override
	public List<BoardVO> list() throws Exception {
		return dao.list();
	}
	
	@Override
	public BoardVO searchItem(String num) throws Exception {
		return dao.searchItem(num);
	}
	
	@Override
	public void write(Map<String, String> map) throws Exception {
		dao.write(map);
		
	}
	
	@Override
	public List<BoardVO> listCate(String cate) {
		return dao.listCate(cate);
	}
}
