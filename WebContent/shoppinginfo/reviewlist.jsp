<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰리스트</title>
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
	<script type="text/javascript">
		<c:set var="cp" value="${pageContext.request.contextPath }" />

		function revdelete() {
			var r = confirm("리뷰를 삭제하시겠습니까?");
			if (r) {
				alert("리뷰가 삭제되었습니다.");
				<c:forEach var ="list" items="${requestScope.list }">
				location.href = "${cp }/shoppinginfo/reviewdelete?onum=${list.onum}&inum=${list.inum}&rate=${list.rrate}";
				</c:forEach>
			}
		}
	</script>
	<div class="wrap"
		style="height:100%; width: 1920px; display: inline-block; padding-left: 10%; padding-right: 10%; background: black;padding-top: 300px;">
		<%@include file="../include/left.jsp"%>
		<div
			style="height: 100%; width: 1000px; float: left; margin-left: 150px">
			<h1 style="color: white;">리뷰 리스트</h1>
			<c:forEach var="list" items="${requestScope.list }">
				<table class="type11">
					<tr>
						<th>상품명: ${list.iname }</th>
						<th>작성자명: ${list.omid }<input type="button" value="리뷰삭제"
							onclick="revdelete()"></th>
					</tr>
					<tr>
						<th><c:choose>
								<c:when test="${list.rrate=='1' }">
						★☆☆☆☆
					</c:when>
								<c:when test="${list.rrate=='2' }">
						★★☆☆☆
					</c:when>
								<c:when test="${list.rrate=='3' }">
						★★★☆☆
					</c:when>
								<c:when test="${list.rrate=='4' }">
						★★★★☆
					</c:when>
								<c:when test="${list.rrate=='5' }">
						★★★★★
					</c:when>
							</c:choose></th>
						<th>작성일: ${list.rrd }</th>
					</tr>
				</table>
				<table class="type11">
					<tr>
						<td>${list.rct }</td>
					</tr>
				</table>
				<br>
				<br>
			</c:forEach>

			<div style="text-align: center;">
				<c:if test="${startPageNum>10 }">
					<a
						href="${pageContext.request.contextPath }/shoppinginfo/reviewlist?pageNum=${startPageNum-1 }">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
					<a
						href="${pageContext.request.contextPath }/shoppinginfo/reviewlist?pageNum=${i }">[${i }]</a>
				</c:forEach>
				<c:if test="${endPageNum<pageCount }">
					<a
						href="${pageContext.request.contextPath }/shoppinginfo/reviewlist?pageNum=${endPageNum+1 }">[다음]</a>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>
<%@include file="../include/footer.jsp"%>