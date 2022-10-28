<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>main</title>
<script type="text/javascript">
	function del() {
		var cf = confirm("정말로 탈퇴 하시겠습니까?");
		if (cf) location.href = "delete.do";
		else alert("탈퇴가 취소 되었습니다");
	}
</script></head><body>
<div class="container" align="center">
	<h2 class="text-primary">${member.name }님 환영합니다</h2>
<table class="table table-striped">
	<tr><td><a href="updateForm.do" class="btn btn-warning">수정</a></td></tr>
	<tr><td><a onclick="del()" class="btn btn-danger">탈퇴</a></td></tr>
	<tr><td><a href="logout.do" class="btn btn-info">로그 아웃</a></td></tr>
</table>
</div>
</body>
</html>