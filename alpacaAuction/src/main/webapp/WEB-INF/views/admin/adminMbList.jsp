<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
</head>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<body>
<h2 class="text-primary">회원정보</h2>
	<div>
	<form action="adminMbList.do">
		<input type="hidden" name="pageNum" value="1">
		<select name="search">
			<c:forTokens var="sh" items="id,name,gender,created_date" delims="," varStatus="i">
				<c:if test="${sh == member.search }">
					<option value="${sh}" selected="selected">${title[i.index] }</option>
				</c:if>
				<c:if test="${sh != member.search }">
					<option value="${sh}">${title[i.index] }</option>
				</c:if>
			</c:forTokens>
		</select>
		<input type="text" name="keyword" value="${member.keyword }" class="inputUnderLine">
		<input type="submit" value="검색" class="btn_search">
	</form>
	</div>   
	<table class="table table-bordered">
		<tr>   
			<th>회원번호</th>
			<th>회원ID</th>
			<th>이름</th>
			<th>성별</th>
			<th>가입일</th>
			<th>탈퇴 여부</th>				
		</tr>
			<c:if test="${empty mbList }">
				<tr>
					<th colspan="7">회원 정보가 없습니다</th>
				</tr>
			</c:if>
			<c:if test="${not empty mbList }">
				<c:forEach var="member" items="${mbList }">
					<tr>
						<td class="col-md-1 text-center">${num }
							<c:set var="num" value="${num -1 }"></c:set></td>
						<!-- 게시글 번호 순서 정렬 -->
							<td class="text-center col-md-3">
								<a href="adminMbView.do?MB_id=${member.MB_id }&pageNum=${pb.currentPage}" class="inputLineA">${member.MB_id }</a></td>
							<td class="col-md-2 text-center">${member.MB_name }</td>
							<td class="col-md-2 text-center">${member.MB_nickName }</td>
							<c:if test="${member.MB_gender == 1 || member.MB_gender == 3}">
								<td class="col-md-1 text-center">남자</td>
							</c:if>
							<c:if test="${member.MB_gender == 2 || member.MB_gender == 4}">
								<td class="col-md-1 text-center">여자</td>
							</c:if>
							<td class="col-md-2 text-center">${member.MB_regDate }</td>
							<c:if test="${member.MB_del == 'N' }">
								<c:if test="${member.MB_id == 'admin' }">
									<td class="col-md-2 text-center">관리자</td>
								</c:if>
								<c:if test="${member.MB_id != 'admin' }">
									<td class="text-center">
										<a href="adminMbDelete.do?MB_id=${member.MB_id }&pageNum=${pageNum }">
											<img alt="" src="${path }/resources/main/delete.png" width="17px" height="17px"></a>
									</td>
								</c:if>
							</c:if>
							<c:if test="${member.MB_del == 'Y' }">
								<td class="text-center">
									<a href="adminMbRollback.do?MB_id=${member.MB_id }&pageNum=${pageNum }">
										<img alt="" src="${path }/resources/main/recovery.png" width="17px" height="17px"></a>
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
						<a href="adminMbList.do?pageNum=1&search=${member.search }&keyword=${member.keyword }">
							<span class="glyphicon glyphicon-backward"></span>
						</a>
					</li>
					<li><a href="adminMbList.do?pageNum=${pb.startPage - 1 }&search=${member.search }&keyword=${member.keyword }">
							<span class="glyphicon glyphicon-triangle-left"></span>
					</a></li>
				</c:if>
				<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
					<!-- 현재 머물고 있는 페이지가 몇 페이지인지 구별할 때 -->
					<c:if test="${pb.currentPage == i }">
						<li class="active"><a href="adminMbList.do?pageNum=${i }&search=${member.search }&keyword=${member.keyword }">　${i }　</a></li>
					</c:if>
					<c:if test="${pb.currentPage != i }">
						<li><a href="adminMbList.do?pageNum=${i }&search=${member.search }&keyword=${member.keyword }">　${i }　</a></li>
					</c:if>
				</c:forEach>
				<!-- 보여줄 페이지가 뒤에 남아있는 경우(다음 버튼 활성화)=> endPage < totalPage인 경우 -->
				<c:if test="${pb.endPage < pb.totalPage }">
					<li><a href="adminMbList.do?pageNum=${pb.endPage + 1 }&search=${member.search }&keyword=${member.keyword }">
							<span class="glyphicon glyphicon-triangle-right"></span>
					</a></li>
					<li><a href="adminMbList.do?pageNum=${pb.totalPage }&search=${member.search }&keyword=${member.keyword }">
							<!-- 끝페이지로 바로 이등(순서 생각하며 넣기) -->
						<span class="glyphicon glyphicon-forward"></span>
					</a></li>
				</c:if>
			</ul>
		</div>
</body>
</html>