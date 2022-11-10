package com.alpaca.alpacaAuction.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.alpaca.alpacaAuction.model.Member;
import com.alpaca.alpacaAuction.model.MemberPhoto;

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

	/*
	 * public void insertPh(MemberPhoto mp) { sst.insert("memberns.insertPh", mp); }
	 * 
	 * public List<MemberPhoto> listPhoto(String id) { return
	 * sst.selectList("memberns.listPhoto", id); }
	 */
}
