package com.alpaca.alpacaAuction.model;

import java.sql.Date;

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
	private String id;
	private int auction_no;
}
