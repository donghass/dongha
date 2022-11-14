<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	/* drag & drop */
	.drag-over { background: yellow; }
	.thumb  { width: 100px; padding: 2px; float: left; }
	.thumb > img { width: 100%; }
	.thumb > .close { position: absolute; background: red; cursor: pointer; }
	#drop { border: 1px solid black; width: 300px; height: 200px; padding: 3px; }
</style>
<script type="text/javascript">
function check_pw(){
	 
    var pw = document.getElementById('pw').value;
    var SC = ["!","@","#","$","%","^"];
    var check_SC = 0;

    if(pw.length < 6 || pw.length>16){
        window.alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
        document.getElementById('pw').value='';
    }
    for(var i=0;i<SC.length;i++){
        if(pw.indexOf(SC[i]) != -1){
            check_SC = 1;
        }
    }
    if(check_SC == 0){
        window.alert('!,@,#,$,%,^ 의 특수문자가 들어가 있지 않습니다.')
        document.getElementById('pw').value='';
    }
    if(document.getElementById('pw').value !='' && document.getElementById('pw2').value!=''){
        if(document.getElementById('pw').value==document.getElementById('pw2').value){
            document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
            document.getElementById('check').style.color='blue';
        }
        else{
            document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
            document.getElementById('check').style.color='red';
        }
    }
}

</script>
</head><body>
<div class="container" align="center">
	<h2 class="text-primary">회원정보 수정</h2>
<form action="update.do" method="post" name="frm" enctype="multipart/form-data"
	onsubmit="return check_pw()">
	<input type="hidden" name="id" value="${member.id }">
<table class="table table-bordered">
	<tr><th>프로필 사진 <span class="glyphicon glyphicon-picture"></span></th>
		<td><input type="file" name="file" required="required"></td></tr>
	
	<!-- drag & drop -->
	<tr><th>프로필 사진  <span class="glyphicon glyphicon-picture"></span></th> 
		<td><div id="drop"><div id="thumbnails">그림을 올려 놓으세요</div></div></td></tr>


	<tr><th>아이디 <span class="glyphicon glyphicon-user"></span></th>
		<td>${member.id }</td></tr>
	<tr><th>비밀번호</th>
            <td><input type="password" name="password" id="pw" onchange="check_pw()" required="required"></td>
        </tr>
          
        <tr><th>비밀번호 확인</th>
            <td><input type="password" name="password2" id="pw2" onchange="check_pw()" required="required">&nbsp;<span id="check"></span></td>
        </tr>
	<tr><th>이름 <span class="glyphicon glyphicon-user"></span></th>
		<td><input type="text" name="name" required="required"
		class="form-control" value="${member.name }"></td></tr>
	<tr><th>이메일 <span class="glyphicon glyphicon-envelope"></span></th>
		<td><input type="email" name="email" required="required"
		class="form-control" value="${member.email }"></td></tr>	
	<tr><td colspan="2" align="center"><input type="submit" value="확인" 
		class="btn btn-success" class="form-control"></td></tr>	
</table>
</form>
<a href="auctionList.do" class="btn btn-info">메인</a>
</div>
</body>
</html>