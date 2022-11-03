package com.alpaca.alpacaAuction.service;

import com.alpaca.alpacaAuction.model.Interest;

public interface InterestService {

	Interest select(Interest interest);

	int insert(Interest interest);

}
