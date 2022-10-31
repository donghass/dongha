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
<c:if test="${not empty bidList}">
	<h3 class="text-primary">입찰기록</h3>
<table class="table table-striped">
	<tr class="success"><td>입찰자</td><td>입찰가</td><td>입찰일시</td><td></td></tr>
<c:forEach var="bid" items="${bidList }">
		<tr><td>${bid.id }<!-- 입찰자 아이디 --></td>
			<td>${bid.bid_price }</td>
			<td>${bid.bid_date }</td>
		</tr>
</c:forEach>
</table>
</c:if>
</body>
</html>