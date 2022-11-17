package com.alpaca.alpacaAuction.dao;

import java.util.List;
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

	@Override
	public int getTotal(Interest interest) {
		return sst.selectOne("interestns.getTotal",interest);
	}

	@Override
	public List<Interest> list(Interest interest) {
		return sst.selectList("interestns.list",interest);
	}

	@Override
	public int delete(int interest_no) {
		return sst.delete("interestns.delete",interest_no);
	}
	
}
