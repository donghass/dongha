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
<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("리뷰 수정 완료")
		location.href="view.do?review_no=${review_board.review_no }&pageNum=${pageNum}"
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("리뷰 수정 실패")
		history.back();
	</script>
</c:if>
</body>
</html>