package com.alpaca.alpacaAuction.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alpaca.alpacaAuction.dao.TagDao;
import com.alpaca.alpacaAuction.model.Tag;

@Service
public class TagServiceImpl implements TagService{
	@Autowired
	private TagDao td;

	@Override
	public List<Tag> list() {
		// TODO Auto-generated method stub
		return td.list();
	}
}
