package com.alpaca.alpacaAuction.controller;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alpaca.alpacaAuction.model.Auction;
import com.alpaca.alpacaAuction.model.Bid;
import com.alpaca.alpacaAuction.model.Interest;
import com.alpaca.alpacaAuction.model.Member;
import com.alpaca.alpacaAuction.model.ReviewBoard;
import com.alpaca.alpacaAuction.service.AuctionService;
import com.alpaca.alpacaAuction.service.BidService;
import com.alpaca.alpacaAuction.service.InterestService;
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
	@Autowired
	private InterestService is;
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
 @RequestMapping("interestPage")
 public String interestPage(String pageNum, HttpSession session, Model model, Interest interest) {
	 String id = (String)session.getAttribute("id");
	 interest.setId(id);	// 이전 페이지에서 id값을 보내주지 않은 경우 이렇게 id값을 셋팅한다
	 int rowPerPage = 10;	// 한 화면에 보여주는 페이지 수
		if(pageNum == null || pageNum.equals(""))pageNum="1";
		int currentPage = Integer.parseInt(pageNum);
		int total = is.getTotal(interest);
		int startRow = (currentPage - 1) * rowPerPage +1;
		int endRow = startRow + rowPerPage -1;
		int num = total - startRow + 1;
		interest.setStartRow(startRow);
		interest.setEndRow(endRow);
		List<Interest> list = is.list(interest);
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		for(Interest i : list) {
			if(bs.selectMax(i.getAuction_no())==0) {
				i.setBid_price(i.getStart_price());
			}else {
				i.setBid_price(bs.selectMax(i.getAuction_no()));
			}
		}
		
		model.addAttribute("id",id);
		model.addAttribute("interest",interest);
		model.addAttribute("num",num);
		model.addAttribute("list",list);
		model.addAttribute("pb",pb);
	 return "myPage/interestPage";
 }
 @RequestMapping("myBuySell")
 public String myBuySell(String pageNum, HttpSession session, Model model,Auction auction){
	 String id = (String)session.getAttribute("id");
	 auction.setId(id);	// 세션에 아이디 넣어줌
	 int rowPerPage1 = 10;	// 한 화면에 보여주는 페이지 수
		if(pageNum == null || pageNum.equals(""))pageNum="1";
		int currentPage1 = Integer.parseInt(pageNum);
		int total1 = as.getTotal(auction);
		int startRow1 = (currentPage1 - 1) * rowPerPage1 +1;
		int endRow1 = startRow1 + rowPerPage1 -1;
		int num1 = total1 - startRow1 + 1;
	int rowPerPage2 = 10;	// 한 화면에 보여주는 페이지 수
		if(pageNum == null || pageNum.equals(""))pageNum="1";
		int currentPage2 = Integer.parseInt(pageNum);
		int total2 = as.getTotal(auction);
		int startRow2 = (currentPage2 - 1) * rowPerPage2 +1;
		int endRow2 = startRow2 + rowPerPage2 -1;
		int num2 = total2 - startRow2 + 1;
		auction.setStartRow(startRow1);
		auction.setEndRow(endRow1);
		auction.setStartRow(startRow2);
		auction.setEndRow(endRow2);
		List<Auction> bList = as.bList(id);
		List<Auction> sList = as.sList(auction);
		PagingBean pb1 = new PagingBean(currentPage1, rowPerPage1, total1);
		PagingBean pb2 = new PagingBean(currentPage2, rowPerPage2, total2);
		Timestamp today=new Timestamp(System.currentTimeMillis());
		for(Auction a : bList) {
			if(bs.selectMax(a.getAuction_no())==0) {
				a.setBid_price(a.getStart_price());
			}else {
				a.setBid_price(bs.selectMax(a.getAuction_no()));
			}
			a.setMy_bid(bs.selectMyBid(id,a.getAuction_no()));
			a.setYes_or_no(String.valueOf(a.getEnd_date().before(today)));
		}
		for(Auction a : sList) {
			if(bs.selectMax(a.getAuction_no())==0) {
				a.setBid_price(a.getStart_price());
			}else {
				a.setBid_price(bs.selectMax(a.getAuction_no()));
			}
			a.setBidName(bs.selectMaxId(a.getBid_price()));
			a.setMy_bid(bs.selectMyBid(id,a.getAuction_no()));
			a.setYes_or_no(String.valueOf(a.getEnd_date().before(today)));
		}
		model.addAttribute("id",id);
		model.addAttribute("auction",auction);
		model.addAttribute("num1",num1);
		model.addAttribute("num2",num2);
		model.addAttribute("bList",bList);
		model.addAttribute("sList",sList);
		model.addAttribute("pb1",pb1);
		model.addAttribute("pb2",pb2);
	 
	 return "myPage/myBuySell";
 }
 @RequestMapping("iDelete")
	public String iDelete(Model model, int interest_no, String pageNum) {
		int result = 0;
		result = is.delete(interest_no);
		model.addAttribute("result",result);
		return "myPage/iDelete";
	}
}
