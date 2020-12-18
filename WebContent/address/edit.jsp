<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../include/header.jsp" %>


<style type="text/css">
	#wrap{width:1000px; margin:auto; align-content: center; text-align : center; background-color: lightorange; }
	#wrap #box{width:50%; margin:auto; margin-top:100px; text-align:left; background-color:yellow;}
</style>

<div id="wrap">
<h1>배송지 수정</h1>
<a href="${pageContext.request.contextPath }/address/index.jsp">메인</a>
	<div id="box">
		<form method="post" action="${pageContext.request.contextPath}/address/edit">
			<input type="hidden" name="num"	 value="${vo.num }">
			<input type="hidden" name="id"	 value="${vo.id}">
			배송지명 <input type="text" name ="name" value="${vo.name }"><br>
			주소 <input type="text" name="address" value="${vo.address }"><br>
			기본배송지로 설정 <input type="checkbox" name="isDefault" value="1" <c:if test="${vo.isDefault==1}">checked</c:if>><br>
			<input type="submit" value="수정">
		</form>		
	</div>
</div>

<%@include file="../include/footer.jsp" %>