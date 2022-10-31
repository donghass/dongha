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
	function chk(){
	}
	// drag & drop
	$(document).on("drop", function(e) {
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
	}
</script>
</head><body>
<div class="container" align="center">
	<h2 class="text-primary">경매 물품 등록</h2>
<form action="insertItem.do" method="post" enctype="multipart/form-data" name="frm" >
	<%-- <input type="hidden" name="pageNum" value="${pageNum}"> --%>
	<input type="hidden" value="test" name="id">
<table class="table table-bordered"><caption >물품 정보</caption>
	<tr><th>경매 물품명 <span class="glyphicon glyphicon-pencil"></span></th>
		<td><input type="text" name="item_name" required="required" autofocus="autofocus">
		</td></tr>
	<tr><th>물품 설명<span class="glyphicon glyphicon-align-left"></span></th>
		<td><textarea rows="5" class="form-control" name="item_contents"
		required="required"></textarea></td></tr>
	<tr><th rowspan="2">사진 <span class="glyphicon glyphicon-picture"></span></th>
		<td><input type="file" name="file" required="required"></td></tr>
	<!-- drag & drop -->
	<tr>
		<td><div id="drop"><div id="thumbnails">그림을 올려 놓으세요</div></div></td></tr>
		
</table>
<table class="table table-bordered"><caption >경매설정</caption>
	<tr><th>시작가 <span class="glyphicon glyphicon-pencil"></span></th>
		<td><input type="number" name="start_price" required="required" value="1000">
		</td></tr>
	<tr><th>입찰단위<span class="glyphicon glyphicon-align-left"></span></th>
		<td><select class="form-control" name="min_bid">
          <option value="500">500원</option>
          <option value="1000">1000원</option>
          <option value="5000">5000원</option>
          <option value="10000">10000원</option>
          <option value="50000">50000원</option>
        </select></td></tr>
	<tr><th>경매 기간 <span class="glyphicon glyphicon-pencil"></span></th>
		<td>시작일<input type="datetime-local" class="form-control" name="sDate" ><p>
			마감일<input type="datetime-local" class="form-control" name="eDate" > 
		</td></tr>	
		<tr><td colspan="2" align="center"><input type="submit" value="경매등록" 
		class="btn btn-success">&nbsp;&nbsp;&nbsp;<a href=".do" class="btn btn-info">취소</a></td></tr>
</table>
</form>
</div>
</body>
</html>