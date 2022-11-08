package com.alpaca.alpacaAuction.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.alpaca.alpacaAuction.model.Tag;

@Repository
public class TagDaoImpl implements TagDao{
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public List<Tag> list() {
		// TODO Auto-generated method stub
		return sst.selectList("tagns.list");
	}

	@Override
	public List<Tag> tagList(int tagValue) {
		// TODO Auto-generated method stub
		return sst.selectList("tagns.tagList",tagValue);
	}
}
