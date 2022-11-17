package com.alpaca.alpacaAuction.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.alpaca.alpacaAuction.model.Member;

@Repository
public class MemberDaoImpl implements MemberDao{
	@Autowired
	private SqlSessionTemplate sst;

	public Member select(String id) {
		return sst.selectOne("memberns.select", id);
	}

	public int insert(Member member) {
		return sst.insert("memberns.insert", member);
	}

	public int update(Member member) {
		return sst.update("memberns.update", member);
	}

	public int delete(String id) {
		return sst.update("memberns.delete", id);
	}

	public Member selectFindId(Member member) {
		return sst.selectOne("memberns.selectFindId", member);
	}

	public Member selectFindPw(Member member) {
		return sst.selectOne("memberns.selectFindPw", member);
	}

	public int updatePw(Member member) {
		return sst.update("memberns.updatePw", member);
	}

	@Override
	public int getMbTotal(Member member) {
		// TODO Auto-generated method stub
		return sst.selectOne("memberns.getMbTotal",member);
	}

	@Override
	public List<Member> mbList(Member member) {
		// TODO Auto-generated method stub
		return sst.selectList("memberns.mbList",member);
	}

	@Override
	public int MbRollback(String id) {
		// TODO Auto-generated method stub
		return sst.update("memberns.MbRollback",id);
	}

	/*
	 * public void insertPh(MemberPhoto mp) { sst.insert("memberns.insertPh", mp); }
	 * 
	 * public List<MemberPhoto> listPhoto(String id) { return
	 * sst.selectList("memberns.listPhoto", id); }
	 */
}
