<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>login</title></head><body>
<c:if test="${result > 0}">
	<script type="text/javascript">
		alert("로그인 되었습니다");
		location.href="auctionList.do";
	</script>
</c:if>
<c:if test="${result == 0}">
	<script type="text/javascript">
		alert("암호가 일치하지 않습니다");
		history.back();
	</script>
</c:if>
<c:if test="${result == -1}">
	<script type="text/javascript">
		alert("등록되지 않은 아이디 입니다");
		history.back();
	</script>
</c:if>
</body>
</html>