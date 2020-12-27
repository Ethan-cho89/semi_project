<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 쓰기</title>
</head>
<body>
	<div class="wrap"
		style="height: 100%; width: 1920px; display: inline-block; padding-left: 10%; padding-right: 10%; background: black; padding-top: 300px;">
		<%@include file="../include/left.jsp"%>
		<div
			style="height: 1200px; width: 1000px; float: left; margin-left: 150px">
			<h1 style="color: white;">리뷰 쓰기</h1>
			<form method="post"
				action="${pageContext.request.contextPath }/shoppinginfo/reviewwrite">
				<input type="hidden" id="onum" name="onum"
					value="${requestScope.onum }"> <input type="hidden"
					id="inum" name="inum" value="${requestScope.inum }"> 상품명:
				${requestScope.iname }
				<h4 style="color: white;">별점 </h4><select name="rate" id="rate">
					<option value="1">★☆☆☆☆</option>
					<option value="2">★★☆☆☆</option>
					<option value="3">★★★☆☆</option>
					<option value="4">★★★★☆</option>
					<option value="5">★★★★★</option>
				</select><br><br>
				<h4 style="color: white;"> 리뷰</h4>
				<textarea ﻿maxlength="10" name="content" id="content" cols="50"
					rows="10" placeholder='리뷰를 작성해주세요'
					style="﻿overflow-y: scroll; overflow-x: hidden; resize: none;"
					required></textarea>
				<br> <input type="submit" value="리뷰 쓰기">
			</form>
		</div>
	</div>
</body>
</html>
<%@include file="../include/footer.jsp"%>