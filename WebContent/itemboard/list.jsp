<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@include file="../include/header.jsp" %><!-- <body> -->

<div style="background-color: gray">
<c:forEach items="${list}" var="item">
	<a href="/itemboard/get?num=${item.num}">${item.name}</a><br>
	
</c:forEach>
</div>

<%@include file="../include/footer.jsp" %><!-- </body> -->