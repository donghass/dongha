package com.alpaca.alpacaAuction.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alpaca.alpacaAuction.model.ReviewBoard;
import com.alpaca.alpacaAuction.model.ReviewReply;
import com.alpaca.alpacaAuction.service.ReviewBoardService;
import com.alpaca.alpacaAuction.service.ReviewReplyService;

@Controller
public class RrController {
	@Autowired
	private ReviewBoardService rbs;
	@Autowired
	private ReviewReplyService rrs;
	
	@RequestMapping("replyList")
	private String replyList(int re_no, Model model, HttpSession session) {
		String id = (String)session.getAttribute("id");
		ReviewBoard review_board = rbs.select(re_no);
		List<ReviewReply> rrList = rrs.list(re_no);
		model.addAttribute("review_board",review_board);
		model.addAttribute("rrList",rrList);
		model.addAttribute("id",id);
		return "/review/replyList";
	}
	@RequestMapping("rInsert")
	public String rInsert(ReviewReply review_reply,HttpSession session, Model model) {
		String id = (String)session.getAttribute("id");
		// 이전 페이지에서 아이디를 넘겨주지 않으면 여기서 세션으로 가져온 아이디를 넘겨줘야한다
		review_reply.setId(id);
		rrs.insert(review_reply);
		// 값을 함께 보내주므로 redirect 사용
		
		model.addAttribute("id",id);
		return "redirect:/replyList.do?re_no="+review_reply.getRe_no();
	}
	@RequestMapping("rUpdate")
	public String rUpdate(ReviewReply review_reply) {
		rrs.update(review_reply);
		return "redirect:/replyList.do?re_no="+review_reply.getRe_no();
	}
	@RequestMapping("rDelete")
	public String rDelete(ReviewReply review_reply) {
		rrs.delete(review_reply);
		return "redirect:/replyList.do?re_no="+review_reply.getRe_no();
	}
}
