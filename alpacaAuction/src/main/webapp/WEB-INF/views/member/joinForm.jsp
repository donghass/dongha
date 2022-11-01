<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinForm</title>
<style type="text/css">
	/* drag & drop */
	.drag-over { background: yellow; }
	.thumb  { width: 100px; padding: 2px; float: left; }
	.thumb > img { width: 100%; }
	.thumb > .close { position: absolute; background: red; cursor: pointer; }
	#drop { border: 1px solid black; width: 300px; height: 200px; padding: 3px; }
</style>
<script type="text/javascript">
// 아이디 중복 체크	
	function idChk() {
		if (!frm.id.value) {
			alert("아이디를 입력한 후에 체크하시오");
			frm.id.focus(); return false;
		}
		$.post('idChk.do', "id="+frm.id.value, function(data) {
			$('#idChk1').html(data);
		});
	}
// 비밀번호 유효성 검사
	function chk() {
		if (frm.password.value != frm.password2.value) {
			alert("암호가 서로 일치하지 않습니다"); frm.password.focus();
			frm.password.value=""; frm.password2.value="";
			return false;
		}
	}
</script>
</head>
<body>
<div class="container" align="center">	
 	<h2 class="text-primary">회원 가입</h2>
<form action="join.do" method="post" enctype="multipart/form-data" name="frm"
	onsubmit="return chk()">
<table class="table table-bordered">
	
		<tr><th>아이디</th>
			<td><input type="text" name="id" required="required" autofocus="autofocus"
				class="form-control">
			<input type="button" class="btn btn-warning btn-sm" onclick="idChk()" value="중복 체크">
			<div id="idChk1" class="err"></div></td></tr>

		<tr><th>비밀번호</th>
			<td><input type="password" name="password" id="password" required="required"
			class="form-control"></td></tr>

		<tr><th>비밀번호 확인</th>
			<td><input type="password" name="password2" id="password2" required="required"
			class="form-control"></td></tr>
			
		<tr><th>이름</th>
			<td><input type="text" name="name" required="required"
			class="form-control"></td></tr>
			
		<tr><th>연락처</th>
			<td><input type="text" name="call" required="required"
			class="form-control"></td></tr>

		<tr><th>이메일</th>
			<td><input type="email" name="email" required="required"
			class="form-cotrol"></td></tr>
			
		<tr><th>주소</th>
			<td><input type="text" name="address" required="required"
			class="form-control"></td></tr>
		
		<tr><th>나이</th>	
			<td>
				<select class="select-age" name="age" required="required">
					<option value="">나이</option>
					<option value="10">10대</option>
					<option value="20">20대</option>
					<option value="30">30대</option>
					<option value="40">40대</option>
					<option value="50">50대</option>
					<option value="60">60대 이상</option>
				</select>
			</td>	

		<tr><th>성별</th>
			<td>
			<input class="magic-radio" type="radio" name="gender" id="male" value="m" checked="checked">
				<label for="male" class="radio-left">남자</label>
				<input class="magic-radio" type="radio" name="gender" id="female" value="f">
				<label for="female">여자</label>
			</td></tr>
			<tr><td colspan="2" align="center"><input type="submit" value="회원가입" 
		class="btn btn-success" class="form-control"></td></tr>		
		
</table>	
</form>
<a href="loginForm.do" class="btn btn-info">로그인</a>
</div>
</body>
</html>