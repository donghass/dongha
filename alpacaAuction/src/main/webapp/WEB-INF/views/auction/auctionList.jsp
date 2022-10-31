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
    max-width: 100%;
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
    height: 100% !important;
    display: block;
    margin: 0 auto;
    
}
.price {
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
</style>
<script type="text/javascript">
function timer(end_date){
   /*  var currentDate = end_date;
    var timer = document.getElementById('timer');
    var msg = "남은 경매시간 : ";
     if(currentDate.getHours()>12){      //시간이 12보다 크다면 오후 아니면 오전
      msg += "오후 ";
      msg += currentDate.getHours()-12+"시 ";
   }
   else {
     msg += "오전 "; 
     msg += currentDate.getHours()+"시 ";
   }

    msg += currentDate.getMinutes()+"분 ";
    msg += currentDate.getSeconds()+"초";

    timer.innerText = msg;

    if (currentDate.getMinutes()<5) {    //정각 1분전부터 빨강색으로 출력
      timer.style.color="red";
    }
    setTimeout(showClock,1000);  //1초마다 갱신
  } */
  timer.innerText = end_date;
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
					<i><img  class="imgTypeH imgTypeW lazyload cover" src="${path }/resources/auction_images/${auction.item_img}" onerror="this.src='/admin/images/noimg.gif';" alt='작은이미지'></i>
			</span>
		<span class="price">
			<span class="text-primary" style="height:40px">${auction.item_name }</span>
			<span class="won">${auction.start_price }원</span>
		</span>
		<span class="hit">
			<span>입찰 <i>52</i></span>
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
</body>
</html>