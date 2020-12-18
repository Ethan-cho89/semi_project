<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>address.jsp</title>
</head>
<body>
<a href="${pageContext.request.contextPath }/address/list">배송지관리</a>
<%--회원 정보 세션에 저장 되있을거라고 가정 --%>
<%
	session.setAttribute("id", "kaka");
%>
</body>
</html>