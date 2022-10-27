package com.alpaca.alpacaAuction.service;

import java.util.List;

import com.alpaca.alpacaAuction.model.ReviewBoard;

public interface ReviewBoardService {

	int insert(ReviewBoard review_board);

	int getTotal(ReviewBoard review_board);

	List<ReviewBoard> list(ReviewBoard review_board);

	void updateReadcount(int review_no);

	ReviewBoard select(int review_no);


}