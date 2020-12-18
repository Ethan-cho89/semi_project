<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>address/list.jsp</title>
<style type="text/css">
	#wrap{width:1000px; margin:auto; align-content: center; text-align : center; background-color: pink; }
</style>
</head>
<body>
<c:set var="cp" value="${pageContext.request.contextPath }"/>
<div id="wrap">
	<h1>배송지 관리</h1>
	<c:choose>
		<c:when test="${!empty list}">
			<br>
			<a href="${cp}/address/insert">배송지 추가</a>
			<table border="1" style="width:800px; margin: auto; margin-top:15px">
				<tr>
					<th>기본배송지</th> <%--기본배송지냐 아니냐 --%>
					<th>배송지명</th>
					<th>주소</th>
					<th>수정</th> <%--수정에 들어가면 기본 배송지로 지정 가능 --%>
					<th>삭제</th>
				</tr>
				<c:forEach var="vo" items="${list }">
					<tr>
						<td><c:if test="${vo.isDefault==1 }">V</c:if></td>
						<td>${vo.name}</td>
						<td>${vo.address}</td>
						<td><a href="${cp}/address/edit?num=${vo.num}">수정</a></td>
						<td>
						<c:choose>
							<c:when test="${vo.isDefault==1 }">기본배송지</c:when>
							<c:otherwise><a href="${cp}/address/delete?num=${vo.num}">삭제</a></c:otherwise>
						</c:choose>
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:when>
		<c:otherwise>
			<br>
			<a href="${cp}/address/insert">배송지 추가</a>
		</c:otherwise>
	</c:choose>
</div>
</body>
</html>