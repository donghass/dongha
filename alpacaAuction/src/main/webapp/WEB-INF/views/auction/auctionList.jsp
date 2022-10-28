<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.thum {
    position: relative;
    height: 200px;
    text-align: center;
    vertical-align: middle;
    display: table !important;
    width: 100%;
    max-width: 100%;
    border-bottom: 1px solid #ddd;
    box-sizing: border-box;
}
.thum img {
    max-width: 100% !important;
    max-height: 100% !important;
    width: auto !important;
    -ms-interpolation-mode: bicubic;
    border: 0;
    height: auto !important;
    display: block;
    margin: 0 auto;
}
</style>
</head>
<body>
<div class="container" align="center">
<form action="auctionList.do?pageNum=1">
	<select name="search">
<!-- 	<option value="writer">판매자</option>
		<option value="subject">물품명</option>
		<option value="content">내용</option> -->
		<c:forTokens var="sh" items="id,item_name,item_contents" delims="," varStatus="i">
			<c:if test="${sh==auction.search }">
				<option value="${sh }" selected="selected">${title[i.index] }</option>
			</c:if>
			<c:if test="${sh!=auction.search }">
				<option value="${sh }">${title[i.index] }</option>
			</c:if>			
		</c:forTokens>
	</select>
	<input type="text" name="keyword" value="${auction.keyword }">
	<input type="submit" value="확인">
</form>
<a href="insertItemForm.do" class="btn btn-success">게시글 입력</a>
<div class="row">
<c:if test="${empty list}">
	<tr class="warning"><td colspan="5">게시글이 없습니다</td></tr>
</c:if>
<c:if test="${not empty list}">
	<c:forEach var="auction" items="${list }">
<div class="col-xs-6 col-sm-4">
			<a href="auctionDetail.do?auction_no=${auction.auction_no }" >
			<span class="thum">
					<i><img  class="imgTypeH imgTypeW lazyload" src="${path }/resources/auction_images/${auction.item_img}" onerror="this.src='/admin/images/noimg.gif';" alt='작은이미지'></i>
			</span>
		<span class="price">
			<span class="desc" style="height:40px">${auction.item_name }</span>
			<span class="won">${auction.start_price }원</span>
		</span>
		<span class="hit">
			<span>입찰 <i>52</i></span>
			<span>조회 <i>108</i></span>
		</span>
		<span class="time">
		판매&nbsp;&nbsp;kdw1009&nbsp;<img src="/kobay/images/rank_img_17_02.png">
		<br /><i class="fa fa-clock-o"></i> 1일 04시간 
		<!-- 연장경매진행여부 표시 2022.05.17 START -->
		
		<!-- 연장경매진행여부 표시 2022.05.17 END   -->
	</span>
	</a>
</div>
</c:forEach>
</c:if>
</div>
<div align="center">
	<ul class="pagination">
		<!-- 시작페이지가 pagePerBlock(10)보다 크면 앞에 보여줄 것이 있다 -->
		<%-- html에서의 /는 http://localhost:8080까지 추가 /ch10를 해야 한다. /ch10이 ${path }	 --%>	
		<c:if test="${pb.startPage > pb.pagePerBlock}">
			<li><a href="auctionList.do?pageNum=1&search=${auction.search}&keyword=${auction.keyword}">
				<span class="glyphicon glyphicon-fast-backward"></span></a></li>
			<li><a href="auctionList.do?pageNum=${pb.startPage-1 }&search=${auction.search}&keyword=${auction.keyword}">
				<span class="glyphicon glyphicon-triangle-left"></span></a></li>
		</c:if>
		<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
			<c:if test="${pb.currentPage == i }">
				<li class="active"><a href="auctionList.do?pageNum=${i }&search=${auction.search}&keyword=${auction.keyword}">${i }</a></li>
			</c:if>
			<c:if test="${pb.currentPage != i }">
				<li><a href="auctionList.do?pageNum=${i }&search=${auction.search}&keyword=${auction.keyword}">${i }</a></li>
			</c:if>		
		</c:forEach>
		<!-- endPage보다 totalPage가 크면 보여줄 것이 뒤에 남아 있다 -->
		<c:if test="${pb.endPage < pb.totalPage}">
			<li><a href="auctionList.do?pageNum=${pb.endPage+1 }&search=${auction.search}&keyword=${auction.keyword}">
				<span class="glyphicon glyphicon-triangle-right"></span></a></li>
			<li><a href="auctionList.do?pageNum=${pb.totalPage }&search=${auction.search}&keyword=${auction.keyword}">
				<span class="glyphicon glyphicon-fast-forward"></span></a></li>
		</c:if>		
	</ul>
</div>
</div>
</body>
</html>