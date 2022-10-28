package com.alpaca.alpacaAuction.service;

import com.alpaca.alpacaAuction.model.Member;

public interface MemberService {
	Member select(String id);
	int insert(Member member);
	int update(Member member);
	int delete(String id);



}
