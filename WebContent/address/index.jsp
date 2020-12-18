<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>


<a href="${pageContext.request.contextPath }/address/list">배송지관리</a>
<%--회원 정보 세션에 저장 되있을거라고 가정 --%>
<%
	session.setAttribute("id", "kaka");
%>


<%@include file="../include/footer.jsp" %>