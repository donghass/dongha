package com.alpaca.alpacaAuction.service;

import java.util.List;

import com.alpaca.alpacaAuction.model.Member;
import com.alpaca.alpacaAuction.model.MemberPhoto;

public interface MemberService {
	Member select(String id);
	
	int insert(Member member);
	
	int update(Member member);
	
	int delete(String id);
	
	Member selectFindId(Member member);
	
	Member selectFindPw(Member member);
	
	int updatePw(Member member);

	int getMbTotal(Member member);

	List<Member> mbList(Member member);

	int MbRollback(String id);

//	void insertPhoto(List<MemberPhoto> photos);
	
//	List<MemberPhoto> listPhoto(String id);


}
