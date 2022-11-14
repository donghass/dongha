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
	<h2 class="text-primary">판매 현황</h2>
	<table class="table table-bordered">
		<tr><th>구분</th><th>상품 번호</th><th>이미지</th><th>상품명</th><th>현재가</th><th>입찰자</th><th>경매 종료일</th><th>경매 현황</th></tr>
		<c:if test="${empty sList }">
			<tr><td colspan="7">판매 상품이 없습니다</td></tr>
		</c:if>
		<c:if test="${not empty sList }">
			<c:forEach var="auction" items="${sList}">
			<c:if test="${auction.id == id }">
				<tr><td>${auction.auction_no }</td>
					<td><a href="auctionDetail.do?auction_no=${auction.auction_no }&result=-1&pageNum=${pb.currentPage}" class="btn btn-primary">${auction.auction_no }</a></td>
					<td><img alt="" src="${path}/resources/auction_images/${auction.item_img }" width="100" id="a1"></td>
						<td>${auction.item_name }</td>
						<td>${auction.bid_price }</td>
						<c:if test="${auction.bidName != null}">
						<td>${auction.bidName }</td>
						</c:if>
						<c:if test="${auction.bidName == null}">
						<td>입찰자 없음</td>
						</c:if>
					<td>${auction.end_date }</td>
						<c:if test="${auction.yes_or_no == 'true'}">
						<td>경매 종료</td>
						</c:if>
						<c:if test="${auction.yes_or_no == 'false'}">
						<td>경매중</td>
						</c:if>
				</tr>
				</c:if>
			</c:forEach>
		</c:if>
	</table>
<div align="center">
	<ul class="pagination">
		<!-- 시작페이지가 pagePerBlock보다 크면 앞에 보여줄것이 없다 -->
		<c:if test="${pb.startPage > pb.pagePerBlock }">
			<li><a href="mySell.do?pageNum=1"><span class="glyphicon glyphicon-fast-backward"></span></a></li>
			<li><a href="mySell.do?pageNum=${pd.startPage-1 }"><span class="glyphicon glyphicon-triangle-left"></span></a></li>
		</c:if>
		<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
		<c:if test="${pb.currentPage == i }">
			<li class="active"><a href="mySell.do?pageNum=${i }">${i }</a></li>
		</c:if>
		<c:if test="${pb.currentPage != i }">
			<li><a href="mySell.do?pageNum=${i }">${i }</a></li>
		</c:if>
		</c:forEach>
		<!-- engPage보다 totalPage가 크면 뒤에 보여줄것이 있다 -->
		<c:if test="${pb.endPage < pb.totalPage }">
			<li><a href="mySell.do?pageNum=${pb.endPage+1 }"><span class="glyphicon glyphicon-triangle-right"></span></a></li>
			<li><a href="mySell.do?pageNum=${pb.totalPage }"><span class="glyphicon glyphicon-fast-forward"></span></a></li>
		</c:if>
	</ul>
</div>
</div>
</body>
</html>