<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
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
</script>
</head>
<body>
<div class="container">
	<h2 class="text-primary">구매 현황</h2>
	<table class="table table-bordered">
		<tr><th>구분</th><th>상품 번호</th><th>이미지</th><th>상품명</th><th>구매 가격</th><th>낙찰/구매일</th><th>판매자</th></tr>
		<c:if test="${empty list }">
			<tr><td colspan="7">관심 상품이 없습니다</td></tr>
		</c:if>
		<c:if test="${not empty list }">
			<c:forEach var="interest" items="${list}">
				<tr><td>${interest.interest_no }</td>
					<td><a href="auctionDetail.do?auction_no=${interest.auction_no }&result=-1&pageNum=${pb.currentPage}" class="btn btn-primary">${interest.item_name }</a></td>
					<td>${interest.item_name }</td>
					<td><img alt="" src="${path}/resources/upload/${interest.item_img }" width="100" id="a1"></td>
					<c:if test="${interest.bid_price == 0}">
						<td>${interest.start_price }</td>
					</c:if>
					<c:if test="${interest.bid_price != 0}">
						<td>${interest.bid_price }</td> 
					</c:if>
					<%-- <td>${interest.bid_price }</td> --%>
					<td>${interest.view_cnt }</td>
					<td>${interest.id }</td>
					<td>${interest.end_date }</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
<div align="center">
	<ul class="pagination">
		<!-- 시작페이지가 pagePerBlock보다 크면 앞에 보여줄것이 없다 -->
		<c:if test="${pb.startPage > pb.pagePerBlock }">
			<li><a href="rbList.do?pageNum=1&search=${review_board.search }&keyword=${review_board.keyword }"><span class="glyphicon glyphicon-fast-backward"></span></a></li>
			<li><a href="rbList.do?pageNum=${pd.startPage-1 }&search=${review_board.search }&keyword=${review_board.keyword }"><span class="glyphicon glyphicon-triangle-left"></span></a></li>
		</c:if>
		<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
		<c:if test="${pb.currentPage == i }">
			<li class="active"><a href="rbList.do?pageNum=${i }&search=${review_board.search}&keyword=${review_board.keyword}">${i }</a></li>
		</c:if>
		<c:if test="${pb.currentPage != i }">
			<li><a href="rbList.do?pageNum=${i }&search=${review_board.search}&keyword=${review_board.keyword}">${i }</a></li>
		</c:if>
		</c:forEach>
		<!-- engPage보다 totalPage가 크면 뒤에 보여줄것이 있다 -->
		<c:if test="${pb.endPage < pb.totalPage }">
			<li><a href="rbList.do?pageNum=${pb.endPage+1 }&search=${review_board.search}&keyword=${review_board.keyword}"><span class="glyphicon glyphicon-triangle-right"></span></a></li>
			<li><a href="rbList.do?pageNum=${pb.totalPage }&search=${review_board.search}&keyword=${review_board.keyword}"><span class="glyphicon glyphicon-fast-forward"></span></a></li>
		</c:if>
	</ul>
</div>
</div>
</body>
</html>