package com.alpaca.alpacaAuction.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyPageDaoImpl implements MyPageDao{
	@Autowired
	private SqlSessionTemplate sst;
}
