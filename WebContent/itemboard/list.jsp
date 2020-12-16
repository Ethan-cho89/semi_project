<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@include file="../include/header.jsp" %><!-- <body> -->

<div style="background-color: gray">
<c:choose>
	<c:when test="${param.gender eq 0 }">남성의류 목록</c:when>
	<c:otherwise>여성의류목록</c:otherwise>
</c:choose><br>

<c:forEach items="${list}" var="item">
	<a href="/itemboard/get?num=${item.num}">${item.name}</a><br>
</c:forEach>

<c:if test="${true }">
	<form action="/itemboard/regist.jsp" method="get">
		<input type="hidden" value="${param.gender}" name="gender">
		<input type="submit" value="상품등록">
	</form>
</c:if>
</div>

<%@include file="../include/footer.jsp" %><!-- </body> -->