<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.wrap{width:300px;position:relative; 
		background-color: white;
		margin:auto; margin-bottom:50px; 
		top:200px; align-content: center; 
		padding: 50px 50px 50px 50px;}

	.mytitle{
			
			padding-bottom: 20px;
			padding-left:20px;
            text-align: center;
            }
    
    input[value='탈퇴하기']{
    	 	width: 280px;
            height: 50;

            color: white;

            background-color: black;
            background-position: center;

            border-radius: 5px;

            padding-top: 10px;
            padding-bottom: 10px;
            
            cursor: pointer;
        } 
    
        .input-group {
		    top: 180px;
		   
		    width: 280px;
		    transition: .5s;
		}
		.input-field {
		    width: 100%;
		    padding: 10px 0;
		    margin: 5px 0;
		    border: none;
		    border-bottom: 1px solid #999;
		    outline: none;
		    background: transparent;
		}
		.code{
		text-align: center; padding-bottom: 20px;
		}

</style>
</head>
<body>
<div id="wrapper" style="width:100%; height:1100px; background-color: black;">
<form action="${pageContext.request.contextPath }/member/deletepage" method="post">
	<div class="wrap">
	 <div class="mytitle"> 
<h3>탈퇴를 원하실 경우 비밀번호를 다시한번 입력해 주세요</h3>
</div>
<br>
<div class="input-group">
<input type="password" id="pwd" name="pwd" class="input-field" placeholder="영문+숫자+특수문자 8~16자리로 입력해주세요"/><br/><br/>
<div class="code"><h5>${code }</h5></div>
</div>
<input type="submit" value="탈퇴하기">
</div>
</form>
</div>
</body>
</html>
<%@include file="../include/footer.jsp" %>