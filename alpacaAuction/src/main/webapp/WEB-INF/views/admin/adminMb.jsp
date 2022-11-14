<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
</head>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<body>
<h2 class="title">회원정보</h2>
	<table class="table">
		<tr>   
			<th class="col-md-1 text-center">회원ID</th>
			<th class="col-md-1 text-center">이름</th>
			<th class="col-md-1 text-center">전화번호</th>
			<th class="col-md-1 text-center">이메일</th>
			<th class="col-md-1 text-center">주소</th>
			<th class="col-md-1 text-center">성별</th>
			<th class="col-md-1 text-center">나이대</th>
			<th class="col-md-1 text-center">가입일</th>
			<th class="col-md-1 text-center">탈퇴 여부</th>				
		</tr>
			<c:if test="${empty mbList }">
				<tr>
					<th colspan="9">회원 정보가 없습니다</th>
				</tr>
			</c:if>
			<c:if test="${not empty mbList }">
				<c:forEach var="member" items="${mbList }">
					<tr>
						<!-- 게시글 번호 순서 정렬 -->
							<td class="text-center col-md-1">${member.id }</td>
							<td class="col-md-1 text-center">${member.name }</td>
							<td class="col-md-1 text-center">${member.call }</td>
							<td class="col-md-1 text-center">${member.email }</td>
							<td class="col-md-1 text-center">${member.address }</td>
							<c:if test="${member.gender == 'm' }">
								<td class="col-md-1 text-center">남자</td>
							</c:if>
							<c:if test="${member.gender == 'f'}">
								<td class="col-md-1 text-center">여자</td>
							</c:if>
							<td class="col-md-1 text-center">${member.age }</td>
							<td class="col-md-1 text-center">${member.created_date }</td>
							<c:if test="${member.del == 'n' }">
								<c:if test="${member.authority == 'y' }">
									<td class="col-md-1 text-center">관리자</td>
								</c:if>
								<c:if test="${member.authority != 'y' }">
									<td class="col-md-1 text-center">
										<a href="adminMbDelete.do?id=${member.id }&pageNum=${pageNum }">
											<span class="btn btn-danger">삭제</span></a>
									</td>
								</c:if>
							</c:if>
							<c:if test="${member.del == 'y' }">
								<td class="text-center">
									<a href="adminMbRollback.do?id=${member.id }&pageNum=${pageNum }">
										<span class="btn btn-success">복구</span></a>
								</td>
							</c:if>
					</tr>  
				</c:forEach>
				<tr><td colspan="7"></td></tr>
			</c:if>
		</table>   
		<div align="center">
			<ul class="pagination_bottom">
				<!-- 시작페이지가 pagePerBlock(10)보다 크면 앞에 보여줄 페이지가 있다 -->
				<c:if test="${pb.startPage > pb.pagePerBlock }">
					<li>
						<a href="adminMb.do?pageNum=1">
							<span class="glyphicon glyphicon-backward"></span>
						</a>
					</li>
					<li><a href="adminMb.do?pageNum=${pb.startPage - 1 }">
							<span class="glyphicon glyphicon-triangle-left"></span>
					</a></li>
				</c:if>
				<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
					<!-- 현재 머물고 있는 페이지가 몇 페이지인지 구별할 때 -->
					<c:if test="${pb.currentPage == i }">
						<li class="active"><a href="adminMb.do?pageNum=${i }">　${i }　</a></li>
					</c:if>
					<c:if test="${pb.currentPage != i }">
						<li><a href="adminMb.do?pageNum=${i }">　${i }　</a></li>
					</c:if>
				</c:forEach>
				<!-- 보여줄 페이지가 뒤에 남아있는 경우(다음 버튼 활성화)=> endPage < totalPage인 경우 -->
				<c:if test="${pb.endPage < pb.totalPage }">
					<li><a href="adminMb.do?pageNum=${pb.endPage + 1 }">
							<span class="glyphicon glyphicon-triangle-right"></span>
					</a></li>
					<li><a href="adminMb.do?pageNum=${pb.totalPage }">
							<!-- 끝페이지로 바로 이등(순서 생각하며 넣기) -->
						<span class="glyphicon glyphicon-forward"></span>
					</a></li>
				</c:if>
			</ul>
		</div>
</body>
</html>