<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../include/header.jsp" %>

<style>
	#wrap{width:1000px; margin:auto; margin-bottom:50px; margin-top:50px; align-content: center; text-align : center;}
	#wrap a{text-decoration: none; color:black; font-weight: 550;}
</style>
<c:set var="cp" value="${pageContext.request.contextPath }"/>

<%-- 쿠폰 관리  --%>

<div id="wrap">
	<h1>쿠폰관리</h1>
	<c:choose>
		<c:when test="${!empty list }">
			<a href="${cp }/coupon/list?pageNum=1" style="font-size:15px">전체목록</a>&nbsp;|&nbsp;
			<a href="${cp }/coupon/insert" style="font-size:15px">쿠폰발급</a>
			<table width="800" cellspacing=1 cellpadding=2 bgcolor="white" id="listTable"  style="margin: auto; margin-top:15px;">
				<tr style="background-color: #EAEAEA;">
					<th>쿠폰번호</th>
					<th>이름</th>
					<th>할인율</th>
					<th>유효기간</th>
					<th>삭제</th>
				</tr>
				<c:forEach var ="vo" items="${list }"> 
					<tr style="background-color: #F6F6F6">
						<td>${vo.num }</td>
						<td>${vo.name}</td>
						<td>${vo.dcrate }%</td>
						<td>${vo.stdate }~${vo.exdate }</td>
						<td><a href="${cp}/coupon/delete?num=${vo.num}&pageNum=${pageNum}&field=${field}&keyword=${keyword}">삭제</a></td>
					</tr>
				</c:forEach>
			</table>
			<div style="margin-top:8px">
				<c:if test="${startPageNum>10 }">
					<a href="${cp }/coupon/list?pageNum=${startPageNum-1}&field=${field}&keyword=${keyword}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
					<c:choose>
						<c:when test="${pageNum==i }">
							<a href="${cp }/coupon/list?pageNum=${i}&field=${field}&keyword=${keyword}" style="color:gray">[${i}]</a>
						</c:when>
						<c:otherwise>
							<a href="${cp }/coupon/list?pageNum=${i}&field=${field}&keyword=${keyword}" style="color:black">[${i}]</a>
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
	<div style="margin-top:8px">
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

<%@include file="../include/footer.jsp" %>