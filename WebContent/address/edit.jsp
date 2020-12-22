<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../include/header.jsp" %>

<style type="text/css">
	#wrap{width:1000px; margin:auto; align-content: center; text-align : center; }
	#wrap #box{width:400px; margin:auto; margin-top:50px; margin-bottom:50px; text-align:left; font-weight:bold;}
	td:nth-child(1) {width:70px;}
	td:nth-child(2) {width:280px;}
	#wrap a{text-decoration: none; color:black;}
	.button{border-style:none; border:0; cursor:pointer; outline:none; background-color:white; font-weight:bold; font-size:16px;}
</style>


<div id="wrap">
<h1>배송지 수정</h1>
	<div id="box">
		<form method="post" action="${pageContext.request.contextPath}/address/edit">
			<input type="hidden" name="num"	 value="${vo.num }">
			<input type="hidden" name="id"	 value="${vo.id}">
			<table cellspacing="3" cellpadding="2">
				<tr>
					<td>배송지명</td>
					<td><input type="text" name ="name"  size="40" required="required" value="${vo.name }"></td>
				</tr>
				<tr>
					<td>주소</td> 
					<td><input type="text" name="address"  size="40" required="required" value="${vo.address }"></td>
				</tr>
				<tr>
					<td colspan="2">
					<input type="checkbox" name="isDefault" value="1" <c:if test="${vo.isDefault==1}">checked</c:if>>기본배송지로 설정 
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;"><input type="submit" class="button" value="수정"></td>
				</tr>
			</table>
		</form>		
	</div>
</div>

<%@include file="../include/footer.jsp" %>