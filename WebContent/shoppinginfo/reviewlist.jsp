<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/header.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰리스트</title>
</head>
<body>
<script type="text/javascript">
	<c:set var="cp" value="${pageContext.request.contextPath }" />
	
	function revdelete() {  
		var r = confirm("리뷰를 삭제하시겠습니까?");
			if (r) {
				alert("리뷰가 삭제되었습니다.");
				<c:forEach var ="list" items="${requestScope.list }">
				location.href ="${cp }/shoppinginfo/reviewdelete?onum=${list.onum}&inum=${list.inum}&rate=${list.rrate}";
				</c:forEach>
			}
	}
</script>
	<h1>리뷰 리스트</h1>
	<c:forEach var ="list" items="${requestScope.list }">
	<table border="1" width="800">
		<tr>
			<th>${list.iname }</th>
			<th>${list.omid }
			<input type="button" value="리뷰삭제" onclick="revdelete()"></th>
		</tr>
		<tr>
			<th>
				<c:choose>
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
				</c:choose>
			</th>
			<th>${list.rrd }</th>
		</tr>
	</table>
	<table border="1" width="800" height="50">
		<tr>
			<th>${list.rct }</th>
		</tr>
	</table>
	<br>
	<br>
	</c:forEach>
	
	<div>
		<c:if test="${startPageNum>10 }">
			<a href="${pageContext.request.contextPath }/shoppinginfo/reviewlist?pageNum=${startPageNum-1 }">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
			<a href="${pageContext.request.contextPath }/shoppinginfo/reviewlist?pageNum=${i }">[${i }]</a>
		</c:forEach>
		<c:if test="${endPageNum<pageCount }">
			<a href="${pageContext.request.contextPath }/shoppinginfo/reviewlist?pageNum=${endPageNum+1 }">[다음]</a>
		</c:if>
	</div>
</body>
</html>
<%@include file="../include/footer.jsp" %>