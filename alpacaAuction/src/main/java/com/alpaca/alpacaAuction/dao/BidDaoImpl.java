package com.alpaca.alpacaAuction.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.alpaca.alpacaAuction.model.Bid;
@Repository
public class BidDaoImpl implements BidDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int selectMax(int auction_no) {
		// TODO Auto-generated method stub
		return sst.selectOne("bidns.selectMax",auction_no);
	}

	@Override
	public int insert(Bid bid) {
		// TODO Auto-generated method stub
		return sst.insert("bidns.insert",bid);
	}

	@Override
	public int getMaxNum() {
		// TODO Auto-generated method stub
		return sst.selectOne("bidns.getMaxNum");
	}

	@Override
	public List<Bid> list(int auction_no) {
		// TODO Auto-generated method stub
		return sst.selectList("bidns.list",auction_no);
	}
}
