<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>changeStatus.jsp</title>
<style type="text/css">
	#wrap{width:1000px; margin:auto; align-content: center; text-align : center; background-color: lightpurple; }
	#wrap #box{width:50%; margin:auto; margin-top:100px; text-align:left; }
</style>
</head>
<body>
<div id="wrap">
	<div id="box">
		<form method="post" action="${pageContext.request.contextPath }/order/change">
			주문번호<input type="text" name="num">&nbsp;&nbsp;
			<select name="status">
				<option value="1">배송준비중</option>
				<option value="2">배송중</option>
				<option value="3">배송완료</option>
				<option value="4">구매확정</option>
				<option value="5">주문취소</option>
				<option value="6">반품신청</option>
				<option value="7">반품완료</option>
			</select>&nbsp;&nbsp;
			<input type="submit" value="업데이트">
		</form>
	</div>
</div>

</body>
</html>