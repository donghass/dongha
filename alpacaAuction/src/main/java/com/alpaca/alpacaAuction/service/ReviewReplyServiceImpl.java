package com.alpaca.alpacaAuction.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alpaca.alpacaAuction.dao.ReviewReplyDao;
import com.alpaca.alpacaAuction.model.ReviewReply;


@Service
public class ReviewReplyServiceImpl implements ReviewReplyService{
	@Autowired
	private ReviewReplyDao rrd;

	public List<ReviewReply> list(int re_no) {
		return rrd.list(re_no);
	}

	public void insert(ReviewReply review_reply) {
		rrd.insert(review_reply);
	}

	public void update(ReviewReply review_reply) {
		rrd.update(review_reply);
	}

	public void delete(ReviewReply review_reply) {
		rrd.delete(review_reply);
	}

	
}
