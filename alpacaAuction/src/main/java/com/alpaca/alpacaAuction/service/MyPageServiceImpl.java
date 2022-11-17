package com.alpaca.alpacaAuction.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alpaca.alpacaAuction.dao.MyPageDao;

@Service
public class MyPageServiceImpl implements MyPageService{
	@Autowired
	private MyPageDao md;
}
