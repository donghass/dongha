<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<div class="container" align="center">
	<h2 class="text-primary">회원정보 상세</h2>
<table class="table table-striped">
	<tr><th>아이디</th><td>${member.id }</td></tr>
	<tr><th>이름</th><td>${member.name}</td></tr>
	<tr><th>이메일</th><td>${member.email}</td></tr>
	<tr><th>등록일</th><td>${member.created_date}</td></tr>
	<%-- <tr><th>사진</th><td>
		<img alt="" src="resources/upload/${member.fileName}" width="200"></td></tr> --%>
</table>
<a href="main.do" class="btn btn-default">메인</a>
</div>
</body>
</html>