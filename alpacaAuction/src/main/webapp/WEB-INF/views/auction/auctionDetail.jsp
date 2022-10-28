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
		$('#bidListDisp').load('replyList.do?auction_no=${auction.auction_no}');
		$('#bidInsert').click(function() {
			/* 	var sendData = "auction_no="+frm1.auction_no.value+
					"&id="+frm1.id.value+
					"&bid_price="+frm1.bid_price.value; */
			var sendData = $('#frm1').serialize();
			$.post('bidInsert.do', sendData, function(data) {
				alert('입찰을 등록하셨습니다');
				$('#bidListDisp').html(data);
			});
		});
	});
</script>
</head>
<body>
	<div class="container">
		<header>
			<h2>그리드 시스템을 이용한 레이아웃</h2>
		</header>
		<div class="row">
			<div class="col-md-3">
				<i><img class=""
					src="${path }/resources/auction_images/${auction.item_img}"
					 alt='작은이미지'></i>
			</div>
			<div class="col-md-8 col-md-offset-1 cont">
				<div class="container" align="center">
					<h2 class="text-primary">현재가:</h2>
					<table class="table table-hover">
						<tr class="warning">
							<th>경매물품명</th>
							<td>${auction.item_name }</td>
						</tr>
						<tr class="danger">
							<th>판매자아이디</th>
							<td>${auction.id }</td>
						</tr>
						<tr class="info">
							<td>조회수</td>
							<td>${auction.view_cnt }</td>
						</tr>
						<tr class="success">
							<td>경매기간</td>
							<td>${auction.start_date }~${auction.end_date }</td>
						</tr>
						<tr class="active">
							<td>시작가</td>
							<td><pre>${auction.start_price}</pre></td>
						</tr>
						<tr class="active">
							<td>입찰단위</td>
							<td><pre>${auction.min_bid}</pre></td>
						</tr>
						<tr class="active">
							<td>현재 최고 입찰자</td>
							<td><pre></pre></td>
						</tr>
						<tr class="active">
							<td>입찰수</td>
							<td><pre></pre></td>
						</tr>
						<tr class="active">
							<td>물품 설명</td>
							<td><pre>${auction.item_contents}</pre></td>
						</tr>
						<tr class="default">
							<td colspan="2" align="center"><a
								href="auctionList.do?pageNum=${pageNum }" class="btn btn-success">게시글
									목록</a>  </td>
					</table>
				</div>
			</div>
		</div>
		<h2 class="text-primary">입찰</h2>
		<!-- submit할 때 action에 없으면 자신(view)을 한번 더 수행 여기서는 ajax사용 예정이므로 submit하지 않음 -->
		<form action="" name="frm1" id="frm1">
			<input type="hidden" name="id" value="1">
			<input type="hidden" name="auction_no" value="${auction.no }">
			<table class="table table-hover">
				<!-- 회원게시판은 board.writer가 아니라 로그인 한 사람의 이름/별명/아이디 -->
				<tr>
					<th>입찰단위</th>
					<td>${auction.min_bid }</td>
					<th>현재가</th>
					<c:if test="${null == bid }">
					<td>${auction.start_price }원</td>
					</c:if>
					<c:if test="${null != bid }">
					<td>${bid.bid_price }원</td>
					</c:if>
					<th>입찰가 입력</th>
					<c:if test="${null == bid }">
					<td><input type="number" value="${auction.start_price+auction.min_bid }">원</td>
					</c:if>
					<c:if test="${null != bid }">
					<td><input type="number" value="${bid.price+auction.min_bid }">원</td>
					</c:if>
					<td><input type="button" value="입찰하기" id="bidInsert"></td>
				</tr>
			</table>
		</form>
		<!-- <div id="bidListDisp" style="overflow: scroll; width: 100%; height:500px"></div> -->
	</div>
</body>
</html>