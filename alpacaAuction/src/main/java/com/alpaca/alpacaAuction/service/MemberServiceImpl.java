package com.alpaca.alpacaAuction.service;

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
}
