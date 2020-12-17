<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@include file="../include/header.jsp" %><!-- <body> -->

<div>상품 상세</div>
상품명 : ${vo.name}<br>
분류 : ${vo.type }<br>
가격 : ${vo.price }<br>
<button onclick="onClickAddCart()">장바구니 담기</button>

<c:if test="${true}">
	<form method="get">
		<input type="hidden" name="num" value="${vo.num}">
		<input type="submit" formaction="/itemboard/update" value="수정">
		<input type="submit" formaction="/itemboard/delete" value="삭제">
	</form>
</c:if>

상품설명
${vo.detail }<br>
리뷰 수 : ${vo.review}<br>
평점 : ${vo.avgrate }<br>


<%@include file="../include/footer.jsp" %><!-- </body> -->