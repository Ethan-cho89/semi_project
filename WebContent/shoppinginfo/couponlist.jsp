<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰목록</title>
<style>
	*{margin: 0px;padding: 0px;}
	#left{width:200px; height:400px;border:2px solid gray;background-color: white;left:350px;top:100px;position: absolute;}
	#right{background-color: white;width:500px; height:700px;left:580px;top:100px;position: absolute;}
</style>
</head>
<body>
<table id="left">	
	<tr><th>Shopping Info</th></tr>
	<tr><td><a href="${pageContext.request.contextPath }/shoppinginfo/orderlist">주문내역</a></td></tr>
	<tr><td><a href="${pageContext.request.contextPath }/shoppinginfo/couponlist">보유 쿠폰 조회</a></td></tr>
	<tr><td><a href="${pageContext.request.contextPath }/shoppinginfo/reviewlist">후기리스트</a></td></tr>
	<tr><th>My Info</th></tr>
	<tr><td>회원 정보 조회</td></tr>
	<tr><td>회원 정보 수정</td></tr>
	<tr><td>회원 탈퇴</td></tr>
</table>
<div id="right">
	<h1>쿠폰목록</h1>
	<table border="1" width="800">
		<tr>
			<th>쿠폰명</th>
			<th>할인율</th>
			<th>지급일</th>
			<th>만료일</th>
		</tr>
		
		<c:forEach var ="list" items="${requestScope.list }">
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
	
	<div>
		<c:if test="${startPageNum>10 }">
			<a href="${pageContext.request.contextPath }/shoppinginfo/couponlist?pageNum=${startPageNum-1 }">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
			<a href="${pageContext.request.contextPath }/shoppinginfo/couponlist?pageNum=${i }">[${i }]</a>
		</c:forEach>
		<c:if test="${endPageNum<pageCount }">
			<a href="${pageContext.request.contextPath }/shoppinginfo/couponlist?pageNum=${endPageNum+1 }">[다음]</a>
		</c:if>
	</div>
	</div>
</body>
</html>
<%@include file="../include/footer.jsp" %>