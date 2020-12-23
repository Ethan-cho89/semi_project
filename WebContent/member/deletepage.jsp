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
            width: 250px;
            margin: 30px auto;
        }
	.mytitle{
            text-align: center;
            }
    
    input[value='확인']{
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

</style>
</head>
<body>

<form action="<%=request.getContextPath() %>/member/delete" method="post">
<div class="wrap">
	 <div class="mytitle"> 
		<h6>탈퇴를 원하실 경우 비밀번호를 입력해주세요.</h6>
	</div>
	<div class="input-group">
	<input type="password" name="pwd" class="input-field" placeholder="비밀번호"><br>
	<div><h4>${code }</h4></div>
	</div>
	<input type="submit" value="확인">
</div>
</form>
</body>
</html>
<%@include file="../include/footer.jsp" %>