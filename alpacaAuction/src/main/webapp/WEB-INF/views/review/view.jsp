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
		$('#a1').click(function() {
			if($(this).width()==100)
				$(this).width(500);
			else $(this).width(100);
		});
	});
	$(function() {
		$('#replyListDisp').load('${path}/replyList.do?re_no=${review_board.review_no}');
		$('#rbDisp').load("rbList.do", "review_no=${review_board.review_no }&pageNum=${pageNum}");
		$('#rInsert').click(function() {
			var sendData = $('#frm1').serialize();
			$.post('${path}/rInsert.do', sendData, function(data) {
				alert("댓글 입력 완료")
				$('#replyListDisp').html(data);
				frm1.replytext.value="";
			});
		});
		$('#reply').click(function() {
			$('#replyListDisp').toggle();
		});
	});
	function del() {
		var de = confirm("정말 삭제하시겠습니까?");
		if(de) location.href ="rbDelete.do?review_no=${review_board.review_no }&pageNum=${pageNum }";
		else{
			alert("삭제를 취소했습니다");
		}
	}
</script>
</head>
<body>
<div class="container">
	<h2 class="text-primary">리뷰 상세</h2>
	<table class="table table-striped">
	<!-- <tr><th>상품명</th><th>제목</th><th>사진</th><th>내용</th><th>별점</th> -->
		<tr><th class="col-md-3">상품명</th><td>${review_board.item_name }</td></tr>
		<tr><th>제목</th><td>${review_board.title}</td></tr>
		<tr><th>사진</th>
		<td><img alt="" src="${path}/resources/upload/${review_board.review_img }" width="100" id="a1"></td></tr>
		<tr><th>내용</th><td>${review_board.contents }</td></tr>
		<tr><th>별점</th><td>	<div id="myform">${review_board.rating }</div></td></tr>
		<tr><th>작성자(구매자)</th><td>${review_board.id }</td></tr>
		<tr><th>작성일</th><td>${review_board.reg_date }</td></tr>
	</table>
<div id="myform">
별점
	<fieldset name="rating">
		<c:forEach var="i" begin="1" end="5">
			<c:if test="${i == 6-review_board.rating }">
		<input type="radio" name="rating" value="${i }" id="rate${i }" checked="checked" readonly="readonly" disabled="disabled"><label for="rate${i }">★</label>
		</c:if>
		<c:if test="${i != 6-review_board.rating }">
			<input type="radio" name="rating" value="${i }" id="rate${i }" readonly="readonly" disabled="disabled"><label for="rate${i }">★</label>
		</c:if>
			</c:forEach>
	</fieldset>
</div>
	<c:if test="${review_board.id == id }">
		<a href="reviewUpdateForm.do?review_no=${review_board.review_no }&pageNum=${pageNum }" class="btn btn-info" >수정</a>
		<a onclick="del()" class="btn btn-danger">삭제</a>
	</c:if>
<form action="" name="frm1" id="frm1">
	<input type="hidden" name="re_no" value="${review_board.review_no }">
	<input type="hidden" name="replier" value="${id}">
	<table class="table table-hover">
		<tr><th>작성자</th><td>${id }</td>
			<th>댓글</th><td><pre><textarea rows="3" class="form-control" name="replytext"></textarea></pre></td>
			<td><input type="button" value="댓글 입력" id="rInsert" class="btn btn-primary"></td></tr>
	</table>
</form>

</div>
<div class="btn btn-primary" id="reply">댓글 보기</div>
<div id="replyListDisp"></div>
<div id="rbDisp"></div>
<script>
$('.summernote').summernote({
	  height: 150,
	  lang: "ko-KR"
	});
</script>
</body>
</html>