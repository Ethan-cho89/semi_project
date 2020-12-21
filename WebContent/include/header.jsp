<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰</title>
</head>
<body>
<c:set var="cp" value="${pageContext.request.contextPath }"/>
<div style="background-color: silver;">
	<a href="/home.jsp">메인화면으로</a>
	<a href="/itemboard/list?gender=0">남성의류</a>
	<a href="/itemboard/list?gender=1">여성의류</a>
	<a href="">관리자 페이지(관리자 기능)</a>
	<a href="${cp}/qna/list">고객센터</a>
	<c:choose>
		<c:when test="${empty sessionScope.id}">
			<a href="${cp}/member/login.jsp">회원로그인</a>
			<a href="${cp}/member/join.jsp">회원가입</a>
		</c:when>
		<c:otherwise> 
			<span style="color:red;font-size:0.8em">${id }님 반갑습니다.</span>
			<a href="${cp}/member/logout">로그아웃</a>
			<a href="${cp}/member/list">마이페이지</a>
		</c:otherwise>
	</c:choose>		
	
	<a href="장바구니">장바구니</a>
	
	<input type="text" name="keyword">
	<input type="button" value="검색">
</div>

