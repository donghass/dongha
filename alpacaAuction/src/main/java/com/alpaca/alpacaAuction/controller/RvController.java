package com.alpaca.alpacaAuction.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alpaca.alpacaAuction.service.ReviewBoardService;

@Controller
public class RvController {
	@Autowired
	private ReviewBoardService rbs;
	
	@RequestMapping("rbInsertForm")
	public String rbInsertForm() {
		
		return "/review/rbInsertForm";
	}
}
