<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<style type="text/css">
	#confirm {
		font-weight: bold;
		color: #3243A8;
	}
	.progress {
		width: 65%;
		height: 15px;
		border-radius: 4px;
		background: none;
		-webkit-appearance: none;
		box-shadow:none;
	}
	#img_box {
		float: left !important;
		
	}
		
	#inform_box {
		float: right !important;
		width : 60%;
	}
	#title_box {
		margin-left : 30px;
	}
	      
	.thumbnail {
		height: 200px;
		width: 200px;
		margin-top: 0;
		margin-left: 60px;
	}
	#line {
		margin-top: 0px;
		margin-left: 120px;
	}
	 
</style>
</head>
<body>
<h1 class="text-primary">마이페이지</h1>
<div class="container narrowWidth1" align="center">
	<h2 class="title">${id}님의 프로필</h2> 
	<form>
		<div class="row">
			
			<div class="col-md-3" id="img_box"  > 
				<%-- <c:if test="${empty member.MB_img }">
					<img alt="" src="" class="thumbnail" >
				</c:if> 
				<c:if test="${not empty member.MB_img  }">  
					<img alt="" src="" class="thumbnail" >  
				 </c:if> --%>    
				 <div>
				 	<input type="button" id="line" value="정보 수정" onclick="location.href='updateForm.do'" class="btn_sm_full">
				 </div>	  
				 <!-- <div id="title_box">
					 <input onclick="location.href='updateForm.do'"     
					 		  class="btn_setting" type="button" data-toggle="tooltip" 
					 		  data-placement="top" title="프로필 변경을 원하시면 Click!">
					 		  <span id="line">정보 수정</span>
					 		  
				</div> -->
			</div>
			<div class="col-md-9 " id="inform_box">	
				<table class="table">
					<tr >
						<td class="col-md-4 text-center">아이디</td>
						<td class="col-md-8">${member.id }</td>
					</tr>
					<tr>
						<td class="col-md-4 text-center">이름</td>
						<td class="col-md-8">${member.name }</td>
					</tr> 
					<tr>
						<td class="col-md-4 text-center">연락처</td>
						<td class="col-md-8">
								${member.call }
						</td>
					</tr>   
					<tr>
						<td class="col-md-4 text-center">이메일</td>
						<td class="col-md-9">${member.email }</td>
						</tr>
					<tr>
						<td class="col-md-4 text-center">주소</td>
						<td class="col-md-8">${member.address }</td>
					</tr>
					<c:if test="${member.gender == 'm'}">
					<tr>
						<td class="col-md-4 text-center">성별</td>
						<td class="col-md-8">남자</td>
					</tr>	
					</c:if>
					<c:if test="${member.gender == 'f'}">
					<tr>
						<td class="col-md-4 text-center">성별</td>
						<td class="col-md-8">여자</td>
					</tr>	
					</c:if>	
					<tr>
						<td class="col-md-4 text-center">가입일</td>
						<td class="col-md-8">${member.created_date }</td>
					</tr>
					<tr>
						<td colspan="2"></td>
					</tr>
			  	 </table>
			</div>
		</div>
	</form>
</div>



<div class="container">
	<table class="table table-striped">
		<tr class="col-md-3"><td><a href="main.do">내 정보 수정</a></td></tr>
		<tr class="col-md-3"><td><a href="interestItemList.do">관심 물품</a></td></tr>
	</table>
</div>
<div class="container">
	<table class="table table-striped">
	<tr class="col-md-3"><td><a href="myReview.do">내가 쓴 리뷰</a></td></tr>
		<tr class="col-md-3"><td><a href="">내 구매 현황</a></td></tr>
		<tr class="col-md-3"><td><a href="">내 판매 현황</a></td></tr>
	</table>
	
</div>
</body>
</html>