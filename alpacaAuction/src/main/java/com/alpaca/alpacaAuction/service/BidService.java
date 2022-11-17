package com.alpaca.alpacaAuction.service;

import java.util.List;

import com.alpaca.alpacaAuction.model.Bid;

public interface BidService {

	int selectMax(int auction_no);

	int insert(Bid bid);

	int getMaxNum();

	List<Bid> list(int auction_no);

	int getTotal(int i);

	int selectMyBid(String id, int auction_no);

	String selectMaxId(int bid_price, int auction_no);

}
