package com.alpaca.alpacaAuction.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.alpaca.alpacaAuction.model.Interest;

@Repository
public class InterestDaoImpl implements InterestDao{
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public Interest select(Interest interest) {
		
		return sst.selectOne("interestns.select",interest);
	}

	@Override
	public int insert(Interest interest) {
		// TODO Auto-generated method stub
		return sst.insert("interestns.insert",interest);
	}
	
}
