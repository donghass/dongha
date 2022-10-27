<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="rvheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$('#rbDisp').load("rbList.do", "pageNum=${pageNum}");
	});
</script>
</head>
<body>
<div class="container">
	<h2 class="text-primary">리뷰</h2>
	<table class="table table-striped">
		<tr><th>상품명</th><td>${review_board.item_name }</td></tr>
		<tr><th>제목</th><td>${review_board.title}</td></tr>
		<tr><th>사진</th><td>${review_board.review_img }</td></tr>
		<tr><th>내용</th><td>${review_board.contents }</td></tr>
		<tr><th>별점</th><td>${review_board.rating }</td></tr>
		<tr><th>작성자(구매자)</th><td>${review_board.id }</td></tr>
		<tr><th>작성일</th><td>${review_board.reg_date }</td></tr>
	</table>
<a class="btn btn-primary" href="rbReply.do?review_no=${review_no }">댓글</a>
</div>
<div id="rbDisp"></div>
</body>
</html>