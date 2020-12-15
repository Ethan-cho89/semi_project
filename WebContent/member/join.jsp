<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var xhr=null;
	function checkid() {
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
		xhr=new XMLHttpRequest();
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4 && xhr.status==200){
				//alert("success");
				// span#idcheck에 사용중인 아이디인지 사용 가능한 아이디인지 출력되도록 해보세요.
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
</script>
</head>
<body>
<h1>회원가입</h1>
<form name="boardWriteForm" action="../member/join" method="post">
	<label for="email">이메일 아이디</label><br />
	<input type="email" id="id" name="id" placeholder="example@domain.com" required="required">
	<input type="button" value="중복검사" onclick="checkid()"><br>
	<span id="idcheck"></span><br>
	
	<label for="pwd">비밀번호</label><br />
    <input type="password" id="pwd" name="pwd"/><br />
   
    <label for="pwd-check">비밀번호확인</label><br />
    <input type="password" id="pwd-check" /><br />
	
	<label for="phone">전화번호</label><br />
	<input type="text" name="phone" id="phone"><br>
	
	<label for="nick">닉네임</label><br />
	<input type="text" name="nick" id="nick"><br>
	
	<label for="eokay">이메일 수신 여부</label>
	<input type="checkbox" name="eokay"id="eokay">수신<br><br>
	<input type="button" value="회원가입" onclick="test()">
</form>

</body>
</html>