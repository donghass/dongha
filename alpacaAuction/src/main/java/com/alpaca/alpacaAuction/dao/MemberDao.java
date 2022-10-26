package com.alpaca.alpacaAuction.dao;

import com.alpaca.alpacaAuction.model.Member;

public interface MemberDao {

	Member select(String id);

}
