package com.alpaca.alpacaAuction.dao;

import java.util.List;

import com.alpaca.alpacaAuction.model.Member;
import com.alpaca.alpacaAuction.model.MemberPhoto;

public interface MemberDao {

	Member select(String id);

	int insert(Member member);

	int update(Member member);

	int delete(String id);


}
