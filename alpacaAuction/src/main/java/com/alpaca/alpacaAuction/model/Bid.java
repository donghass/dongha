package com.alpaca.alpacaAuction.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Bid {
	private int bid_no;
	private int bid_price;
	private Timestamp bid_date;
	private String id;
	private int auction_no;
}
