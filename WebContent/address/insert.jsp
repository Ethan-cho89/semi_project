<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>address/insert.jsp</title>
<style type="text/css">
	#wrap{width:1000px; margin:auto; align-content: center; text-align : center; background-color: lightorange; }
	#wrap #box{width:40%; margin:auto; margin-top:100px; text-align:left; background-color:yellow;}
</style>
</head>
<body>
	<div id="wrap">
	<h1>배송지 추가</h1>
	<a href="${pageContext.request.contextPath }/address/index.jsp">메인</a>
		<div id="box">
			<form method="post" action="${pageContext.request.contextPath}/address/insert">
				<label for="name">배송지명</label>
				<input type="text" id="name" name ="name" size="40" ><br>
				<label for="address">주소&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
				<input type="text" id="address" name="address" size="40"><br>
				<input type="checkbox" name="isDefault" value="1">기본배송지로 설정<br>
				<div style="text-align: center;" ><input type="submit" value="추가"></div>
			</form>		
		</div>
	</div>
</body>
</html>