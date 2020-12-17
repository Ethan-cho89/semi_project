<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>비밀번호 찾기</h1>
<form action="${pageContext.request.contextPath }/findpwd" method="post">
아이디<input type="text" id="id" name="id"><br>
휴대폰번호<input type="text" id="phone" name="phone"><br>
닉네임<input type="text" id="nick" name="nick"><br>
<input type="submit" value="찾기">
<div>${msg }</div><br>
<a href="login.jsp">로그인창으로 가기</a>
</form>
</body>
</html>