<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initialscale=1">
	<link rel="stylesheet" type="text/css" href="/tiger/resources/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/tiger/resources/bootstrap/css/common.css">
	<link rel="stylesheet" type="text/css" href="/tiger/resources/bootstrap/css/main.css">
<meta charset="UTF-8">
<title>타:이거</title>
</head> 
<body>
<div class="mainDiv">
	<div class="narrowWidth70">
		<tiles:insertAttribute name="header"></tiles:insertAttribute>
		<tiles:insertAttribute name="menu"></tiles:insertAttribute>
	</div>
	<div class="contents_main">
			<tiles:insertAttribute name="body"></tiles:insertAttribute>		
	</div>
		<tiles:insertAttribute name="footer"></tiles:insertAttribute>
</div>
</body>
</html>