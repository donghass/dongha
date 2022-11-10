<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findIdResult</title>
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
<c:if test="${result == 1 }">
	<table>
		<tr>
			<th class="text-center">회원님의 아이디는 '${member.id }' 입니다.</th>
		</tr>
		<tr>
			<td class="text-center">
				<!-- 아이디 찾기 후 비밀번호를 찾으면 값이 자동으로 넘어가게 하기 위함 -->
				<button onclick="location.href='findPwForm.do?id=${member.id}'">비밀번호 찾기</button>
			</td>
		</tr>
	</table>
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