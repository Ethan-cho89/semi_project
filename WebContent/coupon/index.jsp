<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp" %>

<div style="width:1000px; height:1000px;background-color: pink; color: red;">
왜안나오냐???
<a href="${pageContext.request.contextPath }/coupon/list" style="location:relative; left:300px; top:300px; color:red;">쿠폰관리</a>
</div>
<%
	session.setAttribute("status", 4);
%>

<%@include file="../include/footer.jsp" %>