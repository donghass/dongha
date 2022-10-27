package com.alpaca.alpacaAuction.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alpaca.alpacaAuction.model.ReviewBoard;
import com.alpaca.alpacaAuction.service.PagingBean;
import com.alpaca.alpacaAuction.service.ReviewBoardService;

@Controller
public class RvController {
	@Autowired
	private ReviewBoardService rbs;
	
	@RequestMapping("rbInsertForm")
	public String rbInsertForm() {
		return "/review/rbInsertForm";
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
		return "/review/rbInsert";
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
		return "/review/rbList";
	}
	@RequestMapping("view")
	public String view(int review_no, String pageNum, Model model) {
		rbs.updateReadcount(review_no);
		ReviewBoard review_board = rbs.select(review_no);
		model.addAttribute("review_board",review_board);
		model.addAttribute("pageNum",pageNum);
		return "/review/view";
	}
}
