package com.alpaca.alpacaAuction.dao;

import com.alpaca.alpacaAuction.model.Interest;

public interface InterestDao {

	Interest select(Interest interest);

	int insert(Interest interest);

}
