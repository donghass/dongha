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
		<tr><th>구분</th><th>상품 번호</th><th>이미지</th><th>상품명</th><th>현재 입찰가</th><th>내 입찰가</th><th>경매 종료일</th><th>판매자</th><th>경매 현황</th><th>리뷰</th></tr>
		<c:if test="${empty bList }">
			<tr><td colspan="7">구매 상품이 없습니다</td></tr>
		</c:if>
		<c:if test="${not empty bList }">
			<c:forEach var="auction" items="${bList}">
				<tr><td>${auction.auction_no }</td>
					<td><a href="auctionDetail.do?auction_no=${auction.auction_no }&result=-1&pageNum=${pb.currentPage}" class="btn btn-primary">${auction.auction_no }</a></td>
					<td><img alt="" src="${path}/resources/auction_images/${auction.item_img }" width="100" id="a1"></td>
						<td>${auction.item_name }</td>
						<td>${auction.bid_price }</td>
						<td>${auction.my_bid }</td>
					<td>${auction.end_date }</td>
					<td>${auction.id }</td>
						<c:if test="${auction.yes_or_no == 'true'}">
						<td>경매 종료</td>
						</c:if>
						<c:if test="${auction.yes_or_no == 'false'}">
						<td>경매중</td>
						</c:if>
						<td><c:if test="${auction.yes_or_no == 'true' && auction.bid_price == auction.my_bid}">
								<c:if test="${auction.pay == 'n' }">
									입금 대기중
								</c:if>
								<c:if test="${auction.pay == 'y' }">
									<a href="rbInsertForm.do?auction_no=${auction.auction_no }" class="btn btn-info">리뷰 작성</a>
								</c:if>
							</c:if>
							<c:if test="${auction.yes_or_no == 'true' && auction.bid_price != auction.my_bid}">낙찰 실패</c:if>
							<c:if test="${auction.yes_or_no == 'false'}">경매 진행중</c:if></td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
<div align="center">
	<ul class="pagination">
		<!-- 시작페이지가 pagePerBlock보다 크면 앞에 보여줄것이 없다 -->
		<c:if test="${pb.startPage > pb.pagePerBlock }">
			<li><a href="myBuy.do?pageNum=1"><span class="glyphicon glyphicon-fast-backward"></span></a></li>
			<li><a href="myBuy.do?pageNum=${pd.startPage-1 }"><span class="glyphicon glyphicon-triangle-left"></span></a></li>
		</c:if>
		<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
		<c:if test="${pb.currentPage == i }">
			<li class="active"><a href="myBuy.do?pageNum=${i }">${i }</a></li>
		</c:if>
		<c:if test="${pb.currentPage != i }">
			<li><a href="myBuy.do?pageNum=${i }">${i }</a></li>
		</c:if>
		</c:forEach>
		<!-- engPage보다 totalPage가 크면 뒤에 보여줄것이 있다 -->
		<c:if test="${pb.endPage < pb.totalPage }">
			<li><a href="myBuy.do?pageNum=${pb.endPage+1 }"><span class="glyphicon glyphicon-triangle-right"></span></a></li>
			<li><a href="myBuy.do?pageNum=${pb.totalPage }"><span class="glyphicon glyphicon-fast-forward"></span></a></li>
		</c:if>
	</ul>
</div>
</div>
</body>
</html>