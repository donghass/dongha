package com.alpaca.alpacaAuction.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alpaca.alpacaAuction.model.Member;
import com.alpaca.alpacaAuction.model.ReviewBoard;
import com.alpaca.alpacaAuction.model.ReviewReply;
import com.alpaca.alpacaAuction.service.AuctionService;
import com.alpaca.alpacaAuction.service.BidService;
import com.alpaca.alpacaAuction.service.MemberService;
import com.alpaca.alpacaAuction.service.PagingBean;
import com.alpaca.alpacaAuction.service.ReviewBoardService;

@Controller
public class MyPageController {
	@Autowired
	private MemberService ms;
	@Autowired
	private AuctionService as;
	@Autowired
	private BidService bs;
	@Autowired
	private ReviewBoardService rbs;
 @RequestMapping("myPageMain")
 private String myPage(HttpSession session, Model model) {
	 String id = (String)session.getAttribute("id");
	 Member member = ms.select(id);
	 model.addAttribute("member", member);
	 model.addAttribute("id",id);
	 return "myPage/myPageMain";
 }
 @RequestMapping("myReview")
 private String myReview(String pageNum, ReviewBoard review_board, Model model) {
		int rowPerPage = 10;	// 한 화면에 보여주는 페이지 수
		if(pageNum == null || pageNum.equals(""))pageNum="1";
		int currentPage = Integer.parseInt(pageNum);
		int total = rbs.getTotal(review_board);
		int startRow = (currentPage - 1) * rowPerPage +1;
		int endRow = startRow + rowPerPage -1;
		int num = total - startRow + 1;
		review_board.setStartRow(startRow);
		review_board.setEndRow(endRow);
		List<ReviewBoard> list = rbs.list(review_board);
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		String[] title = {"작성자","제목","내용","제목+내용"};
		
		model.addAttribute("title",title);
		model.addAttribute("review_board",review_board);
		model.addAttribute("num",num);
		model.addAttribute("list",list);
		model.addAttribute("pb",pb);
	 return "myPage/myReview";
 }
}
