package com.alpaca.alpacaAuction.service;

import java.util.List;

import com.alpaca.alpacaAuction.model.Bid;

public interface BidService {

	int selectMax(int auction_no);

	void insert(Bid bid);

	int getMaxNum();

	List<Bid> list(int auction_no);

}
