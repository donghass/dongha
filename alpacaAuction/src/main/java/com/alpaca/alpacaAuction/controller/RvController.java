package com.alpaca.alpacaAuction.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alpaca.alpacaAuction.model.Auction;
import com.alpaca.alpacaAuction.model.ReviewBoard;
import com.alpaca.alpacaAuction.model.ReviewReply;
import com.alpaca.alpacaAuction.service.AuctionService;
import com.alpaca.alpacaAuction.service.PagingBean;
import com.alpaca.alpacaAuction.service.ReviewBoardService;

@Controller
public class RvController {
	@Autowired
	private ReviewBoardService rbs;
	@Autowired
	private AuctionService as;
	@RequestMapping("rbInsertForm")
	public String rbInsertForm(HttpSession session, Model model) {
		int auction_no =1;
		String id = (String)session.getAttribute("id");
		Auction auction = as.select(auction_no);
		model.addAttribute("id",id);
		model.addAttribute("auction",auction);
		return "review/rbInsertForm";
	}
	@RequestMapping("rbInsert")
	public String reInsert(ReviewBoard review_board, Model model, HttpSession session) throws IOException {
		int result = 0;
		String review_img = review_board.getFile().getOriginalFilename();
		review_board.setReview_img(review_img);
		String real = session.getServletContext().getRealPath("/resources/upload");
		FileOutputStream fos = new FileOutputStream(new File(real + "/" + review_img));
		fos.write(review_board.getFile().getBytes());
		fos.close();
		result = rbs.insert(review_board);
		model.addAttribute("result",result);
//		for(int i=0; i<230; i++) {
//			review_board.setAuction_no(0);
//			review_board.setContents("d"+i);
//			review_board.setReview_no(30+i);
//			review_board.setTitle("tt");
//			review_board.setRead_cnt(i);
//			review_board.setDel("n");
//			review_board.setReg_date(null);
//			review_board.setRating(i);
//			review_board.setId("dd");
//			review_board.setReview_img(review_img);
//			rbs.insert(review_board);
//		}
			
		return "review/rbInsert";
	}
	@RequestMapping("rbList")
	public String rbList(String pageNum, ReviewBoard review_board, Model model) {
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
		return "review/rbList";
	}
	@RequestMapping("rv_view")
	public String view(int review_no, String pageNum, Model model, HttpSession session, ReviewReply reply_review) {
		String id = (String)session.getAttribute("id");
		rbs.updateReadcount(review_no);
		ReviewBoard review_board = rbs.select(review_no);
		model.addAttribute("review_board",review_board);
		model.addAttribute("reply_review",reply_review);
		model.addAttribute("id",id);
		model.addAttribute("pageNum",pageNum);
		return "review/view";
	}
	@RequestMapping("reviewUpdateForm")
	public String reviewUpdateForm(HttpSession session, Model model, int review_no) {
			String id = (String)session.getAttribute("id");
			ReviewBoard review_board = rbs.select(review_no);
			model.addAttribute("review_board",review_board);
			model.addAttribute("id",id);
		return "review/reviewUpdateForm";
	}
	@RequestMapping("reviewUpdate")
	public String reviewUpdate(HttpSession session, Model model, ReviewBoard review_board) throws IOException {
		int result = 0;
		String review_img = review_board.getFile().getOriginalFilename();
		review_board.setReview_img(review_img);
		String real = session.getServletContext().getRealPath("/resources/upload");
		FileOutputStream fos = new FileOutputStream(new File(real + "/" + review_img));
		fos.write(review_board.getFile().getBytes());
		fos.close();
		result = rbs.update(review_board);
		model.addAttribute("result",result);
		model.addAttribute("review_board",review_board);
		return "review/reviewUpdate";
	}
	@RequestMapping("rbDelete")
	public String rbDelete(Model model, int review_no) {
		int result = 0;
		result = rbs.delete(review_no);
		model.addAttribute("result",result);
		return "review/rbDelete";
	}
}
