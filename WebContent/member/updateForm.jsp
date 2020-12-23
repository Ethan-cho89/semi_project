<%@page import="com.semi.domain.Member"%>
<%@page import="com.semi.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>updateForm.jsp</title>
<style type="text/css">
	.wrap{
            width: 250px;
            margin: 30px auto;
        }
	.mytitle{
            text-align: center;
            }
    .b{background-color: #EAEAEA;}
    label{font-size: 8px}
    input[value='수정하기']{
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


</style>
<script type="text/javascript">
function test() {
	var form = document.getElementsByTagName('form')[0];
  var p1 = document.getElementById('pwd').value;
  var UserPassword = document.boardWriteForm.pwd;
  
  if(UserPassword.value.length<8 || UserPassword.value.length>17) {
	    alert("비밀번호는 영문(대소문자구분),숫자,특수문자(~!@#$%^&*()-_? 만 허용)를 혼용하여 8~16자를 입력해주세요.");
	    return false;
	  }
  if(!UserPassword.value.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~,-])|([!,@,#,$,%,^,&,*,?,_,~,-].*[a-zA-Z0-9])/)) {
	      alert("비밀번호는 영문(대소문자구분),숫자,특수문자(~!@#$%^&*()-_? 만 허용)를 혼용하여 8~16자를 입력해주세요.");
	    return false;
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


<form method="post" action="../member/update" name="boardWriteForm" >
<div class="wrap">
	 <div class="mytitle"> 
		<h2>회원 정보수정</h2>
	</div>
	<label for="email">이메일 아이디</label><br />
	<input type="email" id="id" name="id" value="${requestScope.member.id }" size="35" 
	readonly="readonly" class="b"><br>
	<label for="pwd">비밀번호</label><br />
	<input type="password" id="pwd" name="pwd" value="${member.pwd }" size="35"/><br />
	<label for="phone">전화번호</label><br />
	<input type="text" name="phone" id="phone" value="${member.phone }" onKeyup="inputPhoneNumber(this);" maxlength="13" size="35"><br>
	<label for="nick">닉네임</label><br />
	<input type="text" name="nick" id="nick" value="${member.nick }" size="35"><br>
	<label for="regdate">가입일</label><br />
	<input type="text" value="${member.regdate }" readonly="readonly" class="b" size="35"><br><br>
	이메일 수신 여부
	<input type="checkbox" name="eokay"id="eokay" >수신<br><br>
	<input type="submit" value="수정하기" onclick="return test()">
</div>	
</form>
</body>
</html>
<%@include file="../include/footer.jsp" %>
