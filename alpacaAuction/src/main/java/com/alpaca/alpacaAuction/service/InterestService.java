package com.alpaca.alpacaAuction.service;

import java.util.List;

import com.alpaca.alpacaAuction.model.Interest;

public interface InterestService {

	Interest select(Interest interest);

	int insert(Interest interest);

	int getTotal(Interest interest);

	List<Interest> list(Interest interest);

	int delete(int interest_no);

}
