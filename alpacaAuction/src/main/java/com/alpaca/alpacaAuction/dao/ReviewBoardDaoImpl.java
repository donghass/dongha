package com.alpaca.alpacaAuction.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.alpaca.alpacaAuction.model.ReviewBoard;

@Repository
public class ReviewBoardDaoImpl implements ReviewBoardDao{
	@Autowired
	private SqlSessionTemplate sst;

	public int insert(ReviewBoard review_board) {
		return sst.insert("rvBoardns.insert",review_board);
	}

	public int getTotal(ReviewBoard review_board) {
		return sst.selectOne("rvBoardns.getTotal",review_board);
	}

	public List<ReviewBoard> list(ReviewBoard review_board) {
		return sst.selectList("rvBoardns.list",review_board);
	}

	public void updateReadcount(int review_no) {
		sst.update("rvBoardns.updateReadcount",review_no);
	}

	public ReviewBoard select(int review_no) {
		return sst.selectOne("rvBoardns.select",review_no);
	}

	public int update(ReviewBoard review_board) {
		return sst.update("rvBoardns.update",review_board);
	}

	public int delete(int review_no) {
		return sst.update("rvBoardns.delete",review_no);
	}

	@Override
	public int BdRollback(int review_no) {
		// TODO Auto-generated method stub
		return sst.update("rvBoardns.BdRollback",review_no);
	}

}
