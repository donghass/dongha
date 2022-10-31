package com.alpaca.alpacaAuction.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alpaca.alpacaAuction.model.Bid;
import com.alpaca.alpacaAuction.service.BidService;

@Controller
public class BidController {
	@Autowired
	private BidService bs;
	@RequestMapping("bidInsert")
	public String bidInsert(Bid bid,Model model) {
		int bid_price = bs.selectMax(bid.getAuction_no());
		if(bid_price >= bid.getBid_price()) {
			model.addAttribute("auction_no",bid.getAuction_no());
			return "/auction/bidChk";
		}else {
			int bid_no=bs.getMaxNum();
			bid.setBid_no(bid_no);
			int result = bs.insert(bid);
			return "redirect:bidList.do?auction_no="+bid.getAuction_no();
		}
	}
	@RequestMapping("bidList")
	public String bidList(int auction_no,Model model) {
		List<Bid> bidList = bs.list(auction_no);
		model.addAttribute("bidList", bidList);
		return "/auction/bidList";
	}
}
