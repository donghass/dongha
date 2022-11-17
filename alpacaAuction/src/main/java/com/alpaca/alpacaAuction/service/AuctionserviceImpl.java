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

	@Override
	public List<Auction> bList(Auction auction) {
		return ad.bList(auction);
	}

	@Override
	public List<Auction> sList(Auction auction) {
		return ad.sList(auction);
	}

	@Override
	public int buyTotal(Auction auction) {
		return ad.buyTotal(auction);
	}

	@Override
	public int sellTotal(Auction auction) {
		return ad.sellTotal(auction);
	}

	@Override
	public int adminTotal() {
		// TODO Auto-generated method stub
		return ad.adminTotal();
	}

	@Override
	public List<Auction> adminList(Auction auction) {
		// TODO Auto-generated method stub
		return ad.adminList(auction);
	}

	@Override
	public int delete(int auction_no) {
		// TODO Auto-generated method stub
		return ad.delete(auction_no);
	}

	@Override
	public int paid(int auction_no) {
		// TODO Auto-generated method stub
		return ad.paid(auction_no);
	}
}
