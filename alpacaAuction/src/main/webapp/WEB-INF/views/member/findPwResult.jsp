<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findPwResult</title>
<style type="text/css">
	/* drag & drop */
	.drag-over { background: yellow; }
	.thumb  { width: 100px; padding: 2px; float: left; }
	.thumb > img { width: 100%; }
	.thumb > .close { position: absolute; background: red; cursor: pointer; }
	#drop { border: 1px solid black; width: 300px; height: 200px; padding: 3px; }
</style>
</head>
<body>
<div class="container" align="center">
	<h2 class="text-primary">비밀번호 찾기</h2>
	<c:if test="${result == 1 && resultUpdatePw == 1 }">
		<table class="table table-bordered">
			<tr>
				<th class="text-center">${member.email }로 임시비밀번호를 전송하였습니다. 로그인 후 비밀번호를 변경해주세요.</th>
			</tr>
		</table>
		<br><br>
		<button onclick="location.href='findIdForm.do'">아이디 찾기</button>
		<br>
		<button onclick="location.href='loginForm.do'">로그인</button>
	</c:if>
	<c:if test="${result == 0 }">
		<table>
			<tr>
				<th>${msg }</th>
			</tr>
		</table>
		<a href="findIdForm.do?">아이디 찾기</a>
	</c:if>
	<c:if test="${result == -1 }">
		<script type="text/javascript">
			alert("찾을 수 없는 계정입니다. 정보를 확인해주세요.");
			history.go(-1);
		</script>
	</c:if>
</div>
</body>
</html>