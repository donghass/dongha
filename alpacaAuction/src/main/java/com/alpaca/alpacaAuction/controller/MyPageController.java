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
 @RequestMapping("myBuy")
 public String myBuy(String pageNum, HttpSession session, Model model,Auction auction){
	 String id = (String)session.getAttribute("id");
	 auction.setId(id);	// 세션에 아이디 넣어줌
	 int rowPerPage = 10;	// 한 화면에 보여주는 페이지 수
		if(pageNum == null || pageNum.equals(""))pageNum="1";
		int currentPage = Integer.parseInt(pageNum);
		int total = as.buyTotal(auction);
		int startRow = (currentPage - 1) * rowPerPage +1;
		int endRow = startRow + rowPerPage -1;
		int num = total - startRow + 1;
		auction.setStartRow(startRow);
		auction.setEndRow(endRow);
		List<Auction> bList = as.bList(auction);
		System.out.println("size = "+bList.size());
		System.out.println("total = "+total);
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
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
		model.addAttribute("id",id);
		model.addAttribute("auction",auction);
		model.addAttribute("num",num);
		model.addAttribute("bList",bList);
		model.addAttribute("pb",pb);
	 
	 return "myPage/myBuy";
 }
 @RequestMapping("mySell")
 public String mySell(String pageNum, HttpSession session, Model model,Auction auction){
	 String id = (String)session.getAttribute("id");
	 auction.setId(id);	// 세션에 아이디 넣어줌
	int rowPerPage = 10;	// 한 화면에 보여주는 페이지 수
		if(pageNum == null || pageNum.equals(""))pageNum="1";
		int currentPage = Integer.parseInt(pageNum);
		int total = as.sellTotal(auction);
		int startRow = (currentPage - 1) * rowPerPage +1;
		int endRow = startRow + rowPerPage -1;
		int num = total - startRow + 1;
		auction.setStartRow(startRow);
		auction.setEndRow(endRow);
		List<Auction> sList = as.sList(auction);
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		Timestamp today=new Timestamp(System.currentTimeMillis());
		for(Auction a : sList) {
			if(bs.selectMax(a.getAuction_no())==0) {
				a.setBid_price(a.getStart_price());
			}else {
				a.setBid_price(bs.selectMax(a.getAuction_no()));
			}
			a.setBidName(bs.selectMaxId(a.getBid_price(),a.getAuction_no()));
			a.setYes_or_no(String.valueOf(a.getEnd_date().before(today)));
		}
		model.addAttribute("id",id);
		model.addAttribute("auction",auction);
		model.addAttribute("num",num);
		model.addAttribute("sList",sList);
		model.addAttribute("pb",pb);
	 
	 return "myPage/mySell";
 }
 @RequestMapping("iDelete")
	public String iDelete(Model model, int interest_no, String pageNum) {
		int result = 0;
		result = is.delete(interest_no);
		model.addAttribute("result",result);
		return "myPage/iDelete";
	}
}
