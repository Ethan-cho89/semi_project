<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>coupon/list.jsp</title>
<style>
	#wrap{width:1000px; margin:auto; align-content: center; text-align : center; background-color: lightgreen; }
</style>
</head>
<c:set var="cp" value="${pageContext.request.contextPath }"/>
<body>
<div id="wrap">
	<h1>쿠폰관리</h1>
	<c:choose>
		<c:when test="${!empty list }">
			<a href="${cp }/coupon/list?pageNum=1" style="font-size:15px">전체목록</a>&nbsp;|&nbsp;
			<a href="${cp }/coupon/insert" style="font-size:15px">쿠폰발급</a>
			<table border="1" width="800" style="margin: auto; margin-top:15px; text-align: center;">
				<tr>
					<th>쿠폰번호</th>
					<th>이름</th>
					<th>할인율</th>
					<th>유효기간</th>
					<th>삭제</th>
				</tr>
				<c:forEach var ="vo" items="${list }"> 
					<tr>
						<td>${vo.num }</td>
						<td>${vo.name}</td>
						<td>${vo.dcrate }%</td>
						<td>${vo.stdate }~${vo.exdate }</td>
						<td><a href="${cp}/coupon/delete?num=${vo.num }">제거</a></td>
					</tr>
				</c:forEach>
			</table>
			<div>
				<c:if test="${startPageNum>10 }">
					<a href="${cp }/coupon/list?pageNum=${startPageNum-1}&field=${field}&keyword=${keyword}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
					<c:choose>
						<c:when test="${pageNum==i }">
							<a href="${cp }/coupon/list?pageNum=${i}&field=${field}&keyword=${keyword}"><span style="color:purple">[${i}]</span></a>
						</c:when>
						<c:otherwise>
							<a href="${cp }/coupon/list?pageNum=${i}&field=${field}&keyword=${keyword}">[${i}]</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${endPageNum<pageCount }">
					<a href="${cp }/coupon/list?pageNum=${endPageNum+1}&field=${field}&keyword=${keyword}">[다음]</a>
				</c:if>
			</div>
		</c:when>
		<c:otherwise>
			<h3>쿠폰이 존재하지 않습니다</h3>
			<a href="${cp }/coupon/insert" style="font-size:15px">쿠폰발급</a>
		</c:otherwise>
	</c:choose>
	
	<br>
	<div>
		<form method="post" action="${cp}/coupon/list">
			<select name="field">
				<option value="name" <c:if test="${field=='name' }">selected</c:if>>이름</option>
				<option value="dcrate" <c:if test="${field=='dcrate'}">selected</c:if>>할인율</option>
			</select>
			<input type="text" name = "keyword" value="${keyword }">
			<input type="submit" value="검색">
		</form>
	</div>
</div>
</body>
</html>
