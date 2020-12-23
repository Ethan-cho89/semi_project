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
    
    input[value='찾기']{
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
<div class="wrap">
	 <div class="mytitle"> 
		<h2>아이디찾기</h2>
	 </div>
	 <div class="input-group">
		<input type="text" id="phone" placeholder="휴대폰번호" required="required" class="input-field" onKeyup="inputPhoneNumber(this);" maxlength="13"><br>
		<input type="text" id="nick" placeholder="닉네임" required="required" class="input-field"><br>
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