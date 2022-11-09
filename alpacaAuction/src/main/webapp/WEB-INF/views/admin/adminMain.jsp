<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminMain</title>
</head>
<body>
	<div class="content">
		<ul class="content_main">
			<li>
				<h3>타세요 관리</h3> 
				<c:if test="${cpAllList.size() == 0}">
					<p>내역이 존재하지 않습니다.</p>
				</c:if> 
				<c:if test="${cpAllList.size() != 0}">
					<a href="adminCpList.do">+ 자세히</a>
					<table>
						<tr>
							<th class="col-md-2">작성자</th>
							<th class="col-md-5">출발지</th>
							<th class="col-md-5">도착지</th>
						</tr>
						<c:forEach items="${cpAllList }" var="carpool">
							<tr>
								<td class="text-center">${carpool.MB_nickName }</td>
								<td class="ellip">${carpool.CP_startPoint }</td>
								<td class="ellip">${carpool.CP_endPoint }</td>
							</tr>
						</c:forEach>
					</table>
				</c:if>
			</li>
			<li>
				<h3>공지사항 관리</h3> 
				<c:if test="${noticeAllList.size() == 0}">
					<p>내역이 존재하지 않습니다.</p>
				</c:if> 
				<c:if test="${noticeAllList.size() != 0}">
					<a href="adminNoticeList.do">+ 자세히</a>
					<table>
						<tr>
							<th class="col-md-9">제목</th>
							<th class="col-md-3">작성일</th>
						</tr>
						<c:forEach items="${noticeAllList }" var="notice">
							<tr>
								<td class=" ellip">${notice.NT_title }</td>
								<td class="text-center">${notice.NT_regDate }</td>
							</tr>
						</c:forEach>
					</table>
				</c:if>
			</li>
			<li>
				<h3>예약내역 관리</h3> 
				<c:if test="${rvAllList.size() == 0}">
					<p>내역이 존재하지 않습니다.</p>
				</c:if> 
				<c:if test="${rvAllList.size() != 0}">
					<a href="adminRvList.do">+ 자세히</a>
					<table>
						<tr>
							<th class="col-md-3">작성자</th>
							<th class="col-md-3">신청자</th>
							<th class="col-md-6">출발지</th>
						</tr>
						<c:forEach items="${rvAllList }" var="reservation">
							<tr>
								<td class="text-center">${reservation.MB_nickNameDv }</td>
								<td class="text-center">${reservation.MB_nickName }</td>
								<td>${reservation.CP_startPoint }</td>
							</tr>
						</c:forEach>
					</table>
				</c:if>
			</li>
			<li>
				<h3>문의내역</h3> 
				<c:if test="${qnaAllList.size() == 0}">
					<p>등록된 문의내역이 없습니다.</p>
				</c:if> <c:if test="${qnaAllList.size() != 0}">
					<a href="adminQnaList.do">+ 자세히</a>
					<table>
						<tr>
							<th class="col-md-8">제목</th>
							<th class="col-md-4">작성자</th>
						</tr>
						<c:forEach items="${qnaAllList}" var="qna">
							<tr>
								<td class="ellip">${qna.QA_title}</td>
								<td class="text-center">${qna.MB_nickName}</td>
							</tr>
						</c:forEach>
					</table>
				</c:if>
			</li>
			
			<li>
				<h3>드라이버 승인</h3> 
				<c:if test="${applyAllList.size() == 0}">
					<p>드라이버 신청 정보가 없습니다</p>
				</c:if> 
				<c:if test="${applyAllList.size() != 0}">
					<a href="adminPermitList.do">+ 자세히</a>
					<table>
						<tr>
							<th class="col-md-8">아이디</th>
							<th class="col-md-4">승인상태</th>
						</tr>
						<c:forEach var="apply" items="${applyAllList }">
							<tr>
								<td>${apply.MB_id }</td>
								<c:if test="${apply.MB_driverConfirm == 'I'}">
									<td class="text-center">심사중</td>
								</c:if>
								<c:if test="${apply.MB_driverConfirm == 'N'}">
									<td class="text-center">반려</td>
								</c:if>
								<c:if test="${apply.MB_driverConfirm == 'Y' }">	
									<td class="text-center">승인완료</td>
								</c:if>
							</tr>
						</c:forEach>
					</table>
				</c:if>
			</li>
			
			<li>
				<h3>신고내역</h3> 
				<c:if test="${rpAllList.size() == 0}">
					<p>작성된 신고내역이 없습니다.</p>
				</c:if> 
				<c:if test="${rpAllList.size() != 0}">
					<a href="adminReportList.do">+ 자세히</a>
					<table>
						<tr>
							<th>신고자</th>
							<th>신고사유</th>
						</tr>
						<c:forEach items="${rpAllList}" var="report">
							<tr>
								<td class="text-center">${report.MB_nickName}</td>
								<c:if test="${report.RP_reason == 1 }">
									<td class="text-center">광고성/홍보성</td>
								</c:if>
								<c:if test="${report.RP_reason == 2 }">
									<td class="text-center">음란물/성적수치심 유발</td>
								</c:if>
								<c:if test="${report.RP_reason == 3 }">
									<td class="text-center">욕설 및 비방</td>
								</c:if>
								<c:if test="${report.RP_reason == 4 }">
									<td class="text-center">불법정보 유통</td>
								</c:if>
								<c:if test="${report.RP_reason == 5 }">
									<td class="text-center">불쾌한 표현</td>
								</c:if>
								<c:if test="${report.RP_reason == 6 }">
									<td class="text-center">개인정보 노출</td>
								</c:if>
							</tr>
						</c:forEach>
					</table>
				</c:if>
			</li>
		</ul>
	</div>	
</body>
</html>