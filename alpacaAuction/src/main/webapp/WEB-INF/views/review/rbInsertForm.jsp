<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="rvheader.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2 class="text-primary" align="center">구매 후기 작성</h2>
<div class="container">
<form action="rbInsert.do" name="myform" id="myform">
	<input type="hidden" name="id" value="${member.id }">
	<input type="hidden" name="auction_no" value="${review_board.auction_no }">
<table>
	<tr><th>상품명</th><td>${action_item.item_name }</td></tr>
	<tr><th>후기 사진</th><td><input type="file" name="review_img"></td></tr>
	<tr><th>작성자</th><td><input type="text" name=""></td></tr>
</table>
  <textarea class=form-control name="contents"></textarea>  
 <fieldset name="rating">
		<span class="text-bold">별점을 선택해주세요</span>
		<input type="radio" name="reviewStar" value="5" id="rate1"><label
			for="rate1">★</label>
		<input type="radio" name="reviewStar" value="4" id="rate2"><label
			for="rate2">★</label>
		<input type="radio" name="reviewStar" value="3" id="rate3"><label
			for="rate3">★</label>
		<input type="radio" name="reviewStar" value="2" id="rate4"><label
			for="rate4">★</label>
		<input type="radio" name="reviewStar" value="1" id="rate5"><label
			for="rate5">★</label>
</fieldset>

</form>
</div>
<script>
$('.summernote').summernote({
	  height: 150,
	  lang: "ko-KR"
	});
</script>

</body>
</html>