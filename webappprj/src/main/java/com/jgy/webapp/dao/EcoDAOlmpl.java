package com.jgy.webapp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jgy.webapp.domain.EcoVO;

@Repository
public class EcoDAOlmpl implements EcoDAO {

	@Autowired
	private SqlSession sql;
	private static String eco_namespace = "com.jgy.webapp.mapper.CustomerMapper";
	
	
	@Override
	public List<EcoVO> listEco() throws Exception {
		return sql.selectList(eco_namespace + ".listEco");
	}

}
