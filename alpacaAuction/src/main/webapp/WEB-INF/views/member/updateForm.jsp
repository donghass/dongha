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
	function chk() {
		if (frm.password.value != frm.password2.value) {
			alert("암호가 서로 일치하지 않습니다"); frm.password.focus();
			frm.password.value=""; frm.password2.value="";
			return false;
		}
	}
	// drag & drop
/* 	$(document).on("drop", function(e) {
		// 태그에 파일 넣기
		$('input[type="file"]').prop("files", e.originalEvent.dataTransfer.files); 
	});
	$(function() {
		var uploadfiles = []; // 파일 배열(여러개 파일도 사용)
		var $drop = $('#drop');
		$drop.on("dragenter", function() { // 드래그 요소가 들어 왔을 때
			$('#thumbnails').text("");
			$(this).addClass('drag-over');
		}).on("dragleave", function() {  // 드래그 요소가 나갔을 때
			$('#thumbnails').text("그림을 올려 놓으세요");
			$(this).removeClass('drag-over');
		}).on("dragover", function(e) {  // 드래그 한 그림을 떨어뜨리기 위해 위에 올려 놨을 때
			e.stopPropagation();  // 이벤트를 전달하지 마라
			e.preventDefault();   // 원래 자체 기느을 하지 마라
		}).on("drop", function(e) {  // 드래그 한 그림을 떨어 뜨렸을 떄
			e.preventDefault();
			$(this).removeClass('drag-over');
			var files = e.originalEvent.dataTransfer.files; // 드래그한 그림들
			for (var i =0; i < files.length; i++) {
				var file = files[i];
				var size = uploadfiles.push(file);  // 업로드 파일 목록에 추가
				preview(file);  // 미리 보기
			}
		});
		$('#thumbnails').on('click', function(e) {
			var $target = $(e.target);
			var idx = $target.attr('data-idx');
			$target.parent().remove();  // x를 클릭한 그림 삭제
		});
	});
	// 그림 보여주기
	function preview(file) {
		var reader = new FileReader();
		reader.onload = (function(f) {
			return function(e) {
				var div = '<div class="thumb"><div class="close">X</div><img src="'+
					e.target.result+'"/></div>';
				$('#thumbnails').append(div);
			};
		})(file);
		reader.readAsDataURL(file);
		// readAsDataURL: 컨텐츠의 특정 Blob이나 File에서 읽어노는 역할 수행
	} */
</script>
</head><body>
<div class="container" align="center">
	<h2 class="text-primary">회원정보 수정</h2>
<form action="update.do" method="post" enctype="multipart/form-data" name="frm"
	onsubmit="return chk()">
	<input type="hidden" name="id" value="${member.id }">
<table class="table table-bordered">
	<tr><th>아이디 <span class="glyphicon glyphicon-user"></span></th>
		<td>${member.id }</td></tr>
	<tr><th>암호 <span class="glyphicon glyphicon-lock"></span></th>
		<td><input type="password" name="password" required="required"
		class="form-control" autofocus="autofocus"></td></tr>
	<tr><th>암호확인 <span class="glyphicon glyphicon-lock"></span></th>
		<td><input type="password" name="password2" required="required"
		class="form-control"></td></tr>
	<tr><th>이름 <span class="glyphicon glyphicon-user"></span></th>
		<td><input type="text" name="name" required="required"
		class="form-control" value="${member.name }"></td></tr>
	<tr><th>이메일 <span class="glyphicon glyphicon-envelope"></span></th>
		<td><input type="email" name="email" required="required"
		class="form-control" value="${member.email }"></td></tr>	
	<%-- <tr><th>사진 <span class="glyphicon glyphicon-picture"></span></th>
		<td><input type="file" name="file">${member.fileName }</td></tr>
	<!-- drag & drop -->
	<tr><th>사진  <span class="glyphicon glyphicon-picture"></span></th> 
		<td><div id="drop"><div id="thumbnails">그림을 올려 놓으세요</div></div></td></tr> --%>
	<tr><td colspan="2" align="center"><input type="submit" value="확인" 
		class="btn btn-success" class="form-control"></td></tr>	
</table>
</form>
<a href="main.do" class="btn btn-info">메인</a>
</div>
</body>
</html>