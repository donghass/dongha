package com.alpaca.alpacaAuction.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alpaca.alpacaAuction.model.Auction;
import com.alpaca.alpacaAuction.model.Bid;
import com.alpaca.alpacaAuction.model.Interest;
import com.alpaca.alpacaAuction.service.AuctionService;
import com.alpaca.alpacaAuction.service.BidService;
import com.alpaca.alpacaAuction.service.InterestService;
import com.alpaca.alpacaAuction.service.PagingBean;

@Controller
public class AuctionController {
	@Autowired
	private AuctionService as;
	@Autowired
	private BidService bs;
	@Autowired
	private InterestService is;
	@RequestMapping("insertItemForm")
	public String insertItemForm(Model model,HttpSession session) {
		String id = (String)session.getAttribute("id");
		model.addAttribute("id",id);
		return "auction/insertItemForm";
	}
	@RequestMapping("insertItem")
	public String insertItem(Auction auction ,Model model,HttpSession session) throws IOException, ParseException {
		int auction_no = as.getMaxNum();
		//datetime-local을 받기위해 날짜 시간포맷하기
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Timestamp start_date = new Timestamp(transFormat.parse(auction.getSDate().replace("T", " ")+":00").getTime());
		Timestamp end_date = new Timestamp(transFormat.parse(auction.getEDate().replace("T", " ")+":00").getTime());
		String fileName = auction.getFile().getOriginalFilename();
//		파일명을 변경하고 싶으면 UUID또는 long형으로 날짜 데이터
		auction.setItem_img(fileName);
		String real = session.getServletContext().getRealPath("/resources/auction_images");
		FileOutputStream fos = new FileOutputStream(new File(real+"/"+fileName));
		fos.write(auction.getFile().getBytes());
		fos.close();
		auction.setAuction_no(auction_no);
		auction.setStart_date(start_date);
		auction.setEnd_date(end_date);
		int result = as.insert(auction);
		model.addAttribute("result",result);
		return "auction/insertItem";
	}
	@RequestMapping("auctionList")
	public String auctionList(Auction auction,String pageNum,Model model) {
		int rowPerPage = 12; // 한 화면에 보여주는 갯수
		if (pageNum == null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int total = as.getTotal(auction);		
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		int num = total - startRow + 1;
		auction.setStartRow(startRow);
		auction.setEndRow(endRow);
		List<Auction> list = as.list(auction);
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);
		String[] title = {"판매자","물품명","내용"};
		//경매 남은시간 계산
		Timestamp now = new Timestamp(System.currentTimeMillis());
		for(Auction a:list) {
			long day = (a.getEnd_date().getTime() - now.getTime()) / (3600000*24); // 일
			long hour = ((a.getEnd_date().getTime() - now.getTime()) % (3600000*24)) / 3600000; // 시
			long min = (((a.getEnd_date().getTime() - now.getTime()) % (3600000*24)) % 3600000) / 60000; // 분
			a.setMin(min);
			a.setHour(hour);
			a.setDay(day);
//			최고입찰가 추가
			if(bs.selectMax(a.getAuction_no())==0) {
				a.setBid_price(a.getStart_price());
			}else {
				a.setBid_price(bs.selectMax(a.getAuction_no()));
			}
//			입찰수 추가
			a.setBid_cnt(bs.getTotal(a.getAuction_no()));
		}
		
		
		model.addAttribute("title", title);
//		매개변수로 넘어온 데이터 데이터를 다시 같은 jsp로 전달할 때는 model.addAttribute생략 가능
		model.addAttribute("auction", auction);
		model.addAttribute("num", num);
		model.addAttribute("list", list);
		model.addAttribute("pb", pb);
		return "auction/auctionList";
	}
	@RequestMapping("auctionDetail")
	public String auctionDetail(int auction_no,String pageNum,Model model,HttpSession session) {
		String id = (String)session.getAttribute("id");
		System.out.println("auction_no = "+auction_no);
		as.increaseViewCount(auction_no);
		Auction auction = as.select(auction_no);
		//			최고입찰가 추가
		System.out.println("aution = "+auction);
		if(bs.selectMax(auction.getAuction_no())==0) {
			auction.setBid_price(auction.getStart_price());
		}else {
			auction.setBid_price(bs.selectMax(auction.getAuction_no()));
		}
//		입찰수 추가
		auction.setBid_cnt(bs.getTotal(auction.getAuction_no()));
		model.addAttribute("id",id);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("auction",auction);
		return "auction/auctionDetail";
	}
	@RequestMapping("insertItemBot")
	public String insertItemBot() throws ParseException {
		String date_str1 = "2021-03-01 11:11:11";
		String date_str2 = "2022-12-28 14:58:11";
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Timestamp date1 = new Timestamp(transFormat.parse(date_str1).getTime());
		Timestamp date2 = new Timestamp(transFormat.parse(date_str2).getTime());
		for (int i = 0; i < 234; i ++) {
			int number = as.getMaxNum();
			Auction auction = new Auction();
			auction.setAuction_no(number);
			auction.setItem_name("육개장 사발면");
			auction.setItem_contents("dkdk");
			auction.setItem_img("ioi.jpg");
			auction.setStart_date(date1);
			auction.setEnd_date(date2);
			auction.setStart_price(9000);
			auction.setId("엄");
			auction.setMin_bid(500);
			as.insert(auction);
		}	
		return "auction/insertItemBot";
	}
	@RequestMapping("interestResister")
	public String interestResister(Interest interest,String pageNum,Model model,HttpSession session) {
		String id = (String)session.getAttribute("id");
		interest.setId(id);
		Interest is2 = is.select(interest);
		int result = 0;
		if(is2==null) {
			result = is.insert(interest);
		}
		model.addAttribute("result",result);
		model.addAttribute("auction_no",interest.getAuction_no());
		model.addAttribute("pageNum",pageNum);
		return "auction/interestRegister";
	}
}
