<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../include/header.jsp" %>

<style>
	#wrap{width:100%;position:relative; margin:auto; margin-bottom:50px; top:200px; align-content: center; text-align : center;}
	#wrap a{text-decoration: none; color:black; font-weight: 550;}
	th{font-size:20px; padding:5px;}
	td{font-size:15px; padding:5px;}
	.button{border-style:none; width:60px; height:25px; border:0; cursor:pointer; outline:none; background-color:black; color:white; font-weight:bold; font-size:15px; border-radius:15px;}
	.del{}
</style>
<c:set var="cp" value="${pageContext.request.contextPath }"/>

<%-- 쿠폰 관리  --%>
<div id="wrapper" style="width:100%; height:1100px; background-color: black;">
	<div id="wrap">
		<h1 style="margin-bottom:30px; color:white;">쿠폰 관리</h1>
		<c:choose>
			<c:when test="${!empty list }">
				<a href="${cp }/coupon/list?pageNum=1" style="font-size:15px; color:white;">전체목록</a>&nbsp;&nbsp;
				<a href="${cp }/coupon/insert" style="font-size:15px; color:white;">쿠폰발급</a>
				<table width="1000" cellspacing=1 cellpadding=2 bgcolor="white" id="listTable"  style="margin: auto; margin-top:15px;">
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
							<td><a href="${cp}/coupon/delete?num=${vo.num}&pageNum=${pageNum}&field=${field}&keyword=${keyword}" class="del">삭제</a></td>
						</tr>
					</c:forEach>
				</table>
				<div style="margin-top:8px">
					<c:if test="${startPageNum>10 }">
						<a href="${cp }/coupon/list?pageNum=${startPageNum-1}&field=${field}&keyword=${keyword}" style="color:white;">[이전]</a>
					</c:if>
					<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
						<c:choose>
							<c:when test="${pageNum==i }">
								<a href="${cp }/coupon/list?pageNum=${i}&field=${field}&keyword=${keyword}" style="color:#D5D5D5">[${i}]</a>
							</c:when>
							<c:otherwise>
								<a href="${cp }/coupon/list?pageNum=${i}&field=${field}&keyword=${keyword}" style="color:white;">[${i}]</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${endPageNum<pageCount }">
						<a href="${cp }/coupon/list?pageNum=${endPageNum+1}&field=${field}&keyword=${keyword}" style="color:white;">[다음]</a>
					</c:if>
				</div>
			<div style="margin-top:8px">
				<form method="post" action="${cp}/coupon/list">
					<select name="field">
						<option value="name" <c:if test="${field=='name' }">selected</c:if>>이름</option>
						<option value="dcrate" <c:if test="${field=='dcrate'}">selected</c:if>>할인율</option>
					</select>
					<input type="text" name = "keyword" value="${keyword }">
					<input type="submit" class="button" value="검색">
				</form>
			</div>
			</c:when>
			<c:otherwise>
				<h3 style="color:white;">쿠폰이 존재하지 않습니다</h3>
				<h3>${errMsg}</h3>
				<br>
				<a href="${cp }/order/list?pageNum=1" style="font-size:15px; color:white;">전체목록</a>&nbsp;&nbsp;
				<a href="${cp }/coupon/insert" style="font-size:15px; color:white;">쿠폰발급</a>
			</c:otherwise>
		</c:choose>
	</div>
</div>
<script>
	var buttons = document.getElementsByClassName("button");
	for(let i= 0; i<buttons.length; i++){
		buttons[i].addEventListener("mouseover", function(e) {
			e.target.style="background-color: #353535;";
		}, false)
	}
	for(let i= 0; i<buttons.length; i++){
		buttons[i].addEventListener("mouseout", function(e) {
			e.target.style="background-color: black;";
		}, false)
	}
	var del= document.getElementsByClassName("del");
	for(let i= 0; i<del.length; i++){
		title[i].addEventListener("mouseover", function(e) {
			e.target.style="border-bottom : 1px solid black;";
		}, false)
	}
	for(let i= 0; i<del.length; i++){
		del[i].addEventListener("mouseout", function(e) {
			e.target.style="border-bottom: 0px;";
		}, false)
	}
</script>


<%@include file="../include/footer.jsp" %>