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
<c:if test="${result > 0}">
	<script type="text/javascript">
		alert("관심물품에  등록되었습니다");
		location.href="auctionDetail.do?auction_no=${auction_no}&pageNum=${pageNum}";
	</script>
</c:if>
<c:if test="${result == 0}">
	<script type="text/javascript">
		alert("이미 등록하셨습니다");
		history.back();
	</script>
</c:if>
</body>
</html>