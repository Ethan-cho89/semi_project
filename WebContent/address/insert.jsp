<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@include file="../include/header.jsp" %>

<style type="text/css">
	#wrap{width:1000px; margin:auto; align-content: center; text-align : center; }
	#wrap #box{width:400px; margin:auto; margin-top:50px; margin-bottom:50px; text-align:left; font-weight:bold;}
	td:nth-child(1) {width:70px;}
	td:nth-child(2) {width:280px;}
	#wrap a{text-decoration: none; color:black;}
</style>

<div id="wrap">
<h1>배송지 추가</h1>
	<div id="box">
		<form method="post" action="${pageContext.request.contextPath}/address/insert">
			<input type="hidden" name="num"	 value="${vo.num }">
			<input type="hidden" name="id"	 value="${vo.id}">
			<table cellspacing="3" cellpadding="2">
				<tr>
					<td><label for="name">배송지명</label></td>
					<td><input type="text" id="name" name ="name" size="40" required="required"></td>
				</tr>
				<tr>
					<td><label for="address">주소</label></td> 
					<td><input type="text" id="address" name="address" size="40" required="required"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="checkbox" name="isDefault" value="1">기본배송지로 설정</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center"><input type="submit" value="추가"></td>
				</tr>
			</table>
		</form>		
	</div>
</div>


<%@include file="../include/footer.jsp" %>