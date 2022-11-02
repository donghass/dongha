package com.alpaca.alpacaAuction.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alpaca.alpacaAuction.dao.ReviewBoardDao;
import com.alpaca.alpacaAuction.model.ReviewBoard;


@Service
public class ReviewBoardServiceImpl implements ReviewBoardService{
	@Autowired
	private ReviewBoardDao rbd;

	public int insert(ReviewBoard review_board) {
		return rbd.insert(review_board);
	}

	public int getTotal(ReviewBoard review_board) {
		return rbd.getTotal(review_board);
	}

	public List<ReviewBoard> list(ReviewBoard review_board) {
		return rbd.list(review_board);
	}

	public void updateReadcount(int review_no) {
		rbd.updateReadcount(review_no);
	}

	public ReviewBoard select(int review_no) {
		return rbd.select(review_no);
	}

	public int update(ReviewBoard review_board) {
		return rbd.update(review_board);
	}

	public int delete(int review_no) {
		return rbd.delete(review_no);
	}

}
