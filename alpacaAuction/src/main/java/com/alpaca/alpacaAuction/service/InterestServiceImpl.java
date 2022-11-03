package com.alpaca.alpacaAuction.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alpaca.alpacaAuction.dao.InterestDao;
import com.alpaca.alpacaAuction.model.Interest;

@Service
public class InterestServiceImpl implements InterestService{
	@Autowired
	private InterestDao iid;

	@Override
	public Interest select(Interest interest) {
		// TODO Auto-generated method stub
		return iid.select(interest);
	}

	@Override
	public int insert(Interest interest) {
		// TODO Auto-generated method stub
		return iid.insert(interest);
	}
}
