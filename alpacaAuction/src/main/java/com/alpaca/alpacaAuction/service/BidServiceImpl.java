package com.alpaca.alpacaAuction.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alpaca.alpacaAuction.dao.BidDao;
import com.alpaca.alpacaAuction.model.Bid;

@Service
public class BidServiceImpl implements BidService{
	@Autowired
	private BidDao bd;

	@Override
	public Bid selectMax(int auction_no) {
		// TODO Auto-generated method stub
		return bd.selectMax(auction_no);
	}
}
