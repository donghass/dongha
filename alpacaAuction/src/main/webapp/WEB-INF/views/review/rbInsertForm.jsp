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
<div class="container" align="center">
<form action="rbInsert.do" class="form-horizontal" method="post" enctype="multipart/form-data">
	<input type="hidden" name="id" value="${id }">
	<input type="hidden" name="item_name" value="${auction.item_name } }">
	<input type="hidden" name="auction_no" value="${auction.auction_no }">
	<div class="form-group"><label for="Title" class="col-xs-2 col-lg-2 control-label">제목</label><div class="col-xs-10 col-lg-10"><input required="required" type="text" class="form-control" name="title" autofocus="autofocus" placeholder="제목"></div></div>
	<div class="form-group"><label for="Title" class="col-xs-2 col-lg-2 control-label">상품명</label><div class="col-xs-10 col-lg-10">${auction.item_name }</div></div>
	<div class="form-group"><label for="Title" class="col-xs-2 col-lg-2 control-label">후기 사진</label><div class="col-xs-10 col-lg-10"><input required="required" type="file" name="file" class="form-control"></div></div>
	<div class="form-group"><label for="Title" class="col-xs-2 col-lg-2 control-label">작성자</label><div class="col-xs-10 col-lg-10">${id }</div></div>
	<div class="form-group"><label for="Title" class="col-xs-2 col-lg-2 control-label">내용</label><div class="col-xs-10 col-lg-10"><textarea required="required" class="form-control col-xs-10 col-lg-10" name="contents" placeholder="내용"></textarea></div></div>
<div id="myform">  
 <fieldset name="rating">
		<span class="text-bold">별점을 선택해주세요</span>
		<input type="radio" name="rating" value="1" id="rate1"><label
			for="rate1">★</label>
		<input type="radio" name="rating" value="2" id="rate2"><label
			for="rate2">★</label>
		<input type="radio" name="rating" value="3" id="rate3"><label
			for="rate3">★</label>
		<input type="radio" name="rating" value="4" id="rate4"><label
			for="rate4">★</label>
		<input type="radio" name="rating" value="5" id="rate5"><label
			for="rate5">★</label>
</fieldset>
</div>
<table>
	<tr><td colspan="2"><input type="submit" value="등록" class="btn btn-info" ></td></tr>
</table>
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