<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역</title>
<style type="text/css">

table.type11 {
	width: 100%;
	border-collapse: separate;
	border-spacing: 1px;
	text-align: center;
	line-height: 1.5;
	margin-bottom: 20px;
}

table.type11 th {
	width: 155px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #fff;
	background: #8aa4af;
}

table.type11 td {
	width: 155px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #eee;
}
</style>
</head>
<body>
	<div class="wrap"
		style="height: 100%; width: 1920px; display: inline-block; padding-left: 10%; padding-right: 10%; background: black;padding-top: 300px; ">
		<%@include file="../include/left.jsp"%>
		<div
			style="height: 100%; width: 1000px; float: left; margin-left: 150px">
			<c:set var="cp" value="${pageContext.request.contextPath }" />
			<h1 style="color: white;">주문내역</h1>
			<br>
			<table class=" type11">
				<tr>
					<th>주문 일자</th>
					<th>상품명</th>
					<th>결제 금액</th>
					<th>주문 상세</th>
					<th>리뷰 쓰기</th>
				</tr>
				<tbody>
					<c:forEach var="list" items="${requestScope.list }">
						<tr>
							<td>${list.paydate }</td>
							<td>${list.name }</td>
							<td>${list.pay }</td>
							<td><a
								href="${pageContext.request.contextPath }/shoppinginfo/orderdetail?num=${list.num}&cnum=${list.cnum}">조회</a></td>
							<td><c:choose>
									<c:when test="${list.rc=='0' && list.ship=='4'}">
										<a
											href="${pageContext.request.contextPath }/shoppinginfo/reviewwrite?name=${list.name}&num=${list.num}&inum=${list.inum}">리뷰
											쓰기</a>
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
								</c:choose></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<div style="text-align: center;">
				<c:if test="${startPageNum>10 }">
					<a
						href="${pageContext.request.contextPath }/shoppinginfo/orderlist?pageNum=${startPageNum-1 }">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
					<a
						href="${pageContext.request.contextPath }/shoppinginfo/orderlist?pageNum=${i }">[${i }]</a>
				</c:forEach>
				<c:if test="${endPageNum<pageCount }">
					<a
						href="${pageContext.request.contextPath }/shoppinginfo/orderlist?pageNum=${endPageNum+1 }">[다음]</a>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>

<%@include file="../include/footer.jsp"%>