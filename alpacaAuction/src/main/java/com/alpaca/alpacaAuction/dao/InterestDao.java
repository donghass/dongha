package com.alpaca.alpacaAuction.dao;

import java.util.List;

import com.alpaca.alpacaAuction.model.Interest;

public interface InterestDao {

	Interest select(Interest interest);

	int insert(Interest interest);

	int getTotal(Interest interest);

	List<Interest> list(Interest interest);

	int delete(int interest_no);

}
