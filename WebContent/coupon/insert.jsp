<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../include/header.jsp" %>

<style type="text/css">
	#wrap{width:1000px; margin:auto; align-content: center; text-align : center; }
	#wrap #box{width:300px; margin:auto; margin-top:50px; margin-bottom:50px; text-align:left; font-weight:bold;}
	#wrap a{text-decoration: none; color:black;}
	td:nth-child(1){width:100px;}
</style>

<script>
	function check(){
		var stdate = document.getElementById("stdate");
		var exdate = document.getElementById("exdate");
		if(stdate.value==""){
			alert("시작일부터 설정해 주세요");
			exdate.value=null;
		}else if(stdate.value>exdate.value){
			alert("날짜를 확인하여 주세요");
			exdate.value=null;
		}
	}


</script>

<div id="wrap">
	<h1>쿠폰 설정</h1>
	<div id="box">
		<form method="post" action="${pageContext.request.contextPath }/coupon/insert">
			<fieldset style="align-content: center; align-items: center;">
				<legend>쿠폰 등록</legend>
				<table cellspacing="3" cellpadding="2">
				<tr>
					<td><label for="name">쿠폰명</label></td>
					<td><input type="text" id="name" name ="name" size="20" required="required"></td>
				</tr>
				<tr>
					<td><label for="dcrate">할인율</label></td> 
					<td>
						<select name="dcrate" id="dcrate">
							<option value="5">5%</option>
							<option value="10">10%</option>
							<option value="15">15%</option>
							<option value="20">20%</option>
							<option value="25">25%</option>
							<option value="30">30%</option>
							<option value="35">35%</option>
							<option value="40">40%</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>시작일</td>
					<td><input type="date" name="stdate" id="stdate" required="required"></td>
				</tr>
				<tr>
					<td>마감일</td>
					<td><input type="date" name="exdate" id="exdate" required="required" onchange="check()"></td>
				</tr>
				</table>
			</fieldset>
			<div style="text-align:center; margin-top:8px;">
				<input type="submit"value="등록">
			</div>
		</form>
	</div>
</div>

<%@include file="../include/footer.jsp" %>