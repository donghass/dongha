package com.alpaca.alpacaAuction.dao;

import com.alpaca.alpacaAuction.model.Bid;

public interface BidDao {

	Bid selectMax(int auction_no);

}
