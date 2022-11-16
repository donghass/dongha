package com.alpaca.alpacaAuction.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Member {
	private String id;
	private String password;
	private String name;
	private String call;
	private String email;
	private String address;
	private String age;
	private String gender;
	private Date created_date;
	private String del;
	private String authority;
	
		// paging용
    private int startRow;
    private int endRow;
	
    
    // 검색용
    private String search;
    private String keyword;
}
