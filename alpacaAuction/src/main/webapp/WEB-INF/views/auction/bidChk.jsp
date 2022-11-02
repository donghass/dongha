<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		alert("입찰 실패하셨습니다, 입찰금액을 확인하세요");
		location.href="auctionDetail.do?auction_no="+${auction_no};
	</script>
</body>
</html>