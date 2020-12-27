<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문상세조회</title>
<style type="text/css">

table.type11 {
	width: 100%;
	border-collapse: separate;
	border-spacing: 1px;
	text-align: center;
	line-height: 1.5;
	margin-bottom: 20px;
}

table.type11 th {
	width: 155px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #fff;
	background: #8aa4af;
}

table.type11 td {
	width: 155px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #eee;
}
</style>
</head>
<body>
	<script type="text/javascript">
		<c:set var="cp" value="${pageContext.request.contextPath }" />

		function cancel() {
			var r = confirm("주문을 취소하시겠습니까?");
			if (r) {
				alert("주문이 취소되었습니다.");
				location.href = "${cp }/shoppinginfo/ordercancel?num=${vo.onum}&cnum=${vo.ccnum}";
			}
		}

		function back() {
			var r = confirm("반품하시겠습니까?");
			if (r) {
				alert("반품 신청이 완료되었습니다.");
				location.href = "${cp }/shoppinginfo/orderback?num=${vo.onum}&cnum=${vo.ccnum}";
			}
		}

		function orderconfirm() {
			var r = confirm("주문을 확정하시겠습니까?");
			if (r) {
				alert("주문을 확정했습니다.");
				location.href = "${cp }/shoppinginfo/orderconfirm?num=${vo.onum}&opay=${vo.opay}";
			}
		}
	</script>
	<div class="wrap"
		style="height: 100%; width: 1920px; display: inline-block; padding-left: 10%; padding-right: 10%; background: black;padding-top: 300px;">
		<%@include file="../include/left.jsp"%>
		<div
			style="height: 1200px; width: 1000px; float: left; margin-left: 150px">
			<h1 style="color: white;">주문자 정보</h1>
			<table class="type11">
				<tr>
					<th>주문 번호</th>
					<td>${vo.onum }</td>
					<th>주문 일자</th>
					<td>${vo.opd }</td>
				</tr>
				<tr>
					<th>주문자 아이디</th>
					<td>${vo.omid }</td>
					<th>주문자 연락처</th>
					<td>${vo.aop }</td>
				</tr>
			</table>
			<h1 style="color: white;">배송지 정보</h1>
			<table class="type11">
				<tr>
					<th>수취인 이름</th>
					<td>${vo.arc }</td>
					<th>수취인 연락처</th>
					<td>${vo.arp }</td>
				</tr>
			</table>
			<table class="type11">
				<tr>
					<th>주소</th>
					<td>${vo.aad }</td>
				</tr>
			</table>
			<h1 style="color: white;">주문 상품 정보</h1>
			<table class="type11">
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
					<td>${vo.iname }</td>
					<td>${vo.ssize }</td>
					<td>${vo.oc }</td>
					<td>${vo.opc }</td>
					<td>${vo.cd }</td>
					<td>${vo.opay }</td>
					<td><c:choose>
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
						</c:choose></td>
					<td>${vo.oh }</td>
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
<%@include file="../include/footer.jsp"%>