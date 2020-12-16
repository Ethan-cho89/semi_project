<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰</title>
</head>
<body>
<div style="background-color: silver;">
	<a href="/home.jsp">메인화면으로</a>
	<a href="/itemboard/list?gender=0">남성의류</a>
	<a href="/itemboard/list?gender=1">여성의류</a>
	<a href="#">관리자 페이지(관리자 기능)</a>
	<a href="#">고객센터</a>
	<a href="#">로그인</a>
	<a href="#">회원가입</a>
	<a href="장바구니">장바구니</a>
	
	<input type="text" name="keyword">
	<input type="button" value="검색">
</div>

