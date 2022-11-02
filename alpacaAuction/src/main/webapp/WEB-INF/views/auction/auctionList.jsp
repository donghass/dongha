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
    width: 180px;
    border-bottom: 1px solid #ddd;
    box-sizing: border-box;
    overflow: hidden;
}
.thum img {
    max-width: 100% !important;
    max-height: 100% !important;
    width: auto !important;
    -ms-interpolation-mode: bicubic;
    border: 0;
    height: 200px !important;
    display: block;
    margin: 0 auto;
    
}
.price {
    display: table;
	padding: 5px 10px;
}
.cover {
  object-fit: cover;
}
.hit{
border-top: 1px solid #e0e0e0;
    background: #f9f9f9;
    font-size: 13px;
    display: table;
    width: 100%;
}
.quickmenu {position:absolute;width:120px;top:50%;margin-top:-50px;right:10px;background:#fff;}
.quickmenu ul {position:relative;float:left;width:100%;display:inline-block;*display:inline;border:1px solid #ddd;}
.quickmenu ul li {float:left;width:100%;border-bottom:1px solid #ddd;text-align:center;display:inline-block;*display:inline;}
.quickmenu ul li a {position:relative;float:left;width:100%;height:30px;line-height:30px;text-align:center;color:#999;font-size:9.5pt;}
.quickmenu ul li a:hover {color:#000;}
.quickmenu ul li:last-child {border-bottom:0;}
</style>
<script type="text/javascript">
$(document).ready(function(){
	  var currentPosition = parseInt($(".quickmenu").css("top"));
	  $(window).scroll(function() {
	    var position = $(window).scrollTop(); 
	    $(".quickmenu").stop().animate({"top":position+currentPosition+"px"},1000);
	  });
	});
</script>
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
		<div class="btn-group">
			<button type="button" class="btn btn-default dropdown-toggle"
				data-toggle="dropdown">
				필터 <span class="caret"></span>
			</button>
			<ul class="dropdown-menu" role="menu">
				<li><a href="auctionList.do?filter=a">조회순</a></li>
				<!-- <li><a href="auctionList.do?filter=b">인기경매순</a></li> -->
				<li><a href="auctionList.do?filter=c">마감임박순</a></li>
			</ul>
		</div>
		<a href="insertItemForm.do" class="btn btn-success">게시글 입력</a>
<div class="row">
<c:if test="${empty list}">
	<tr class="warning"><td colspan="5">게시글이 없습니다</td></tr>
</c:if>
<c:if test="${not empty list}">
	<c:forEach var="auction" items="${list }">
<div class="col-xs-6 col-sm-4">
			<a href="auctionDetail.do?auction_no=${auction.auction_no }&result=-1" >
			<span class="thum">
					<i><img  class="imgTypeH imgTypeW lazyload" style="height: 200px; width: 180px;" src="${path }/resources/auction_images/${auction.item_img}" onerror="this.src='/admin/images/noimg.gif';" alt='작은이미지'></i>
			</span>
		<span class="price">
			<span class="text-danger" style="height:40px">${auction.item_name }</span><br>
			<span class="won bg-danger">현재가:${auction.bid_price }원</span>
		</span>
		<span class="hit">
			<span>입찰 <i>${auction.bid_cnt }</i>   </span>
			<span>조회 <i>${auction.view_cnt }</i></span>
		</span>
		<span class="time">
			판매자아이디:${auction.id }
		<br /><i class="glyphicon glyphicon-time"></i>남은시간:${auction.day }일 ${auction.hour }시 ${auction.min }분
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
<div class="quickmenu bg-warning">
  <ul>
    <li><a href="#">도서</a></li>
    <li><a href="#">미술품</a></li>
    <li><a href="#">취미/수집</a></li>
    <li><a href="#">중고</a></li>
  </ul>
</div>
</body>
</html>