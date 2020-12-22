<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../include/header.jsp" %>

<style type="text/css">
	#wrap{width:1000px; margin:auto; align-content: center; text-align : center; }
	#wrap #box{width:380px; margin:auto; margin-top:50px; margin-bottom:50px; text-align:left; font-weight:bold;}
	td:nth-child(1) {width:70px;}
	td:nth-child(2) {width:280px;}
	#wrap a{text-decoration: none; color:black;}
	.button{border-style:none; border:0; cursor:pointer; outline:none; background-color:white; font-weight:bold; font-size:16px;}
</style>

<c:if test="${sessionScope.id!=null }">
	<c:set var="id" value="${sessionScope.id }"/>
</c:if>
<div id="wrap">
	<h1>Q n A</h1>
	<h3>문의 등록</h3>
	<div id="box">
		<form method="post" action="${pageContext.request.contextPath }/qna/insert">
			<table cellspacing="3" cellpadding="2">
				<tr>
					<td><label for="writer">작성자</label></td>
					<td><input type="text" id="writer" name="writer" size="36px" value="${id }" required="required"></td>
				</tr>
				<tr>
					<td><label for="pwd">비밀번호 </label></td>
					<td><input type="password" id="pwd" name="pwd" size="36px" required="required"></td>
				</tr>
				<tr>
					<td><label for="title" >제목</label></td>
					<td><input type="text" id="title" name="title" size="36px" required="required"></td>
				</tr>
				<tr>
					<td>문의유형</td>
					<td><select name="type">
						<option value="회원가입">회원가입</option>
						<option value="상품">상품</option>
						<option value="배송">배송</option>
						<option value="교환/환불">교환/환불</option>
						<option value="기타">기타</option>
					</select></td>
				</tr>
				<tr>
					<td colspan="2" style="align-content: left;"><label for="contents">문의내용</label></td>
				</tr>
				<tr>
					<td colspan="2"><textarea rows="10" cols="50" id="contents" name="contents" required="required"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;"><input type="submit" value="등록" class="button"></td>
				</tr>
			</table>
		</form>
	</div>
</div>
<%@include file="../include/footer.jsp" %>