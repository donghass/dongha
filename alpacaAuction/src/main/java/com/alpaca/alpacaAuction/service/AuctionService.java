package com.alpaca.alpacaAuction.service;

import java.util.List;

import com.alpaca.alpacaAuction.model.Auction;

public interface AuctionService {

	int insert(Auction auction);

	int getMaxNum();

	int getTotal(Auction auction);

	List<Auction> list(Auction auction);

	void increaseViewCount(int auction_no);

	Auction select(int auction_no);

	List<Auction> bList(String id);

	List<Auction> sList(Auction auction);

}
