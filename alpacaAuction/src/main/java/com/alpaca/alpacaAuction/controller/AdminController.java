package com.alpaca.alpacaAuction.controller;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alpaca.alpacaAuction.model.Auction;
import com.alpaca.alpacaAuction.model.Member;
import com.alpaca.alpacaAuction.model.ReviewBoard;
import com.alpaca.alpacaAuction.service.AuctionService;
import com.alpaca.alpacaAuction.service.BidService;
import com.alpaca.alpacaAuction.service.MemberService;
import com.alpaca.alpacaAuction.service.PagingBean;
import com.alpaca.alpacaAuction.service.ReviewBoardService;


@Controller
public class AdminController {
	@Autowired
	private MemberService ms;
	@Autowired
	private ReviewBoardService rbs;
	@Autowired
	private AuctionService as;
	@Autowired
	private BidService bs;
	@RequestMapping("adminMain")
	public String adminMain() {
		return "admin/adminMain";
	}
	@RequestMapping("adminMb")
	public String adminMbList(Member member, String pageNum, Model model) {
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1" ;
		}
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 10;	// 한 화면에 보여주는 게시글 갯수
		int total = ms.getMbTotal(member);
		int startRow = (currentPage -1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		member.setStartRow(startRow);
		member.setEndRow(endRow);
		List<Member> mbList = ms.mbList(member);	// 회원 목록
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		
		model.addAttribute("pb", pb);	// paginbean pb
		model.addAttribute("mbList", mbList);
		return "admin/adminMb";
	}
	@RequestMapping("adminMbDelete")
	public String adminMbDelete(Member member,Model model,String pageNum) {
		int result=0;
		result=ms.delete(member.getId());
		model.addAttribute("result",result);
		model.addAttribute("pageNum",pageNum);
		return "admin/adminMbDelete";
	}
	@RequestMapping("adminMbRollback")
	public String adminMbRollback(Member member,Model model,String pageNum) {
		int result=0;
		result=ms.MbRollback(member.getId());
		model.addAttribute("result",result);
		model.addAttribute("pageNum",pageNum);
		return "admin/adminMbRollback";
	}
	@RequestMapping("adminBoard")
	public String adminBoard( String pageNum, ReviewBoard review_board, Model model) {
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
		/*
		 * for(ReviewBoard r: list) { Auction a = as.select(r.getAuction_no());
		 * r.setItem_name(a.getItem_name()); }
		 */
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		String[] title = {"작성자","제목","내용","제목+내용"};
		model.addAttribute("title",title);
		model.addAttribute("review_board",review_board);
		model.addAttribute("num",num);
		model.addAttribute("list",list);
		model.addAttribute("pb",pb);
		return "admin/adminBoard";
	}
	@RequestMapping("adminBdDelete")
	public String adminBdDelete( String pageNum, ReviewBoard review_board, Model model) {
		int result=0;
		result=rbs.delete(review_board.getReview_no());
		model.addAttribute("result",result);
		model.addAttribute("pageNum",pageNum);
		return "admin/adminBdDelete";
	}
	@RequestMapping("adminBdRollback")
	public String adminBdRollback( String pageNum, ReviewBoard review_board, Model model) {
		int result=0;
		result=rbs.BdRollback(review_board.getReview_no());
		model.addAttribute("result",result);
		model.addAttribute("pageNum",pageNum);
		return "admin/adminBdRollback";
	}
	 @RequestMapping("adminAuction")
	 public String adminAuction(String pageNum, Model model,Auction auction){
		 	int rowPerPage = 10;	// 한 화면에 보여주는 페이지 수
			if(pageNum == null || pageNum.equals(""))pageNum="1";
			int currentPage = Integer.parseInt(pageNum);
			int total = as.adminTotal();
			int startRow = (currentPage - 1) * rowPerPage +1;
			int endRow = startRow + rowPerPage -1;
			int num = total - startRow + 1;
			auction.setStartRow(startRow);
			auction.setEndRow(endRow);
			List<Auction> list = as.adminList(auction);
			PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
			Timestamp today=new Timestamp(System.currentTimeMillis());
			for(Auction a : list) {
				if(bs.selectMax(a.getAuction_no())==0) {
					a.setBid_price(a.getStart_price());
				}else {
					a.setBid_price(bs.selectMax(a.getAuction_no()));
				}
				a.setBidName(bs.selectMaxId(a.getBid_price(),a.getAuction_no()));
				a.setYes_or_no(String.valueOf(a.getEnd_date().before(today)));
			}
			model.addAttribute("auction",auction);
			model.addAttribute("num",num);
			model.addAttribute("list",list);
			model.addAttribute("pb",pb);
		 
		 return "admin/adminAuction";
	 }
	 @RequestMapping("auctionDelete")
	 public String auctionDelete(Model model,Auction auction,String pageNum) {
	 	int result=0;
		result=as.delete(auction.getAuction_no());
		model.addAttribute("result",result);
		model.addAttribute("pageNum",pageNum);
		return "admin/auctionDelete";
	 }
	 @RequestMapping("auctionPaid")
	 public String auctionPaid(Model model,Auction auction,String pageNum) {
		 int result=0;
		 result=as.paid(auction.getAuction_no());
		 model.addAttribute("result",result);
		 model.addAttribute("pageNum",pageNum);
		 return "admin/auctionPaid";
	 }
}
