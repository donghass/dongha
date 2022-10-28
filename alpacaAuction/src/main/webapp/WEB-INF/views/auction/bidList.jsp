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
	<h3 class="text-primary">댓글</h3>
<table class="table table-striped">
	<tr class="success"><td>작성자</td><td>내용</td><td>수정일</td><td></td></tr>
<c:forEach var="bid" items="${bidList }">
		<!-- 회원게시판에서는 회원의 이름/별명/아이디를 자동 입력하므로 작성자 칸은 불필요 -->
		<tr><td>${bid.replier }<!-- 작성자 --></td>
			<td id="td_${bid.rno }"><pre>${bid.replytext }</pre></td>
			<td>${bid.updatedate }</td>
		</tr>
</c:forEach>
</table>
</c:if>
</body>
</html>