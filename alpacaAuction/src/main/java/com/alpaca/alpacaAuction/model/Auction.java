package com.alpaca.alpacaAuction.model;

import java.sql.Date;
import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
@Data
public class Auction {
	//Date 를 timestamp로 바꾸면 시간도 나타냄 나중에 수정
	private int auction_no;
	private String item_name;
	private String item_contents;
	private String item_img;
	private Timestamp start_date;
	private Timestamp end_date;
	private int start_price;
	private int min_bid;
	private int view_cnt;
	private String del;
	private String delivery;
	private Date reg_date;
	private String pay;
	private String id;
	private int tag_no;
//	검색용
	private String search;
	private String keyword;
//	paging용
	private int startRow;
	private int endRow;
//	upload용
	private MultipartFile file;
//	datetime-local시간 받아오기
	private String sDate;
	private String eDate;
//	남은 시간
	private long min;
	private long hour;
	private long day;
//	최고입찰가
	private int bid_price;
//	입찰 수
	private int bid_cnt;
	private String bidName;
//	필터
	private String filter;
//	최대입찰가용
	private int my_bid;
//	경매여부
	private String yes_or_no;
}
