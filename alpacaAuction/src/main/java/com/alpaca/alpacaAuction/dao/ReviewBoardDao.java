package com.alpaca.alpacaAuction.dao;

import java.util.List;

import com.alpaca.alpacaAuction.model.ReviewBoard;

public interface ReviewBoardDao {

	int insert(ReviewBoard review_board);

	int getTotal(ReviewBoard review_board);

	List<ReviewBoard> list(ReviewBoard review_board);

	void updateReadcount(int review_no);

	ReviewBoard select(int review_no);

	int update(ReviewBoard review_board);

	int delete(int review_no);

	int BdRollback(int review_no);

}
