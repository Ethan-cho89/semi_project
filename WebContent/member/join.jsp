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
		text-align : center; padding: 50px 50px 50px 50px;}

	.mytitle{
			
			padding-bottom: 20px;
			padding-left:20px;
            text-align: center;
            }
    
    input[value='회원가입하기(만 14세 이상)']{
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
    input[value='중복검사']{   
    	width: 280px;
           
            color: white;

            background-color: gray;
            background-position: center;

            border-radius: 5px;

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
<script type="text/javascript">
	var xhr=null;
	function checkid() {
		var e_RegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우
		var id=document.getElementById("id").value;
		if(id.trim()==""){
			alert("아이디를 입력하세요.");
			document.getElementById("idcheck").innerHTML="";
			return;
		}
	      if(id.indexOf("@")==-1){
	    	  alert("이메일 형식이 아닙니다");
	    	  return false;
	      }
	      if(!e_RegExp.test(id)){ //이메일 유효성 검사
	            alert("올바른 이메일 형식이 아닙니다.");
	            return false;
	        }

		xhr=new XMLHttpRequest();
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4 && xhr.status==200){
				
				var data=xhr.responseXML;
				var using=data.getElementsByTagName("using")[0].firstChild.nodeValue;
				var span=document.getElementById("idcheck");
				if(eval(using)==true){ // eval("true") -->true
					span.innerHTML="사용중인 아이디입니다.";
				}else if(eval(using)==false){
					span.innerHTML="사용가능한 아이디입니다.";
				}
			}
		};
		xhr.open('get','idcheck.jsp?id=' +id,true);
		xhr.send();
	}
	
    function test() {
    	var id=document.getElementById("id").value;
    	var form = document.getElementsByTagName('form')[0];
      var p1 = document.getElementById('pwd').value;
      var p2 = document.getElementById('pwd-check').value;
      var UserPassword = document.boardWriteForm.pwd;
      
      if(UserPassword.value.length<8 || UserPassword.value.length>17) {
    	    alert("비밀번호는 영문(대소문자구분),숫자,특수문자(~!@#$%^&*()-_? 만 허용)를 혼용하여 8~16자를 입력해주세요.");
    	    return false;
    	  }
      if(!UserPassword.value.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~,-])|([!,@,#,$,%,^,&,*,?,_,~,-].*[a-zA-Z0-9])/)) {
    	      alert("비밀번호는 영문(대소문자구분),숫자,특수문자(~!@#$%^&*()-_? 만 허용)를 혼용하여 8~16자를 입력해주세요.");
    	    return false;
    	  }
      if(id.indexOf("@")==-1){
    	  alert("이메일 형식이 아닙니다");
    	  return false;
      }
   	  if( p1 != p2 ) {
              alert("비밀번호 불일치");
            return false;
          } else{
         form.submit();
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
	<form name="boardWriteForm" action="../member/join" method="post">
	<div class="wrap">
	 <div class="mytitle"> 
		<h2>쇼핑몰 멤버 가입</h2>
	 </div>
	 <div class="input-group">
		<input type="email" id="id" name="id" placeholder="사용하실 ID를 입력해주세요(수신가능 E-mail)" required="required" class="input-field">
		<input type="button" value="중복검사" onclick="checkid()"><br>
		<span id="idcheck"></span><br>
		
		
	    <input type="password" id="pwd" name="pwd" class="input-field" placeholder="영문+숫자+특수문자 8~16자리로 입력해주세요"/><br/><br/>
	   
	    
	    <input type="password" id="pwd-check" class="input-field" placeholder="패스워드를 다시 입력해 주세요"/><br /><br/>
		
		
		<input type="text" name="phone" id="phone" onKeyup="inputPhoneNumber(this);" maxlength="13" placeholder="휴대폰 번호를 숫자로만 입력해주세요" class="input-field"><br/> <br>
		
		
		<input type="text" name="nick" id="nick" class="input-field" placeholder="닉네임을 입력해 주세요"><br><br/>
		
		<label for="eokay">이메일 수신 여부</label>
		<input type="checkbox" name="eokay"id="eokay">수신<br><br>
		<input type="button" value="회원가입하기(만 14세 이상)" onclick="test()">
		</div>
		</div>
	</form>
	</div>	
<%@include file="../include/footer.jsp" %>
</body>
</html>
