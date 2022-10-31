package com.alpaca.alpacaAuction.dao;

import java.util.List;

import com.alpaca.alpacaAuction.model.Bid;

public interface BidDao {

	int selectMax(int auction_no);

	void insert(Bid bid);

	int getMaxNum();

	List<Bid> list(int auction_no);

}
