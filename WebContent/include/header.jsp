
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰</title>
<style>
	*{margin:0px; padding:0px;}
	#menu{width:100%; position:fixed; z-index: 999;}
	#headmenu1{width:100%; height:30px; line-height:30px; position:relative; text-align: right; color:white; font-size:13px}
	#headmenu1 a{text-decoration: none; transform:translateY(-50%); color:white; margin:15px;}
	
	#headmenu2{width:100%; height:40px; padding-top:12px; background-color:black; position:relative; text-align: center;}
	#headmenu2 a{text-decoration: none; position:relative; transform:translateY(-50%); color:white; margin:10px; }
	#headmenu2 input{ transform:translateY(-50%); margin:12px;}
	.names{float:left; margin:10px 40px; color:white; font-weight:bold;}
	
	
</style>
<script type="https://code.jquery.com/jquery-3.4.1.js" charset="utf-8"></script>
<%--slick사이트 --%>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> <%--제이쿼리 가져오기 --%>
<%--slick사이트 --%>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
</head>
<body>

<c:set var="cp" value="${pageContext.request.contextPath }"/>
<div id="menu">
	<div id="headmenu1" style="background-color: black; ">
		<c:if test="${status==4}"><a href="">관리자 페이지</a>|</c:if>
		<a href="${cp}/qna/list">고객센터</a>|
		<c:choose>
		<c:when test="${empty sessionScope.id}">
			<a href="${cp}/member/login.jsp">회원로그인</a>|
			<a href="${cp}/member/join.jsp">회원가입</a>|
		</c:when>
		<c:otherwise> 
			<a href="${cp}/member/logout">로그아웃</a>|
			<a href="${cp}/shoppinginfo/orderlist">마이페이지</a>|
		</c:otherwise>
	</c:choose>
	</div>
	<div id="headmenu2">
		<a href="/home.jsp" style="left:10px; float:left;">
		<img src="${cp}/images/logoBlack.PNG" alt="nikeLogo" width=80 style="margin-top:6px; margin-left:30px" ></a>
		<a href="/itemboard/list?gender=0" style="margin-left:290px;">남성의류</a>
		<a href="/itemboard/list?gender=1" style="margin-left:50px;">여성의류</a>
		<a href="/장바구니" style="float:right; margin-top:12px; margin-right:40px;">
		<img src="${cp}/images/basket.PNG" alt="cart" width=40 style="margin-top: 3px;" ></a>
		<input type="button" value="검색" style="float:right;">
		<input type="text" name="keyword" size=20px; style="float: right; font-size:large; border-radius:20px;">
	</div>
</div>