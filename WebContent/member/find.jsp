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
    
    input[value='찾기']{
    	 	width: 300px;
            height: 40px;

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
		    padding-bottom: 30px;
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
		.input-link2{
			font-size: 12px;
            padding-top: 30px;
            padding-bottom: 15px;
            text-align: center;
		}
		a { text-decoration:none;} 

</style>
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
	function inputPhoneNumber(obj) {
        var number = obj.value.replace(/[^0-9]/g, "");
        var phone = "";

        if(number.length < 4) {
            return number;
        } else if(number.length < 7) {
            phone += number.substr(0, 3);
            phone += "-";
            phone += number.substr(3);
        } else if(number.length < 11) {
            phone += number.substr(0, 3);
            phone += "-";
            phone += number.substr(3, 3);
            phone += "-";
            phone += number.substr(6);
        } else {
            phone += number.substr(0, 3);
            phone += "-";
            phone += number.substr(3, 4);
            phone += "-";
            phone += number.substr(7);
        }
        obj.value = phone;
    }
</script>
</head>
<body>
<div id="wrapper" style="width:100%; height:1100px; background-color: black;">
<div class="wrap">
	 <div class="mytitle">
		<h2>아이디찾기</h2><br>
	</div>
	<div class="input-group">
<input type="text" id="phone" onKeyup="inputPhoneNumber(this);" maxlength="13" placeholder="휴대폰 번호를 숫자로만 입력해주세요" class="input-field"><br>
<input type="text" id="nick" class="input-field" placeholder="닉네임을 입력해 주세요"><br>
</div>
<input type="button" value="찾기" onclick="findId()">
<div id="result"></div><br>
<div class="input-link2">
<a href="login.jsp">로그인창으로 가기</a>
</div>
</div>
</div>
</body>
</html>
<%@include file="../include/footer.jsp" %>