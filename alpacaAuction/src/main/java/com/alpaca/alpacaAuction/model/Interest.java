package com.alpaca.alpacaAuction.model;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;
//관심물품
@Data
public class Interest {
	private int interest_no;
	private String id;
	private int auction_no;
	
	private int startRow;
	private int endRow;
	
	//조인용
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
	private int bid_price;
}