package com.alpaca.alpacaAuction.dao;

import java.util.List;

import com.alpaca.alpacaAuction.model.Tag;

public interface TagDao {

	List<Tag> list();

	List<Tag> tagList(int tagValue);

}
