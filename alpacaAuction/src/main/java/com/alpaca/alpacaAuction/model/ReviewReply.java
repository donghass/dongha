package com.alpaca.alpacaAuction.model;

import java.sql.Date;

import lombok.Data;

@Data
public class ReviewReply {
	private int re_no;	//원 게시글 번호
	private int rno;	// 입력할때마다 1씩 증가 댓글 번호
	private String replytext;
	private String replier;
	private Date reg_date;
	private Date updatedate;
	private String del;
}
