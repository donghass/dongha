package com.alpaca.alpacaAuction.service;

import java.util.List;

import com.alpaca.alpacaAuction.model.ReviewReply;

public interface ReviewReplyService {

	List<ReviewReply> list(int re_no);

	void insert(ReviewReply review_reply);

	void update(ReviewReply review_reply);

	void delete(ReviewReply review_reply);



}
