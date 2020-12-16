<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>coupon/index.jsp</title>
</head>
<body>
<a href="${pageContext.request.contextPath }/coupon/list">쿠폰관리</a>
<%
	session.setAttribute("status", 4);
%>
</body>
</html>