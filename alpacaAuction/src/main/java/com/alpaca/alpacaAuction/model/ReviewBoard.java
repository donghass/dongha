package com.alpaca.alpacaAuction.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ReviewBoard {
	private int review_no;
	private String title;
	private String contents;
	private String review_img;
	private int read_cnt;
	private String del;
	private Date reg_date;
	private int rating;
	private int ref;
	private int re_step;
	private int re_level;
	private String id;
	private int auction_no;
	private MultipartFile file;
	
	//검색용
	private String search;
	private String keyword;
	//paging용
	private int startRow;
	private int endRow;
	//join용
	private int item_name;
}
