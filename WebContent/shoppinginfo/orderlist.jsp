<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/header.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역</title>
<style type="text/css">
	#right{background-color: white;width:500px; height:700px;left:580px;top:100px;position: absolute;}
</style>
</head>
<body>
<%@include file="../include/left.jsp" %>  
<div id="right">
	<c:set var="cp" value="${pageContext.request.contextPath }" />
	<h1>주문내역</h1>
	<table border="1" width="500">
		<tr>
			<th>주문 일자</th>
			<th>상품명</th>
			<th>결제 금액</th>
			<th>주문 상세</th>
			<th>리뷰 쓰기</th>
		</tr>
		
		<c:forEach var ="list" items="${requestScope.list }">
			<tr>
				<td>${list.paydate }</td>
				<td>${list.name }</td>
				<td>${list.pay }</td>
				<td><a href="${pageContext.request.contextPath }/shoppinginfo/orderdetail?num=${list.num}&cnum=${list.cnum}">조회</a></td>
				<td>
					<c:choose>
						<c:when test="${list.rc=='0' && list.ship=='4'}">
							<a href="${pageContext.request.contextPath }/shoppinginfo/reviewwrite?name=${list.name}&num=${list.num}&inum=${list.inum}">리뷰 쓰기</a>
						</c:when>
						<c:when test="${list.rc=='1'}">
							리뷰 작성함
						</c:when>
						<c:when test="${list.rc=='1'&& list.ship=='6'}">
							리뷰 작성함
						</c:when>
						<c:when test="${list.rc=='0'&& list.ship=='6'}">
							반품 신청함
						</c:when>
						<c:otherwise>
							구매 확정 필요
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</c:forEach>
	</table>
	
	<div>
		<c:if test="${startPageNum>10 }">
			<a href="${pageContext.request.contextPath }/shoppinginfo/orderlist?pageNum=${startPageNum-1 }">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
			<a href="${pageContext.request.contextPath }/shoppinginfo/orderlist?pageNum=${i }">[${i }]</a>
		</c:forEach>
		<c:if test="${endPageNum<pageCount }">
			<a href="${pageContext.request.contextPath }/shoppinginfo/orderlist?pageNum=${endPageNum+1 }">[다음]</a>
		</c:if>
	</div>
	</div>
</body>
</html>
<%@include file="../include/footer.jsp" %>