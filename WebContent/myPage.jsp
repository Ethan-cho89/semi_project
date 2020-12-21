<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="include/header.jsp" %><!-- <body> -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
	*{margin: 0px;padding: 0px;}
	#left{width:200px; height:400px;border:2px solid gray;background-color: white;left:350px;top:100px;position: absolute;}
	#right{background-color: white;width:500px; height:700px;left:580px;top:100px;position: absolute;}
</style>
</head>
<body>
<table id="left">	
	<tr><th>Shopping Info</th></tr>
	<tr><td><a href="${pageContext.request.contextPath }/shoppinginfo/orderlist">주문내역</a></td></tr>
	<tr><td><a href="${pageContext.request.contextPath }/shoppinginfo/couponlist">보유 쿠폰 조회</a></td></tr>
	<tr><td><a href="${pageContext.request.contextPath }/shoppinginfo/reviewlist">후기리스트</a></td></tr>
	<tr><th>My Info</th></tr>
	<tr><td>회원 정보 조회</td></tr>
	<tr><td>회원 정보 수정</td></tr>
	<tr><td>회원 탈퇴</td></tr>
</table>
<div id="right">페이지에 들어갈 것</div>
</body>
</html>
<%@include file="../include/footer.jsp" %>