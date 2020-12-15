<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#wrap{width:1000px; margin:auto; align-content: center; text-align : center; background-color: pink; }
</style>
</head>
<body>
<div id="wrap">
	<form method="post" action="${pageContext.request.contextPath }/qna/check">
		<input type="hidden" name="num" value="${num }">
		작성자 &nbsp; &nbsp;<input type="text" name="writer"><br>
		비밀번호 &nbsp;<input type="password" name="pwd"><br>
		<input type="submit" value="확인"><br>
		<span><c:if test="${code!=null }">${code }</c:if></span>
	</form>
</div>
</body>
</html>