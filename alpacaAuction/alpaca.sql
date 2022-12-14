drop table member cascade constraint;
drop table auction_item cascade constraint;
drop table review_board cascade constraint;
drop table interest cascade constraint;
drop table bidding cascade constraint;
drop table interest_tag cascade constraint;
drop table tag cascade constraint;
drop table review_reply cascade constraint;
drop table qna_board cascade constraint;
--회원
CREATE TABLE member (
	id	varchar(40)	NOT NULL primary key,
	password	varchar(100)	NOT NULL,
	name	varchar(20)	NOT NULL,
	call	varchar(20)	NOT NULL,
	email	varchar(50)	NOT NULL,
	address	varchar(60)	NOT NULL,
	created_date	date	NOT NULL,
	del	char(1) DEFAULT 'n'	NOT NULL,
	authority	char(1) DEFAULT 'n'	NOT NULL,
	age	varchar(10) DEFAULT '20대'	NOT NULL,
	gender	char(1) DEFAULT 'm'	NOT NULL	
);
select * from member;
--태그목록
CREATE TABLE tag (
	tag_no	number(10)	NOT NULL primary key,
	tag_name	varchar(20)	NOT NULL
);

--경매 물품
CREATE TABLE auction_item (
	auction_no	number(10)	NOT NULL primary key,
	item_name	varchar(50)	NOT NULL,
	item_contents	varchar(300)	NOT NULL,
	item_img	varchar(200)	NOT NULL,
	start_date	date	NOT NULL,
	end_date	date	NOT NULL,
	start_price	number(10)	NOT NULL,
	min_bid	number(10)	NOT NULL,
	view_cnt	number(10)	NOT NULL,
	del	char(1) DEFAULT 'n'	NOT NULL,
	reg_date	date	NOT NULL,
	pay	char(1) default 'n' NOT NULL,
	id	varchar(40)	NOT NULL references member(id),
	tag_no	number(10)	NOT NULL references tag(tag_no)
);
--경매 후기 게시판
CREATE TABLE review_board (
	review_no	number(10)	NOT NULL primary key,
	title	varchar(40)	NOT NULL,
	contents	varchar(300)	NOT NULL,
	review_img	varchar(200)	NOT NULL,
	read_cnt	number(10)	NOT NULL,
	del	char(1) DEFAULT 'n'	NOT NULL,
	reg_date	date	NOT NULL,
	rating	number(5)	NOT NULL,
	id	varchar(40)	NOT NULL references member(id),
	auction_no	number(10)	NOT NULL references auction_item(auction_no)
);
--후기게시판 댓글
CREATE TABLE review_reply (
	re_no	number(10)	NOT NULL references review_board(review_no),
	rno	number(10)	NOT NULL,
	replytext	varchar(300)	NOT NULL,
	replier	varchar(40)	NOT NULL,
	reg_date	date	NOT NULL,
	updatedate	date	NOT NULL,
	del	char(1)	NOT NULL,
	id	varchar(40)	NOT NULL references member(id)
);
--관심물품
CREATE TABLE interest (
	interest_no	number(10)	NOT NULL primary key,
	id	varchar(40)	NOT NULL references member(id),
	auction_no	number(10)	NOT NULL references auction_item(auction_no)
);
--입찰
CREATE TABLE bidding (
	bid_no	number(10)	NOT NULL primary key,
	bid_price	number(10)	NOT NULL,
	bid_date	date	NOT NULL,
	id	varchar(40)	NOT NULL references member(id),
	auction_no	number(10)	NOT NULL references auction_item(auction_no)
);
--관심태그
CREATE TABLE interest_tag (
	it_tag_no	number(10)	NOT NULL primary key,
	id	varchar(40)	NOT NULL references member(id),
	tag_no number(10)	NOT NULL
);
--문의 게시판
CREATE TABLE qna_board (
	qna_no	number(10)	NOT NULL primary key,
	qna_title	varchar(40)	NULL,
	qna_contents	varchar(300)	NULL,
	del	char(1)		DEFAULT 'n' not NULL,
	reg_date	date	NULL,
	id	varchar(40)	NOT NULL references member(id)
);


