package com.alpaca.alpacaAuction.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Member {
	private String id;
	private String password;
	private String name;
	private String call;
	private String email;
	private String address;
	private Date created_date;
	private String del;
	private String authority;
	private String age;
	private String gender;
}
