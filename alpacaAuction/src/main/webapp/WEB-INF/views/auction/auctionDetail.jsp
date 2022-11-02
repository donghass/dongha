<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.img {width:100%;};
</style>
<script type="text/javascript">
	function bid_priceChk(bid_price,min_bid){
		if(frm1.bid_price.value <= bid_price+min_bid){
			alert("현재가 보다 높게 설정해 주십시오"); frm1.bid_price.focus();
			frm1.bid_price.value=bid_price+min_bid;
		}else if((frm1.bid_price.value-bid_price) % min_bid != 0){
			alert("입찰 단위에 맞게 설정해주세요");frm1.bid_price.focus();
			frm1.bid_price.value=bid_price+min_bid;
		}
	}
	$(function() {
		$('#bidListDisp').load('bidList.do?auction_no=${auction.auction_no}');
		$('#bidInsert').click(function() {
			/* 	var sendData = "auction_no="+frm1.auction_no.value+
					"&id="+frm1.id.value+
					"&bid_price="+frm1.bid_price.value; */
			if (!confirm("정말 입찰 하시겠습니까?")) {
	            alert("취소 하셨습니다.");
	        } else {
			var sendData = $('#frm1').serialize();
			$.post('bidInsert.do', sendData, function(data) {
				$('#bidListDisp').html(data);
			});
	        }
		});
	});
</script>
</head>
<body>
	<div class="container" align="center">
		<div class="row">
			<div class="col-md-5">
				<i><img class="img"
					src="${path }/resources/auction_images/${auction.item_img}"
					 alt='작은이미지'></i>
			</div>
			<div class="col-md-7">
					<h2 class="text-primary bg-warning">현재가:${auction.bid_price }</h2>
					<table class="table table-dark">
						<tr class="warning">
							<th>경매물품명</th>
							<td>${auction.item_name }</td>
						</tr>
						<tr class="warning">
							<th>판매자아이디</th>
							<td>${auction.id }</td>
						</tr>
						<tr class="warning">
							<td>조회수</td>
							<td>${auction.view_cnt }</td>
						</tr>
						<tr class="warning">
							<td>경매기간</td>
							<td>${auction.start_date }~${auction.end_date }</td>
						</tr>
						<tr class="warning">
							<td>시작가</td>
							<td>${auction.start_price}</td>
						</tr>
						<tr class="warning">
							<td>입찰단위</td>
							<td>${auction.min_bid}</td>
						</tr>
						<tr class="warning">
							<td>입찰수</td>
							<td>${auction.bid_cnt }</td>
						</tr>
						<tr class="default">
							<td colspan="2" align="center"><a href="#bidListDisp" class="btn btn-success">입찰
									목록</a>
							<button class="btn btn-success" onclick="">관심 등록</button>  </td></tr>
					</table>
			</div>
			<div class="col-md-12">
				<h2>물품설명</h2>
				<pre style="font-size: 20px;">${auction.item_contents}</pre>
			</div>
		</div>
		<h2 class="text-primary bg-warning">입찰</h2>
		<!-- submit할 때 action에 없으면 자신(view)을 한번 더 수행 여기서는 ajax사용 예정이므로 submit하지 않음 -->
		<form action="" name="frm1" id="frm1">
			<input type="hidden" name="id" value="1">
			<input type="hidden" name="auction_no" value="${auction.auction_no }">
			<table class="table table-hover">
				<!-- 회원게시판은 board.writer가 아니라 로그인 한 사람의 이름/별명/아이디 -->
				<tr>
					<th>입찰단위</th>
					<td>${auction.min_bid }</td>
					<th>현재가</th>
					<td>${auction.bid_price }원</td>
					<th>입찰가 입력</th>
					<td><input type="number" value="${auction.bid_price+auction.min_bid }" name="bid_price" min="${auction.bid_price+auction.min_bid }" step="${auction.min_bid }" onchange="bid_priceChk(${auction.bid_price},${auction.min_bid })">원</td>
					<td><input type="button" value="입찰하기" id="bidInsert"></td>
				</tr>
			</table>
		</form>
		<div id="bidListDisp" style="overflow: scroll; width: 100%; height:500px"></div>
		<a href="auctionList.do?pageNum=${pageNum }" class="btn btn-success">게시글
									목록</a>
		<div id="insert"></div>
	</div>
</body>
</html>