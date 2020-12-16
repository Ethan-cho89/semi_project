<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의페이지</title>
<style type="text/css">
	#wrap{width:1000px; margin:auto; align-content: center; text-align : center; background-color: pink; }
	#wrap #box{width:50%; margin:auto; margin-top:100px; text-align:left; background-color:yellow;}
</style>
</head>
<body>
<c:if test="${sessionScope.id!=null }">
	<c:set var="id" value="${sessionScope.id }"/>
</c:if>
<div id="wrap">
	<div id="box">
		<form method="post" action="${pageContext.request.contextPath }/qna/insert">
			<label for="writer">작성자&nbsp;&nbsp;&nbsp;&nbsp;</label>
			<input type="text" id="writer" name="writer" value="${id }" required="required"><br> <!-- 아이디는 3글자 이상 입력하도록 -->
			<label for="pwd">비밀번호 </label>
			<input type="password" id="pwd" name="pwd" required="required"><br>
			문의유형
			<select name="type">
				<option value="회원가입">회원가입</option>
				<option value="상품">상품</option>
				<option value="배송">배송</option>
				<option value="교환/환불">교환/환불</option>
				<option value="기타">기타</option>
			</select><br>
			<label for="title" >제목 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
			<input type="text" id="title" name="title" required="required"><br>
			<label for="contents">문의내용</label><br>
			<textarea rows="10" cols="50" id="contents" name="contents" required="required"></textarea><br>
			<input type="submit" value="등록">
		</form>
	</div>
</div>
</body>
</html>