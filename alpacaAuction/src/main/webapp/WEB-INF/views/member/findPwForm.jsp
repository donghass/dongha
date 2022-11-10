<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<meta charset="UTF-8">
<title>findPwForm</title>
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
	<h2 class="title">비밀번호 찾기</h2>
	<form action="findPwResult.do" method="post">
		<table>  
			<tr><td>
				<input type="text" name="id" required="required" autofocus="autofocus"
					 placeholder="아이디">
				</td>
			</tr>
			
			<!-- 아이디 찾기 후 비밀번호를 찾으면 값이 자동으로 넘어옴 -->
			<c:if test="${email != null }">
			<tr><td>
				<input type="email" name="email" id="email" required="required" 
							value="${email }">
				</td>
			</tr>
			</c:if>
			<c:if test="${email == null }">
			<tr><td>
					<input type="email" name="email" id="email" required="required" 
						placeholder="가입이메일">
				</td>
			</tr>  
			</c:if>
			
			<tr>
				<td class="text-center">
					<input type="submit" value="비밀번호 찾기" class="btn btn-success" id="idBtn">
				</td>
			</tr>
		</table>
		<a href="findIdForm.do" class="inputLineA">아이디 찾기</a>&nbsp; | &nbsp;
		<a href="joinForm.do" class="inputLineA">회원가입</a>&nbsp; | &nbsp;
		<a href="loginForm.do" class="inputLineA">로그인</a>
	</form>
</div>
</body>
</html>