<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/header.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>왼쪽 목록</title>
</head>
<body>

 <c:choose>
 	<c:when test="${empty sessionScope.id }">
 		<li><a href="${pageContext.request.contextPath }/member/login.jsp">회원로그인</a></li>
 	</c:when>
 	<c:otherwise>
 		<li>
 		<span style="color:red;font-size:0.8em">${id }님 반갑습니다.</span>
 		<a href="${pageContext.request.contextPath }/member/logout">로그아웃</a>
 		</li>
 	</c:otherwise>
 </c:choose>

<a href="${pageContext.request.contextPath }/shoppinginfo/orderlist">주문내역</a><br>
<a href="${pageContext.request.contextPath }/shoppinginfo/couponlist">보유 쿠폰 조회</a><br>
<a href="${pageContext.request.contextPath }/shoppinginfo/reviewlist">후기리스트</a><br>
</body>
</html>
<%@include file="../include/footer.jsp" %>