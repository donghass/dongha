<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findIdForm</title>
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
	<h2 class="text-primary">아이디 찾기</h2>
<form action="findIdResult.do" method="post">
		<table>
			<tr><td>
				<input type="text" name="name" required="required" autofocus="autofocus" 
					   placeholder="이름">
				</td>
			</tr>
			
			<tr><td>
				<input type="tel" name="call" id="call" required="required"
					   title="형식 010-0000-0000" 	pattern="\d{3}-\d{4}-\d{4}" 
					   placeholder="가입휴대폰번호">
				</td>
			</tr>
			
			<tr><td>
				<input type="submit" value="아이디 찾기" class="btn btn-success" id="idBtn">
				</td>
			</tr>
			
		</table>
		<a href="findPwForm.do">비밀번호 찾기</a>&nbsp;|&nbsp;
		<a href="joinForm.do">회원가입</a>&nbsp;|&nbsp;
		<a href="loginForm.do">로그인</a>
	</form>
</div>
</body>
</html>