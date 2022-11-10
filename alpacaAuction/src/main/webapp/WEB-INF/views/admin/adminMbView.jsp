<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
</style>
<script type="text/javascript">
	function del() {
		var cf = confirm("회원을 탈퇴시키겠습니까?");
		if(cf) {
			location.href="adminMbDelete.do?MB_id=${member.MB_id }&pageNum=${pageNum }";
		} else {
			alert("탈퇴가 취소 되었습니다");
			return;
		}
	}
</script>
</head>
<body>
<div class="row">
	<!-- 회원정보 테이블 -->
	<div class="col-md-5" id="member_box">
		<h2 class="title">회원정보</h2>
		<table class="table">
			<tr>
				<th class="col-md-4 text-center">아이디</th>
				<td class="col-md-8">${member.MB_id }</td>
			</tr>
			<tr>
				<th class="col-md-4 text-center">비밀번호</th>
				<td class="col-md-8">${member.MB_pw }</td>
			</tr>
			<tr>
				<th class="col-md-4 text-center">이름</th>
				<td class="col-md-8">${member.MB_name }</td>
			</tr>
			<tr>
				<th class="col-md-4 text-center">주민등록번호</th>
				<td class="col-md-8">${member.MB_regNum }<span>　―　</span>
					<span>${member.MB_gender }******</span></td>
			</tr>
			<tr>
				<th class="col-md-4 text-center">닉네임</th>
				<td class="col-md-8">${member.MB_nickName }</td>
			</tr>
			<tr>
				<th class="col-md-4 text-center">연락처</th>
				<td class="col-md-8">${member.MB_tel }</td>
			</tr>
			<tr>
				<th class="col-md-4 text-center">성별</th>
				<c:if test="${member.MB_gender == 1 || member.MB_gender == 3}">
					<td class="col-md-8">남자</td>
				</c:if>
				<c:if test="${member.MB_gender == 2 || member.MB_gender == 4}">
					<td class="col-md-8">여자</td>
				</c:if>
			</tr>
				
		</table>
		<div align="center">
			<a href="adminMbUpdateForm.do?MB_id=${member.MB_id }&pageNum=${pageNum }" class="btn_sm_full">회원정보수정</a>
			<a onclick="del()" class="btn_sm_full">회원탈퇴</a>
		</div>
	</div>  
	
	<!-- 차량정보 테이블 -->
	<div class="col-md-7" id="car_box">
		<h2 class="title">회원 차량 현황</h2>
		<table class="table ">
			<tr>
				<th class="col-md-2 text-center">차량번호</th>
				<th class="col-md-3 text-center">차랑명</th>
				<th class="col-md-2 text-center">연식</th>
				<th class="col-md-1 text-center">차종</th>
				<th class="col-md-2 text-center">주행거리</th>
				<th class="col-md-1 text-center">보험</th>
				<th class="col-md-1 text-center">삭제</th>
			</tr>   
			<c:if test="${empty vcList }">   
				<th colspan="7" class="text-center">등록된 차량이 없습니다</th>
			</c:if>
			<c:if test="${not empty vcList }">
				<c:forEach var="vehicle" items="${vcList }">
					<tr>
						<td class="col-md-2 text-center">${vehicle.VH_carNum }</td>
						<td class="col-md-3 text-center">${vehicle.VH_carName }</td>
						<td class="col-md-2 text-center">${vehicle.VH_carYear }</td>
						<td class="col-md-1 text-center">
							<c:if test="${vehicle.VH_carType == '1' }">소형</c:if>
							<c:if test="${vehicle.VH_carType == '2' }">중형</c:if>
			  				<c:if test="${vehicle.VH_carType == '3' }">대형</c:if>
							<c:if test="${vehicle.VH_carType == '4' }">승합</c:if></td>
						<td class="col-md-2 text-center">${vehicle.VH_km }</td>
						<td class="col-md-1 text-center">
							<c:if test="${vehicle.VH_insu == 'Y' }">있음</c:if>
							<c:if test="${vehicle.VH_insu == 'N' }">없음</c:if></td>
						<td class="col-md-1 text-center" >
							<c:if test="${vehicle.VH_del == 'Y' }">
								<a href="adminVhRollback.do?VH_num=${vehicle.VH_num }" class="inputLineA">복구</a>
							</c:if>
							<c:if test="${vehicle.VH_del == 'N' }">
								<a href="adminVehicleDelete.do?VH_num=${vehicle.VH_num }&MB_id=${member.MB_id }&pageNum=${pageNum }" class="inputLineA">삭제</a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>	
</div>
<div align="right">
	<a href="adminMbList.do?pageNum=${pageNum }" class="btn_sm_stroke">이전</a>
</div>
</body>
</html>    