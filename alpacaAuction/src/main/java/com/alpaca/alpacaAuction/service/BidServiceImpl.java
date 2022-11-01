package com.alpaca.alpacaAuction.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alpaca.alpacaAuction.dao.BidDao;
import com.alpaca.alpacaAuction.model.Bid;

@Service
public class BidServiceImpl implements BidService{
	@Autowired
	private BidDao bd;

	@Override
	public int selectMax(int auction_no) {
		// TODO Auto-generated method stub
		return bd.selectMax(auction_no);
	}

	@Override
	public int insert(Bid bid) {
		return bd.insert(bid);
		
	}

	@Override
	public int getMaxNum() {
		// TODO Auto-generated method stub
		return bd.getMaxNum();
	}

	@Override
	public List<Bid> list(int auction_no) {
		// TODO Auto-generated method stub
		return bd.list(auction_no);
	}

	@Override
	public int getTotal(int i) {
		// TODO Auto-generated method stub
		return bd.getTotal(i);
	}
}
