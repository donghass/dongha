<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- 반응형웹 장비에 맞게 폭설정 -->
<meta name="viewport" content="width=device-width,initalsalce=1">
<style>
	th {background: pink; color:black; text-align: center; font-weight: bold;}
	.err{ color:red; font-weight: bold;}
</style>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<link rel="stylesheet" type="text/css" href="${path }/resources/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="${path }/resources/bootstrap/js/jquery.js"></script>
<script type="text/javascript" src="${path }/resources/bootstrap/js/bootstrap.min.js"></script>
