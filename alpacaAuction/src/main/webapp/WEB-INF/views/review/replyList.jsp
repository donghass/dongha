<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="rvheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function rDelete(re_no, rno) {
		var sendData = 're_no='+re_no+'&rno='+rno;
		$.post('${path}/rDelete.do', sendData, function(data) {
			alert('댓글이 삭제되었습니다');
			$('#replyListDisp').html(data);
		})
	}
	function rUpdate(re_no, rno) {
		/* input에 있는 데이터를 읽어서 textarea에 넣어야 수정 할 수 있다
		input, textarea등 form태그 안에 있는 데이터는 jquery에서 val()로 읽고
		td, span, div처럼 일만 텍스트 데이터를 읽을 때는 jquery에서 text()로 읽는다*/
		var txt = $('td_'+rno).text();
		/* 읽은 데이터를 textarea에 넣기 */
		$('#td_'+rno).html("<textarea rows='3' class='form-control' id='textar'>"+txt+"</textarea>");
		/* 클릭한 버튼을 확인과 취소로 변경 */
		$('#btn_'+rno).html("<input type='button' onclick='up("+re_no+","+rno+")' class='btn btn-sm btn-info' value='확인'>"+
				"<input type='button' onclick='down("+re_no+")' class='btn btn-sm btn-danger'"+
				"value='취소'>");
	}
	function down(re_no) {
		$('#replyListDisp').load('${path}/replyList.do?re_no='+re_no);
	}
	function up(re_no,rno) {
		var sendData = "replytext="+$('#textar').val()+"&re_no="+re_no+"&rno="+rno;
		$.post('${path}/rUpdate.do',sendData, function(data) {
			alert('수정되었습니다');
			$('#replyListDisp').html(data);
		});
	}
</script>
</head>
<body>		<!-- rrList는 컨트롤러의 rrList와 같아야한다 -->
<c:if test="${not empty rrList}">
	<h2 class="text-primary">댓글</h2>
	<table class="table table-hover">
		<tr><td>작성자</td><td>내용</td><td>수정일</td><td></td></tr>
		<c:forEach var="review_reply" items="${rrList }">
			<c:if test="${review_reply.del == 'y' }">
				<tr><td colspan="4">삭제된 댓글입니다</td></tr>
			</c:if>
			<c:if test="${review_reply.del != 'y' }">
				<tr><td>${review_reply.replier}</td><td id="td_${review_reply.rno }"><pre>${review_reply.replytext }</pre></td><td>${review_reply.updatedate }</td>
				<c:if test="${review_reply.replier == review_board.id }">
					<td id="btn_${review_reply.rno }">
					<input type="button" class="btn btn-info btn-sm" id="btn_${review_reply.rno }"
					value="수정" onclick="rUpdate(${review_reply.re_no},${review_reply.rno })">
					<input type="button" class="btn btn-danger btn-sm"
					value="삭제" onclick="rDelete(${review_reply.re_no},${review_reply.rno })"></td>
				</c:if>
				<c:if test="${review_reply.replier != review_board.id }"><td></td></c:if>
			</tr>
			</c:if>
		</c:forEach>
	</table>
</c:if>
</body>
</html>