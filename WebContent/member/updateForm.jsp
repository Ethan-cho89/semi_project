<%@page import="com.semi.domain.Member"%>
<%@page import="com.semi.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>updateForm.jsp</title>
<style type="text/css">
/* .wrap { */
/* 	width: 300px; */
/* 	position: relative; */
/* 	background-color: white; */
/* 	margin: auto; */
/* 	margin-bottom: 50px; */
/* 	top: 200px; */
/* 	align-content: center; */
/* 	padding: 50px 50px 50px 50px; */
/* } */

.mytitle {
	padding-bottom: 20px;
	padding-left: 20px;
}

input[value='수정하기'] {
	width: 280px;
	height: 50;
	color: black;
	background-color: white;
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

label {
	line-height: 30px;
	font-size: 10px;
	font-weight: bold;
	color: white;
}
.e{
}
</style>
<script type="text/javascript">
	function test() {
		var form = document.getElementsByTagName('form')[0];
		var p1 = document.getElementById('pwd').value;
		var UserPassword = document.boardWriteForm.pwd;

		if (UserPassword.value.length<8 || UserPassword.value.length>17) {
			alert("비밀번호는 영문(대소문자구분),숫자,특수문자(~!@#$%^&*()-_? 만 허용)를 혼용하여 8~16자를 입력해주세요.");
			return false;
		}
		if (!UserPassword.value
				.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~,-])|([!,@,#,$,%,^,&,*,?,_,~,-].*[a-zA-Z0-9])/)) {
			alert("비밀번호는 영문(대소문자구분),숫자,특수문자(~!@#$%^&*()-_? 만 허용)를 혼용하여 8~16자를 입력해주세요.");
			return false;
		}
	}

	function inputPhoneNumber(obj) {
		var number = obj.value.replace(/[^0-9]/g, "");
		var phone = "";

		if (number.length < 4) {
			return number;
		} else if (number.length < 7) {
			phone += number.substr(0, 3);
			phone += "-";
			phone += number.substr(3);
		} else if (number.length < 11) {
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

	<div id="wrapper"
		style="height: 100%; width: 1920px; display: inline-block; padding-left: 10%; padding-right: 10%; background: black;padding-top: 300px; ">
			<%@include file="../include/left.jsp"%>
		<form method="post" action="../member/update" name="boardWriteForm">
			<div 
				style="height: 1200px; width: 1000px; float: left; margin-left: 150px">
				<div class="mytitle">
					<h2 style="color: white;">회원정보 관리</h2>
				</div>
				<div class="input-group">
					<label for="email">이메일 아이디</label><br> <input type="email"
						id="id" name="id" value="${requestScope.member.id }"
						readonly="readonly" class="input-field"
						style="height: 20px; width: 300px; background-color: gray;"><br>
					<label for="pwd">비밀번호</label><br /> <input type="password"
						id="pwd" name="pwd" value="${member.pwd }" class="input-field"
						style="height: 20px; width: 300px;" /><br /> <label for="phone">전화번호</label><br />
					<input type="text" name="phone" id="phone" value="${member.phone }"
						onKeyup="inputPhoneNumber(this);" maxlength="13"
						class="input-field" style="height: 20px; width: 300px;"><br>
					<label for="nick">닉네임</label><br /> <input type="text" name="nick"
						id="nick" value="${member.nick }" class="input-field"
						style="height: 20px; width: 300px;"><br> <label
						for="regdate">가입일</label><br /> <input type="text"
						value="${member.regdate }" readonly="readonly" class="input-field"
						style="height: 20px; width: 300px; background-color: gray;"><br>
						
					<label >이메일 수신 여부</label>
					<c:choose>
						<c:when test="${member.eokay==1}">
							<input type="checkbox" name="eokay" id="eokay" value="1"
								checked="checked">
						</c:when>
						<c:when test="${member.eokay==2}">
							<input type="checkbox" name="eokay" id="eokay" value="2">
						</c:when>
					</c:choose>

				</div>
				<input type="submit" value="수정하기" onclick="return test()">
			</div>
		</form>
	</div>
</body>
</html>
<%@include file="../include/footer.jsp"%>
