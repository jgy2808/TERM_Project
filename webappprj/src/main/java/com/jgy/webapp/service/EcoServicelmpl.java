package com.jgy.webapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jgy.webapp.dao.EcoDAO;
import com.jgy.webapp.domain.EcoVO;

@Service
public class EcoServicelmpl implements EcoService {
	@Autowired
	private EcoDAO dao;
	
	
	@Override
	public List<EcoVO> listEco() throws Exception {
		return dao.listEco();
	}

}
