package com.alpaca.alpacaAuction.service;

import com.alpaca.alpacaAuction.model.Bid;

public interface BidService {

	Bid selectMax(int auction_no);

}
