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
	function chk() {
		if (frm.password.value != frm.password2.value) {
			alert("암호가 서로 일치하지 않습니다"); frm.password.focus();
			frm.password.value=""; frm.password2.value="";
			return false;
		}
	}
	function idChk() {
		if (!frm.id.value) {
			alert("아이디를 입력한 후에 체크하시오");
			frm.id.focus(); return false;
		}
		$.post('idChk.do', "id="+frm.id.value, function(data) {
			$('#idChk1').html(data);
		});
	}
</script>
</head>
<body>
<div class="container" align="center">
	<h2 class="text-primary">회원 가입</h2>
<form action="join.do" method="post" enctype="multipart/form-data" name="frm"
	onsubmit="return chk()">
<table class="table table-bordered">
	<tr><th>아이디<span class="glyphicon glyphicon-user"></span></th>
		<td><input type="text" name="id" required="required" autofocus="autofocus"
			class="form-control">
		<input type="button" class="btn btn-warning btn-sm" onclick="idChk()" value="중복체크">
		<div id="idChk1" class="err"></div></td></tr>
	<tr><th>암호 <span class="glyphicon glyphicon-lock"></span></th>
		<td><input type="password" name="password" required="required"
		class="form-control"></td></tr>
	<tr><th>암호확인 <span class="glyphicon glyphicon-lock"></span></th>
		<td><input type="password" name="password2" required="required"
		class="form-control"></td></tr>
	<tr><th>이름 <span class="glyphicon glyphicon-user"></span></th>
		<td><input type="text" name="name" required="required"
		class="form-control"></td></tr>
	<tr><th>이메일 <span class="glyphicon glyphicon-envelope"></span></th>
		<td><input type="email" name="email" required="required"
		class="form-control"></td></tr>	
</table>
</form>
<a href="loginForm.do" class="btn btn-info">완료</a>
</div>
</body>
</html>