<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.wrap{
        width:300px;position:relative; 
		background-color: white;
		margin:auto; margin-bottom:50px; 
		top:200px; align-content: center; 
		text-align : center; padding: 50px 50px 50px 50px;}
        }
	.mytitle{
            text-align: center;
            }
    
    input[value='로그인']{
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
		.input-link{
			font-size: 12px;
			float:right;
			padding-top: 15px;
            padding-bottom: 15px;
		}
		.input-link2{
			font-size: 12px;
            padding-top: 30px;
            padding-bottom: 15px;
            text-align: center;
		}
		a { text-decoration:none;} 

</style>
</head>
<body>
<div id="wrapper" style="width:100%; height:1100px; background-color: black;">
<form method="post" action="../member/login">
<div class="wrap">
	 <div class="mytitle"> 
	<h2>쇼핑몰 로그인</h2>
	</div>
	<div class="input-group">
	<input type="text" name="id" class="input-field" placeholder="아이디"><br>
	<input type="password" name="pwd" class="input-field" placeholder="비밀번호"><br>
	<div style="color: red;font-size: 12px">${errMsg }</div>
	<div class="input-link">
	<a href="find.jsp">아이디 찾기</a>/
	<a href="findpwd.jsp">임시비밀번호 발급</a>
	</div>
	<input type="submit" value="로그인">
	</div>
	<div class="input-link2">
	<a href="nonmember.jsp">비회원 주문 조회</a>
	</div>
</div>
</form>
</div>


</body>
</html>
<%@include file="../include/footer.jsp" %>