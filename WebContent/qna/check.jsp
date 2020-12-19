<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../include/header.jsp" %>

<style type="text/css">
	#wrap{width:1000px; margin:auto; align-content: center; text-align : center;}
	#wrap #box{width:260px; margin:auto; margin-top:50px; margin-bottom:50px; text-align:left; font-weight:bold;}
	td:nth-child(1) {width:70px;}
	td:nth-child(2) {width:100px;}
</style>

<div id="wrap">
	<h1>Q n A</h1>
	<p style="font-weight:550;">작성자명과 비밀번호를 입력하여 주세요</p>
	<div id="box">
		<form method="post" action="${pageContext.request.contextPath }/qna/check">
			<input type="hidden" name="num" value="${num }">
			<table>
				<tr>
					<td>작성자</td>
					<td><input type="text" name="writer" required="required" value="${writer}"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pwd" required="required"></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;"><input type="submit" value="확인"></td>			
				</tr>
				<c:if test="${code!=null }">
				<tr>
					<td colspan="2" style="text-align: center; color:#980000; font-size:small;" >${code}</td>
				</tr>
				</c:if>
			</table>
		</form>
	</div>
</div>

<%@include file="../include/footer.jsp" %>