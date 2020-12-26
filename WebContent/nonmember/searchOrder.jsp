<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../include/header.jsp" %> 

<style type="text/css">
	#wrap{width:1500px; margin:auto; position:relative; top:200px; align-content: center; text-align : center; background-color: black;}
	#wrap #box{width:260px; margin:auto; margin-top:50px; margin-bottom:50px; text-align:left; font-weight:bold; background-color: black;}
	th{font-size:20px; padding:5px;}
	td{font-size:15px; padding:5px; color:black; font-size:large;}
	
	td:nth-child(1) {width:200px;}
	td:nth-child(2) {width:100px;}
	label{font-size:large; padding:2px; color:white;}
	.button{border-style:none; border:0; cursor:pointer; outline:none; background-color:#F6F6F6; font-weight:bold;} 
	outline:none; background-color:black; color:white; font-weight:bold; font-size:15px; border-radius:15px;}
</style>
<div id="wrapper" style="width:100%; height:1100px; background-color: black;">
	<div id="wrap">
		<h1  style="color:white; margin-bottom:30px;">비회원 주문조회</h1>
		<table width="1200" cellspacing=1 cellpadding=2 bgcolor="white" style="margin: auto; margin-top:15px;">
			<tr style="background-color: #EAEAEA;">
				<th>상품명</th>
				<th>분류</th>
				<th>사이즈</th>
				<th>가격</th>
				<th>수량</th>
				<th>결제금액</th>
				<th>결제방법</th>
				<th>결제일</th>
				<th>주문상태</th>
				<th>구매확정/취소/반품</th>
			</tr>
			<c:forEach var="vo" items="${list}">
			<tr style="background-color: #F6F6F6">
				<td>${vo.iname}</td>
				<td>${vo.type}</td>
				<td>${vo.size}</td>
				<td>${vo.price}</td>
				<td>${vo.count}</td>
				<td>${vo.pay}</td>
				<td>${vo.how}</td>
				<td>${vo.paydate}</td>
				<c:choose>
					<c:when test="${vo.ship==1}"><td>배송준비중</td></c:when>
					<c:when test="${vo.ship==2}"><td>배송중</td></c:when>
					<c:when test="${vo.ship==3}"><td>배송완료</td></c:when>
					<c:when test="${vo.ship==4}"><td>구매확정</td></c:when>
					<c:when test="${vo.ship==5}"><td>주문취소</td></c:when>
					<c:when test="${vo.ship==6}"><td>반품신청</td></c:when>
					<c:when test="${vo.ship==7}"><td>반품완료</td></c:when>
				</c:choose>
				<td>
					<c:choose>
						<c:when	test="${vo.ship==1||vo.ship==3||vo.ship==4}">
						<form action="${cp}/nonmember/edit" method="post">
							<input type="hidden" name="num" value="${vo.onum}">
							<input type="hidden" name="email" value="${email}">
							<input type="hidden" name="phone" value="${phone}">
							<select name="newStatus">
								<c:if test="${vo.ship==3}">
									<option value="4">구매확정</option>			
								</c:if>
								<c:if test="${vo.ship==1}">
									<option value="5">주문취소</option>			
								</c:if>
								<c:if test="${vo.ship==3 || vo.ship==4}">
									<option value="6">반품신청</option>			
								</c:if>
								</select>
							<input type="submit" class="button" value="저장">
						</form>
						</c:when>
						<c:when test="${vo.ship==2 }">
							문의게시판을 이용해주세요
						</c:when>
						<c:when test="${vo.ship==5 }">
							취소된 주문입니다
						</c:when>
						<c:when test="${vo.ship==6 }">
							반품확인 중 입니다.
						</c:when>
						<c:when test="${vo.ship==7 }">
							반품완료된 주문 입니다
						</c:when>
						
					</c:choose>
				</td>
			</tr>
			</c:forEach>
		</table>
	</div>
</div>
<c:choose>
	<c:when test="${code=='success'}">
		<script>alert("변경완료")</script>
	</c:when>
	<c:when test="${code=='fail'}">
		<script>alert("오류가 발생했습니다<br>관리자에게 문의해주세요")</script>
	</c:when>
</c:choose>

<script>
var title= document.getElementsByClassName("button");
for(let i= 0; i<title.length; i++){
	title[i].addEventListener("mouseover", function(e) {
		e.target.style="border-bottom : 1px solid black;";
	}, false)
}
for(let i= 0; i<title.length; i++){
	title[i].addEventListener("mouseout", function(e) {
		e.target.style="border-bottom: 0px;";
	}, false)
}
</script>

<%@include file="../include/footer.jsp" %>