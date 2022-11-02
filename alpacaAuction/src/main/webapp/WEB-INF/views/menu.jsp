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
			<li class="menu1"><a href="cpList.do">경매목록</a></li>
			<li class="menu4"><a href="myMain.do">마이페이지</a>
				<ul class="menu4_s submenu">
					<li><a href="myMain.do">내 정보</a></li>
					<li><a href="updatePw.do">비밀번호 변경</a></li>
					<li><a href="driverApplyForm.do">드라이버 신청</a></li>
					<li><a href="vehicleList.do">차량정보 관리</a></li>
					<li><a href="favoriteList.do">좋아요</a></li>
				</ul>
			</li>   
			<li class="menu5"><a href="noticeList.do">고객센터</a>
				<ul class="menu5_s submenu">
					<li><a href="noticeList.do">공지사항</a></li>
					<li><a href="qnaList.do">문의내역</a></li>
					<li><a href="qnaWriteForm.do?num=0&pageNum=1">1:1 문의하기</a></li>
				</ul>
			</li>
		</ul>
	</div>
</body>
</html>