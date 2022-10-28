package com.alpaca.alpacaAuction.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.alpaca.alpacaAuction.model.Bid;
@Repository
public class BidDaoImpl implements BidDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public Bid selectMax(int auction_no) {
		// TODO Auto-generated method stub
		return sst.selectOne("bidns.selectMax",auction_no);
	}
}
