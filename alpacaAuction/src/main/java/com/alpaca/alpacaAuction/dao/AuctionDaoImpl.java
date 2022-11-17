package com.alpaca.alpacaAuction.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.alpaca.alpacaAuction.model.Auction;

@Repository
public class AuctionDaoImpl implements AuctionDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int insert(Auction auction) {
		return sst.insert("auctionns.insert",auction);
	}

	@Override
	public int getMaxNum() {
		return sst.selectOne("auctionns.getMaxNum");
	}

	@Override
	public int getTotal(Auction auction) {
		return sst.selectOne("auctionns.getTotal",auction);
	}

	@Override
	public List<Auction> list(Auction auction) {
		return sst.selectList("auctionns.list",auction);
	}

	@Override
	public void increaseViewCount(int auction_no) {
		sst.update("auctionns.increaseViewCount",auction_no);
	}

	@Override
	public Auction select(int auction_no) {
		// TODO Auto-generated method stub
		return sst.selectOne("auctionns.select",auction_no);
	}

	@Override
	public List<Auction> bList(Auction auction) {
		return sst.selectList("auctionns.bList",auction);
	}

	@Override
	public List<Auction> sList(Auction auction) {
		return sst.selectList("auctionns.sList",auction);
	}

	@Override
	public int buyTotal(Auction auction) {
		return sst.selectOne("auctionns.buyTotal",auction);
	}

	@Override
	public int sellTotal(Auction auction) {
		return sst.selectOne("auctionns.sellTotal",auction);
	}

	@Override
	public int adminTotal() {
		// TODO Auto-generated method stub
		return sst.selectOne("auctionns.adminTotal");
	}

	@Override
	public List<Auction> adminList(Auction auction) {
		// TODO Auto-generated method stub
		return sst.selectList("auctionns.adminList",auction);
	}

	@Override
	public int delete(int auction_no) {
		// TODO Auto-generated method stub
		return sst.update("auctionns.delete",auction_no);
	}

	@Override
	public int paid(int auction_no) {
		// TODO Auto-generated method stub
		return sst.update("auctionns.paid",auction_no);
	}
}
