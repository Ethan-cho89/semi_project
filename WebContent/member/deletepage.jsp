<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="${pageContext.request.contextPath }/member/deletepage" method="post">
<h3>탈퇴를 원하실 경우 비밀번호를 다시한번 입력해 주세요</h3>
<br>
<input type="password" id="pwd" name="pwd" class="input-field" placeholder="영문+숫자+특수문자 8~16자리로 입력해주세요"/><br/><br/>
<input type="submit" value="탈퇴">"
<div>${code }</div>
</form>
</body>
</html>