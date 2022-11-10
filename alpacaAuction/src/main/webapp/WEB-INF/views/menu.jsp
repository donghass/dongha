<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/alpacaAuction/resources/bootstrap/css/style.css">
</head> 
<body>
	<div class="dropMenu">
		<ul class="myMenu">
			<li class="menu1"><a href="auctionList.do">경매목록</a></li>
			<li class="menu2"><a href="rbList.do">구매 후기 게시판</a>
			</li>
			<li class="menu4"><a href="myPageMain.do">마이페이지</a>
				<ul class="menu4_s submenu">
					<li><a href="updateForm.do">내 정보 수정</a></li>
					<li><a href="myBuySell.do">내 입찰</a></li>
					<li><a href="interest.do">관심물품</a></li>
					<li><a href="myReview.do">내가 쓴 글</a></li>
				</ul>
			</li>
			<li class="menu5"><a href="insertItemForm.do">경매 물품 등록</a>
			<!-- 	<ul class="menu5_s submenu">
					<li><a href="">공지사항</a></li>
					<li><a href="">문의내역</a></li>
					<li><a href="">1:1 문의하기</a></li>
				</ul> -->
			</li>
		</ul>
	</div>
</body>
</html>