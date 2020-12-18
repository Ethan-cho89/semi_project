<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp" %>

<body>
<a href="${pageContext.request.contextPath }/coupon/list">쿠폰관리</a>
<%
	session.setAttribute("status", 4);
%>
</body>
<%@include file="../include/footer.jsp" %>