<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp" %> 

<c:set var="cp" value="${pageContext.request.contextPath }"/>

<style type="text/css">
	#wrap{width:1000px; margin:auto; position:relative; top:200px; align-content: center; text-align : center; background-color: black;}
	#wrap #box{width:260px; margin:auto; margin-top:50px; margin-bottom:50px; text-align:left; font-weight:bold; background-color: black;}
	td{color:white; font-size:large; padding:2px;}
	td:nth-child(1) {width:100px;}
	td:nth-child(2) {width:100px;}
	label{font-size:large; padding:2px; color:white;}
	.button{border-style:none; width:60px; height:25px; border:0; cursor:pointer; outline:none; background-color:black; color:white; font-weight:bold; font-size:15px; border-radius:15px;}

</style>
<div id="wrapper" style="width:100%; height:1100px; background-color: black;">
	<div id="wrap">
		<h1 style="color:white; margin-bottom:30px;">비회원 주문 조회</h1>
		<div id="box">
			<form method="post" action="${cp}/nonmember/searchOrder">
				<table>
					<tr>
						<td><label for="email">이메일</label></td>
						<td><input type="text" id="email" name="email" required="required"></td>
					</tr>
					<tr>
						<td><label for="phone">전화번호</label></td>
						<td><input type="text" id="phone" name="phone" required="required"></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;"><input type="submit" class="button" value="확인"></td>			
					</tr>
					<tr>
						<td colspan="2" style="text-align: center; color:white; font-size:small;" >${errMsg}</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>
<%@include file="../include/footer.jsp" %>