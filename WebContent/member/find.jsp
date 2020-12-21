<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var xhr=null;
	function findId() {
		var phone=document.getElementById("phone").value;
		var nick=document.getElementById("nick").value;
		xhr=new XMLHttpRequest();
		xhr.onreadystatechange=callback;
		xhr.open('get','findid.jsp?phone=' +phone +"&nick=" + nick,true);
		xhr.send();
	}
	function callback() {
		if(xhr.readyState==4 && xhr.status==200){
			var html=xhr.responseText;
			//alert(html);
			var div=document.getElementById("result");
			div.innerHTML=html;
		}
	}
</script>
</head>
<body>
<h1>아이디찾기</h1>
휴대폰번호<input type="text" id="phone"><br>
닉네임<input type="text" id="nick"><br>
<input type="button" value="찾기" onclick="findId()">
<div id="result"></div><br>
<a href="login.jsp">로그인창으로 가기</a>
</body>
</html>
<%@include file="../include/footer.jsp" %>