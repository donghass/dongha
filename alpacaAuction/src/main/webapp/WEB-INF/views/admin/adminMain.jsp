<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.thum {
    position: relative;
    height: 400px;
    text-align: center;
    vertical-align: middle;
    display: table !important;
    width: 360px;
    border-bottom: 1px solid #ddd;
    box-sizing: border-box;
    overflow: hidden;
   	size: 50px;
}
.thum img {
    max-width: 100% !important;
    max-height: 100% !important;
    width: auto !important;
    -ms-interpolation-mode: bicubic;
    border: 0;
    height: 400px !important;
    display: block;
    margin: 0 auto;
    
}</style>
</head>
<body>
<div class="container" align="center">
	<div class="row" align="center">
		<div class="col-xs-6 col-sm-4 thum">
		<a href="adminAuction.do">
			<img alt="" src="/alpacaAuction/resources/auction_images/auction.png">
			<span>경매 관리</span>
		</a>	
		</div>
		<div class="col-xs-6 col-sm-4 thum">
		<a href="adminBoard.do">
			<img alt="" src="/alpacaAuction/resources/auction_images/board.png">
			<span>게시판관리</span>
		</a>
		</div>
		<div class="col-xs-6 col-sm-4 thum">
		<a href="adminMb.do">
			<img alt="" src="/alpacaAuction/resources/auction_images/group-chat.png">
			<span>회원 관리</span>
		</a>
		</div>
	</div>
</div>
</body>
</html>