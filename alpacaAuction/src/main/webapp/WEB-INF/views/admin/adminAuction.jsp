<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="container">
	<h2 class="text-primary">판매 현황</h2>
	<table class="table table-bordered">
		<tr><th>판매자</th><th>상품 번호</th><th>상품명</th><th>현재가</th><th>입찰자</th><th>경매 종료일</th><th>경매 현황</th><th>경매 삭제</th></tr>
		<c:if test="${empty list }">
			<tr><td colspan="7">판매 상품이 없습니다</td></tr>
		</c:if>
		<c:if test="${not empty list }">
			<c:forEach var="auction" items="${list}">
				<tr>
					<td>${auction.id }</td>
					<td><a href="auctionDetail.do?auction_no=${auction.auction_no }&result=-1&pageNum=${pb.currentPage}" class="btn btn-primary">${auction.auction_no }</a></td>
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
							<c:if test="${auction.pay == 'n' }">
								<td><a href="auctionPaid.do?auction_no=${auction.auction_no}&pageNum=${pageNum }">
											<span class="btn btn-success">낙찰 확정</span></a></td>
							</c:if>
							<c:if test="${auction.pay == 'y' }">
								<td><span class="btn btn-secondary">낙찰 확정(입금완료)</span></td>
							</c:if>
						</c:if>
						<c:if test="${auction.yes_or_no == 'false'}">
							<td>경매중</td>
						</c:if>
						<c:if test="${auction.del== 'n'}">
							<td><a href="auctionDelete.do?auction_no=${auction.auction_no}&pageNum=${pageNum }">
											<span class="btn btn-danger">삭제</span></a></td>
						</c:if>
						<c:if test="${auction.del == 'y'}">
							<td class="danger">삭제되었습니다</td>
						</c:if>
						
				</tr>
			</c:forEach>
		</c:if>
	</table>
<div align="center">
	<ul class="pagination">
		<!-- 시작페이지가 pagePerBlock보다 크면 앞에 보여줄것이 없다 -->
		<c:if test="${pb.startPage > pb.pagePerBlock }">
			<li><a href="adminAuction.do?pageNum=1"><span class="glyphicon glyphicon-fast-backward"></span></a></li>
			<li><a href="adminAuction.do?pageNum=${pd.startPage-1 }"><span class="glyphicon glyphicon-triangle-left"></span></a></li>
		</c:if>
		<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
		<c:if test="${pb.currentPage == i }">
			<li class="active"><a href="adminAuction.do?pageNum=${i }">${i }</a></li>
		</c:if>
		<c:if test="${pb.currentPage != i }">
			<li><a href="adminAuction.do?pageNum=${i }">${i }</a></li>
		</c:if>
		</c:forEach>
		<!-- engPage보다 totalPage가 크면 뒤에 보여줄것이 있다 -->
		<c:if test="${pb.endPage < pb.totalPage }">
			<li><a href="adminAuction.do?pageNum=${pb.endPage+1 }"><span class="glyphicon glyphicon-triangle-right"></span></a></li>
			<li><a href="adminAuction.do?pageNum=${pb.totalPage }"><span class="glyphicon glyphicon-fast-forward"></span></a></li>
		</c:if>
	</ul>
</div>
</div>
</body>
</html>