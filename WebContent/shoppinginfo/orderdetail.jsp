<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/header.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문상세조회</title>
<style type="text/css">
.wrap {
	width: 50%;
	padding-left: 600px;
	padding-top: 300px;
	margin: auto;
	display: inline-block
}
</style>
</head>
<body>
<div class="wrap" style="height:400px;width:70%;display:inline-block;padding-left:15%;padding-right:15%">
		<%@include file="../include/left.jsp"%>
		<div style="height:100%;width:80%;float:left;">
<script type="text/javascript">
<c:set var="cp" value="${pageContext.request.contextPath }" />

function cancel() {  
	var r = confirm("주문을 취소하시겠습니까?");
		if (r) {
			alert("주문이 취소되었습니다.");
			location.href ="${cp }/shoppinginfo/ordercancel?num=${vo.onum}&cnum=${vo.ccnum}";
		}
}

function back() {  
	var r = confirm("반품하시겠습니까?");
		if (r) {
			alert("반품 신청이 완료되었습니다.");
			location.href ="${cp }/shoppinginfo/orderback?num=${vo.onum}&cnum=${vo.ccnum}";
		}
}

function orderconfirm() {  
	var r = confirm("주문을 확정하시겠습니까?");
		if (r) {
			alert("주문을 확정했습니다.");
			location.href ="${cp }/shoppinginfo/orderconfirm?num=${vo.onum}&opay=${vo.opay}";
		}
}
</script>
	<h1>주문자 정보</h1>
	<table border="1" width="800">
		<tr>
			<th>주문 번호</th>
			<th>${vo.onum }</th>
			<th>주문 일자</th>
			<th>${vo.opd }</th>
		</tr>
		<tr>
			<th>주문자 아이디</th>
			<th>${vo.omid }</th>
			<th>주문자 연락처</th>
			<th>${vo.aop }</th>
		</tr>
	</table>
	<h1>배송지 정보</h1>
	<table border="1" width="800">
		<tr>
			<th>수취인 이름</th>
			<th>${vo.arc }</th>
			<th>수취인 연락처</th>
			<th>${vo.arp }</th>
		</tr>
	</table>
	<table border="1" width="800">
		<tr>
			<th>주소</th>
			<th>${vo.aad }</th>
		</tr>
	</table>
	<h1>주문 상품 정보</h1>
	<table border="1" width="800">
		<tr>
			<th>상품명</th>
			<th>사이즈</th>
			<th>수량</th>
			<th>가격</th>
			<th>쿠폰 할인가</th>
			<th>결제금액</th>
			<th>배송현황</th>
			<th>결제방법</th>
		</tr>
		<tr>
			<th>${vo.iname }</th>
			<th>${vo.ssize }</th>
			<th>${vo.oc }</th>
			<th>${vo.opc }</th>
			<th>${vo.cd }</th>
			<th>${vo.opay }</th>
			<th>
				<c:choose>
					<c:when test="${vo.os=='1' }">
						배송 준비 중
					</c:when>
					<c:when test="${vo.os=='2' }">
						배송 중
					</c:when>
					<c:when test="${vo.os=='3' }">
						배송 완료
					</c:when>
					<c:when test="${vo.os=='4' }">
						구매 확정
					</c:when>
					<c:when test="${vo.os=='5' }">
						주문 취소
					</c:when>
					<c:when test="${vo.os=='6' }">
						반품 신청
					</c:when>
					<c:when test="${vo.os=='7' }">
						반품 완료
					</c:when>
				</c:choose>
			</th>
			<th>${vo.oh }</th>
		</tr>
	</table>
	<c:choose>
					<c:when test="${vo.os=='1' }">
						<input type="button" value="주문 취소" onclick="cancel()">
					</c:when>
					<c:when test="${vo.os=='2' }">
						<input type="button" value="반품 신청" onclick="back()">
					</c:when>
					<c:when test="${vo.os=='3' }">
						<input type="button" value="반품 신청" onclick="back()">
						<input type="button" value="구매 확정" onclick="orderconfirm()">
					</c:when>
					<c:when test="${vo.os=='4' }">
					</c:when>
					<c:when test="${vo.os=='5' }">
					</c:when>
					<c:when test="${vo.os=='6' }">
					</c:when>
					<c:when test="${vo.os=='7' }">
					</c:when>
			</c:choose>
			</div>
	</div>			
</body>
</html>
<%@include file="../include/footer.jsp" %>