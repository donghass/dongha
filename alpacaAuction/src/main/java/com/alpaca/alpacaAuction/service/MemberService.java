package com.alpaca.alpacaAuction.service;

import java.util.List;

import com.alpaca.alpacaAuction.model.Member;
import com.alpaca.alpacaAuction.model.MemberPhoto;

public interface MemberService {
	Member select(String id);
	int insert(Member member);
	int update(Member member);
	int delete(String id);
	//void insertPhoto(List<MemberPhoto> photos);
//	List<MemberPhoto> listPhoto(String id);



}
