<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.narrowWidth1-1 {
   	 width: 70%;  
   	} 
   	.inputline1{  
	    border: none;
	    outline: 0;
	    width: 64%;  
     }
     .narrowWidth2 {
   	 width: 65%;  
   	} 
</style>
</head>
<body>
	<div class="container narrowWidth1-1" align="center">
		<h2 class="title">회원정보 수정</h2>
		<form action="adminMbUpdateResult.do" method="post" name="frm">
			<input type="hidden" name="MB_id" value="${member.MB_id }">
			<input type="hidden" name="pageNum" value="${pageNum }">
			<table class="table narrowWidth2">
				<tr>
					<td class="col-md-5 text-center">아이디</td>
					<td class="col-md-7">${member.MB_id }</td>
				</tr>
				<tr>
					<td class="col-md-5 text-center">비밀번호</td>
					<td class="col-md-7"><input type="text" name="MB_pw" value="${member.MB_pw }" class="inputline1"
						autofocus="autofocus" required="required"></td>
				</tr>
				<tr>
					<td class="col-md-5 text-center">이름</td>
					<td class="col-md-7"><input type="text" name="MB_name" value="${member.MB_name }" class="inputline1"
						required="required"></td>
				</tr>
				<tr>
					<td class="col-md-5 text-center">주민등록번호</td>
					<td class="col-md-7">${member.MB_regNum }</td>
				</tr>
				<tr>
					<td class="col-md-5 text-center">닉네임</td>
					<td class="col-md-7"><input type="text" name="MB_nickName" value="${member.MB_nickName }"
						  class="inputline1"  required="required"></td>
				</tr>
				<tr>
					<td class="col-md-5 text-center">연락처</td>
					<td class="col-md-7"><input type="text" name="MB_tel" value="${member.MB_tel }" class="inputline1"
						required="required"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="수정"
						class="btn_sm_full"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>