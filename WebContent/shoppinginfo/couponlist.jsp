<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰목록</title>
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
		style="height: 100%; width: 1920px; display: inline-block; padding-left: 10%; padding-right: 10%; background: black;padding-top: 300px;">
		<%@include file="../include/left.jsp"%>
		<div
			style="height: 100%; width: 1000px; float: left; margin-left: 150px">
			<h1 style="color: white;">쿠폰목록</h1>
			<table class="type11">
				<tr>
					<th>쿠폰명</th>
					<th>할인율</th>
					<th>지급일</th>
					<th>만료일</th>
				</tr>

				<c:forEach var="list" items="${requestScope.list }">
					<c:if test="${list.hu=='1'}">
					</c:if>
					<c:if test="${list.hu=='0'}">
						<tr>
							<td>${list.cname }</td>
							<td>${list.cd }</td>
							<td>${list.csd }</td>
							<td>${list.ced }</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>

			<div style="text-align: center;">
				<c:if test="${startPageNum>10 }">
					<a
						href="${pageContext.request.contextPath }/shoppinginfo/couponlist?pageNum=${startPageNum-1 }">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
					<a
						href="${pageContext.request.contextPath }/shoppinginfo/couponlist?pageNum=${i }">[${i }]</a>
				</c:forEach>
				<c:if test="${endPageNum<pageCount }">
					<a
						href="${pageContext.request.contextPath }/shoppinginfo/couponlist?pageNum=${endPageNum+1 }">[다음]</a>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>
<%@include file="../include/footer.jsp"%>