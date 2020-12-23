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
	*{margin: 0px;padding: 0px;}
	#left{width:200px; height:400px;border:2px solid gray;background-color: white;left:350px;top:100px;position: fixed;}
	#right{background-color: white;width:500px; height:700px;left:580px;top:100px;}
</style>
</head>
<body>
<div id="wrap">
<table id="left">	
	<tr><th>Shopping Info</th></tr>
	<tr><td><a href="${pageContext.request.contextPath }/shoppinginfo/orderlist">주문내역</a></td></tr>
	<tr><td><a href="${pageContext.request.contextPath }/shoppinginfo/couponlist">보유 쿠폰 조회</a></td></tr>
	<tr><td><a href="${pageContext.request.contextPath }/shoppinginfo/reviewlist">후기리스트</a></td></tr>
	<tr><th>My Info</th></tr>
	<tr><td><a href="${pageContext.request.contextPath }/member/list">회원 정보 조회</a></td></tr>
	<tr><td><a href="${pageContext.request.contextPath }/member/update">회원 정보 수정</a></td></tr>
	<tr><td><a href="${pageContext.request.contextPath }/member/deletepage.jsp">회원 탈퇴</a></td></tr>

</table>
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
				<td><a href="${pageContext.request.contextPath }/shoppinginfo/orderdetail?num=${list.num}">조회</a></td>
				<td>
					<c:choose>
						<c:when test="${list.rc=='0' }">
							<a href="${pageContext.request.contextPath }/shoppinginfo/reviewwrite?name=${list.name}&num=${list.num}">리뷰 쓰기</a>
						</c:when>
						<c:otherwise>
							리뷰 작성됨
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
	</div>
</body>
</html>
<%@include file="../include/footer.jsp" %>