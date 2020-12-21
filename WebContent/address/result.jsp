<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../include/header.jsp" %>

<style type="text/css">
	#wrap{width:1000px; margin:auto; align-content: center; margin-top:50px; margin-bottom:50px; text-align : center;}
</style>

<div id="wrap">
	<h1>배송지 관리</h1>
	<c:choose>
		<c:when test="${code=='success' }">
			<h3>요청 작업을 성공적으로 마쳤습니다</h3>
		</c:when>
		<c:otherwise>
			<h2>죄송합니다.</h2>
			<h3>요청 작업중 오류가 발생했습니다</h3>
		</c:otherwise>
	</c:choose>
	<a href="${pageContext.request.contextPath }/address/index.jsp">메인으로 돌아가기</a>
</div>

<%@include file="../include/footer.jsp" %>