<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>coupon/insert.jsp</title>
<style type="text/css">
	#wrap{width:1000px; margin:auto; align-content: center; text-align : center; background-color: lightblue; }
	#wrap #box{width:30%; margin:auto; margin-top:70px; align-content: center; text-align:left; background-color: lightgray;}
</style>
</head>
<body>
<div id="wrap">
	<h1>쿠폰 발급</h1>
	<div id="box">
		<form method="post" action="${pageContext.request.contextPath }/coupon/insert">
			<fieldset style="align-content: center;">
				<legend>쿠폰 등록</legend>
				<label for="name">쿠폰명&nbsp;&nbsp;&nbsp;&nbsp;</label> <%--대문자로만 설정할 수 있는지.. --%>
				<input type="text" id="name" name="name" required="required" ><br>
				<label for="dcrate">할인율&nbsp;&nbsp;&nbsp;&nbsp;</label>
				<select name="dcrate" id="dcrate">
					<option value="5">5%</option>
					<option value="10">10%</option>
					<option value="15">15%</option>
					<option value="20">20%</option>
					<option value="25">25%</option>
					<option value="30">30%</option>
					<option value="35">35%</option>
					<option value="40">40%</option>
				</select><br>
				시작일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="date" name="stdate" required="required"><br>
				마감일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="date" name="exdate" required="required"><br>
			</fieldset>
			<div style="text-align:center;">
					<input type="submit"value="등록">
			</div>
		</form>
	</div>
</div>
</body>
</html>