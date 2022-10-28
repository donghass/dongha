package com.alpaca.alpacaAuction.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alpaca.alpacaAuction.dao.AuctionDao;
import com.alpaca.alpacaAuction.model.Auction;

@Service
public class AuctionserviceImpl implements AuctionService {
	@Autowired
	private AuctionDao ad;

	@Override
	public int insert(Auction auction) {
		return ad.insert(auction);
	}

	@Override
	public int getMaxNum() {
		return ad.getMaxNum();
	}
	
	@Override
	public int getTotal(Auction auction) {
		return ad.getTotal(auction);
	}

	@Override
	public List<Auction> list(Auction auction) {
		return ad.list(auction);
	}

	@Override
	public void increaseViewCount(int auction_no) {
		ad.increaseViewCount(auction_no);
	}

	@Override
	public Auction select(int auction_no) {
		// TODO Auto-generated method stub
		return ad.select(auction_no);
	}
}
