<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../include/header.jsp" %>

<style type="text/css">
	#wrap{width:100%;position:relative; margin:auto; margin-bottom:50px; top:200px; align-content: center; text-align : center;}
	#wrap #box{width:400px; margin:auto; margin-top:50px; margin-bottom:50px; text-align:left; font-weight:bold;}
	#wrap a{text-decoration: none; color:black; font-weight: 550;}
	th{font-size:20px; padding:5px;}
	td{font-size:15px; padding:5px;}
	td:nth-child(1) {width:70px;}
	td:nth-child(2) {width:280px;}
	.button{border-style:none; width:60px; height:25px; border:0; cursor:pointer; outline:none; background-color:black; color:white; font-weight:bold; font-size:15px; border-radius:15px;}
	h1{color:white;}
</style>

<div id="wrapper" style="width:100%; height:1100px; background-color: black;">
	<div id="wrap">
	<h1>배송지 수정</h1>
		<div id="box">
			<form method="post" action="${pageContext.request.contextPath}/address/edit">
				<input type="hidden" name="num"	 value="${vo.num }">
				<input type="hidden" name="id"	 value="${vo.id}">
				<table cellspacing="3" cellpadding="2">
					<tr>
						<td><label for="name" style="color:white;">배송지명</label></td>
						<td><input type="text" id="name" name ="name"  size="40" required="required" value="${vo.name }"></td>
					</tr>
					<tr>
						<td><label for="address" style="color:white;">주소</label></td> 
						<td><input type="text" id="address" name="address"  size="40" required="required" value="${vo.address }"></td>
					</tr>
					<tr>
						<td colspan="2">
						<c:choose>
							<c:when test="${vo.isDefault==1 }">
								<input type="checkbox" id="check" checked disabled="disabled"><label for="check" style="color:white;">&nbsp;기본배송지로 설정</label>
								<input type="hidden" value="1" name="isDefault">
							</c:when>
							<c:when test="${vo.isDefault!=1 }">
								<input type="checkbox" id="check" name="isDefault" value="1"><label for="check" style="color:white;">&nbsp;기본배송지로 설정</label>
							
							</c:when>
						</c:choose>
						

						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;"><input type="submit" class="button" value="수정"></td>
					</tr>
				</table>
			</form>		
		</div>
	</div>
</div>
<script type="text/javascript">
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
</script>
<%@include file="../include/footer.jsp" %>