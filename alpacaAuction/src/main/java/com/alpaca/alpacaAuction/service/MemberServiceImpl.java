package com.alpaca.alpacaAuction.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.alpaca.alpacaAuction.dao.MemberDao;
import com.alpaca.alpacaAuction.model.Member;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDao md;

	public Member select(String id) {
		return md.select(id);
	}

	public int insert(Member member) {
		return md.insert(member);
	}

	public int update(Member member) {
		return md.update(member);
	}

	public int delete(String id) {
		return md.delete(id);
	}

	public Member selectFindId(Member member) {
		return md.selectFindId(member);
	}

	public Member selectFindPw(Member member) {

		return md.selectFindPw(member);
	}

	public int updatePw(Member member) {
		return md.updatePw(member);
	}

	@Override
	public int getMbTotal(Member member) {
		// TODO Auto-generated method stub
		return md.getMbTotal(member);
	}

	@Override
	public List<Member> mbList(Member member) {
		// TODO Auto-generated method stub
		return md.mbList(member);
	}

	@Override
	public int MbRollback(String id) {
		// TODO Auto-generated method stub
		return md.MbRollback(id);
	}

	/*
	 * public void insertPhoto(List<MemberPhoto> photos) { for (MemberPhoto mp :
	 * photos) { md.insertPh(mp); } }
	 * 
	 * public List<MemberPhoto> listPhoto(String id) { return md.listPhoto(id); }
	 */
}
