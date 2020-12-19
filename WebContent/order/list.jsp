<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/header.jsp" %>

<%-- 주문 상태 변경 리스트 --%>

<style type="text/css">
	#wrap{width:1000px; margin:auto; margin-top:50px; margin-bottom:50px;
		align-content: center; text-align : center;}
	#wrap #box{width:800px; margin:auto; margin-top:50px; align-content: center; text-align:center;}
	#wrap a{text-decoration: none; color:black; font-weight: 550;}
	th:nth-child(2) {width:300px;}
</style>
<c:set var="cp" value="${pageContext.request.contextPath }"/>

<script>
	function update(num){
		var ship = document.getElementById("button").previousSibling.value;
		var xhr= new XMLHttpRequest();
		xhr.onreadystatechange = function (){
			if(xhr.readyState==4 && xhr.status==200){
				var xml= xhr.responseXML;
				var code= xml.getElementsByTagName("code")[0].firstChild.nodeValue;
				if(code=='success'){
					alert("변경완료");
				}else{
					alert("요청작업실패입니다");
				}
			}
		}
		xhr.open('post',"${cp}/order/update",true);
		var param="num="+num+"&ship="+ship;
		xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
		xhr.send(param);
	}
</script>

<div id="wrap">
	<h1>주문 관리</h1>
	<c:choose>
		<c:when test="${!empty list }">
			<div id="box">
			<table width="800" cellspacing=1 cellpadding=2 bgcolor="white" style="margin: auto; margin-top:15px;">
				<tr style="background-color: #EAEAEA;">
					<th>주문번호</th>
					<th>아이디</th>
					<th>주문일</th>
					<th>주문상태</th>
				</tr>
				<c:forEach var="vo" items="${list }"> 
				<tr style="background-color: #F6F6F6">
					<td>${vo.num }</td>
					<td>${vo.id }</td>
					<td>${vo.paydate }</td>
					<td>
						<select name="status">
							<option value="1" <c:if test="${vo.ship==1}">selected</c:if>>배송준비중</option>
							<option value="2" <c:if test="${vo.ship==2}">selected</c:if>>배송중</option>
							<option value="3" <c:if test="${vo.ship==3}">selected</c:if>>배송완료</option>
							<option value="4" <c:if test="${vo.ship==4}">selected</c:if>>구매확정</option>
							<option value="5" <c:if test="${vo.ship==5}">selected</c:if>>주문취소</option>
							<option value="6" <c:if test="${vo.ship==6}">selected</c:if>>반품신청</option>
							<option value="7" <c:if test="${vo.ship==7}">selected</c:if>>반품완료</option>
						</select><input type="button" value="저장" id="button" onclick="update(${vo.num})"> 
					</td>
				</tr>
				</c:forEach>
			</table>
			</div>
			<div style="margin-top:8px">
				<c:if test="${startPageNum>10 }">
					<a href="${cp}/order/list?pageNum=${startPageNum-1}&field=${field}&keyword=${keyword}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
					<c:choose>
						<c:when test="${pageNum==i}">
							<a href="${cp}/order/list?num=${i}&field=${field}&keyword=${keyword}">[${i}]</a>
						</c:when>
						<c:otherwise>
							<a href="${cp}/order/list?num=${i}&field=${field}&keyword=${keyword}">[${i}]</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${endPageNum<pageCount }">
					<a href="${cp}/order/list?pageNum=${endPageNum+1}&field=${field}&keyword=${keyword}">[다음]</a>
				</c:if>
				<form method="post" action="${pageContext.request.contextPath }/order/list">
					<div style="margin-top:8px;">
						<select name="field">
							<option value="num" <c:if test="${field==num}">checked</c:if>>주문번호</option>
							<option value="id" <c:if test="${field==id}">checked</c:if>>아이디</option> <%-- 가능하면 날짜 검색기능도 --%>
						</select>
						<input type="text" name="keyword">&nbsp;&nbsp;
						<input type="submit" value="검색">
					</div>
				</form>
			</div>
		</c:when>
		<c:otherwise>
			<h1>주문이 존재하지 않습니다</h1>
		</c:otherwise>
	</c:choose>
</div>

<%@include file="../include/footer.jsp" %>