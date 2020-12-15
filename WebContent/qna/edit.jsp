<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnaEdit.jsp</title>
<style type="text/css">
	#wrap{width:1000px; margin:auto; align-content: center; text-align : center; background-color: pink; }
	#wrap #box{width:50%; margin:auto; margin-top:100px; text-align:left; background-color:yellow;}
</style>
</head>
<body>
<c:set var="cp" value="${pageContext.request.contextPath }"/>
<div id="wrap">
	<div id="box">
		<form method="post" action="${cp }/qna/edit">
		 	<input type="hidden" name="num" value="${vo.num }">
			<input type="hidden" name="writer" value="${vo.writer }" >
			<input type="hidden" name="pwd" value="${vo.pwd }">
			<input type="hidden" name="regdate" value="${vo.regdate }" >
			글번호 <input type="text" value="${vo.num }" disabled="disabled" ><br>
			작성자 <input type="text"  value="${vo.writer }" disabled="disabled"><br>
			작성일 <input type="text"  value="${vo.regdate }" disabled="disabled"><br>
			문의유형
			<select name="type" id="type">
				<option value="회원가입" <c:if test="${vo.type=='회원가입'}">selected</c:if>>회원가입</option>
				<option value="상품" <c:if test="${vo.type=='상품'}">selected</c:if>>상품</option>
				<option value="배송"<c:if test="${vo.type=='배송'}">selected</c:if>>배송</option>
				<option value="교환/환불" <c:if test="${vo.type=='교환/환불'}">selected</c:if>>교환/환불</option>
				<option value="기타" <c:if test="${vo.type=='기타'}">selected</c:if>>기타</option>
			</select><br>
			<label for="title" >제목</label>
			<input type="text" id="title" name="title" value="${vo.title }"><br>
			<label for="contents">문의내용</label><br>
			<textarea rows="5" cols="50" id="contents" name="contents">${vo.contents }</textarea><br><br>
			<c:if test="${status==4}">
				<script type="text/javascript">
					document.getElementById("type").disabled="disabled";
					document.getElementById("title").disabled="disabled";
					document.getElementById("contents").disabled="disabled";
				</script>
				답글<br>
				<textarea rows="5" cols="50" id="answer" name="answer">${vo.answer}</textarea><br>
			</c:if>
			<input type="submit" value="저장">|<input type="reset" value="초기값"><br>
		</form>
	</div>
</div>
</body>
