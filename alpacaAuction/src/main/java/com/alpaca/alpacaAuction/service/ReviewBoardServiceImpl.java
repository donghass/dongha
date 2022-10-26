package com.alpaca.alpacaAuction.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alpaca.alpacaAuction.dao.ReviewBoardDao;

@Service
public class ReviewBoardServiceImpl implements ReviewBoardService{
	@Autowired
	private ReviewBoardDao rbd;
}
