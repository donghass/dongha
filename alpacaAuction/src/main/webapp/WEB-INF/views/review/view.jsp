<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="rvheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function() {
		var rp = document.getElementById("reply");
			
	}
	$()unction() {
		$('#a1').click(function() {
			if($(this).width()==100)
				$(this).width(500);
			else $(this).width(100);
		});
	});
	$(function() {
		$('#replyListDisp').load('${path}/replyList.do?re_no=${review_board.review_no}');
		$('#rbDisp').load("rbList.do", "pageNum=${pageNum}");
		$('#rInsert').click(function() {
			var sendData = $('#frm1').serialize();
			$.post('${path}/rInsert.do', sendData, function(data) {
				alert("댓글 입력 완료")
				$('#replyListDisp').html(data);
			});
		});
	});
</script>
</head>
<body>
<div class="container">
	<h2 class="text-primary">리뷰 상세</h2>
	<table class="table table-striped">
		<tr><th>상품명</th><td>${review_board.item_name }</td></tr>
		<tr><th>제목</th><td>${review_board.title}</td></tr>
		<tr><th>사진</th>
		<td><img alt="" src="/resources/upload/${review_board.review_img }" width="100" id="a1"> ${review_board.review_img }</td></tr>
		<tr><th>내용</th><td>${review_board.contents }</td></tr>
		<tr><th>별점</th><td>${review_board.rating }</td></tr>
		<tr><th>작성자(구매자)</th><td>${review_board.id }</td></tr>
		<tr><th>작성일</th><td>${review_board.reg_date }</td></tr>
	</table>
<form action="" name="frm1" id="frm1">
	<input type="hidden" name="re_no" value="${review_board.review_no }">
	<input type="hidden" name="replier" value="${review_board.id }">
	<table class="table table-hover">
		<tr><th>작성자</th><td>${review_board.id }</td>
			<th>댓글</th><td><pre><textarea rows="3" class="form-control" name="replytext"></textarea></pre></td>
			<td><input type="button" value="댓글 입력" id="rInsert" class="btn btn-primary"></td></tr>
	</table>
</form>

</div>
<div class="btn btn-primary" id="reply">댓글 보기</div>
<div id="replyListDisp"></div>
<div id="rbDisp"></div>
</body>
</html>