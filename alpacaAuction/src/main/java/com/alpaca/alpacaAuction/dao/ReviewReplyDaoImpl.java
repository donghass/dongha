package com.alpaca.alpacaAuction.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.alpaca.alpacaAuction.model.ReviewReply;

@Repository
public class ReviewReplyDaoImpl implements ReviewReplyDao{
	@Autowired
	private SqlSessionTemplate sst;
	public List<ReviewReply> list(int re_no) {
		return sst.selectList("rReplyns.list",re_no);
	}
	
	public void insert(ReviewReply review_reply) {
		sst.insert("rReplyns.insert",review_reply);
	}
	
	public void update(ReviewReply review_reply) {
		sst.update("rReplyns.update",review_reply);
	}
	
	public void delete(ReviewReply review_reply) {
		sst.update("rReplyns.delete",review_reply);
	}



}
