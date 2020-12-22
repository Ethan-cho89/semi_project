<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp" %>

<a href="${pageContext.request.contextPath }/qna/list">QnA페이지</a>
<%
	session.setAttribute("status", 4);
%>
<%@include file="../include/footer.jsp" %>