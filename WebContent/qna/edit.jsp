<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../include/header.jsp" %>

<style type="text/css">
	#wrap{width:1000px; margin:auto; position:relative; top:200px; align-content: center; text-align : center; }
	#wrap #box{width:345px; margin:auto; margin-top:20px; margin-bottom:50px; text-align:left; font-weight:bold; background-color:black;}
	td{color:white; font-size:large; padding:2px;}
	td:nth-child(1) {width:90px;}
	td:nth-child(2) {width:280px;}
	#wrap a{text-decoration: none; color:white;}
	.button{border-style:none; border:0; cursor:pointer; outline:none; background-color:black; color:white; font-weight:bold; font-size:18px;}
	input{font-weight:bold;}
</style>


<c:set var="cp" value="${pageContext.request.contextPath }"/>
<div id="wrapper" style="width:100%; height:1100px; background-color: black;">
	<div id="wrap">
		<h1 style="color:white; margin-bottom:30px;">Q n A</h1>
		<h3 style="color:white;">문의글 수정</h3>
		<div id="box">
			<form method="post" action="${pageContext.request.contextPath }/qna/edit">
				<input type="hidden" name="num" value="${vo.num }">
				<input type="hidden" name="writer" value="${vo.writer }" >
				<input type="hidden" name="pwd" value="${vo.pwd }">
				<input type="hidden" name="regdate" value="${vo.regdate }" >
				<table cellspacing="3" cellpadding="2">
					<tr>
						<td>글번호</td>
						<td><input type="text" size="30px" value="${vo.num }" disabled="disabled" ></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><input type="text"  size="30px" value="${vo.writer }" disabled="disabled"></td>
					</tr>
					<tr>
						<td>작성일</td>
						<td><input type="text"  size="30px" value="${vo.regdate }" disabled="disabled"></td>
					</tr>
					<tr>
						<td><label for="title" >제목</label></td>
						<td><input type="text" id= "title" name="title" size="30px" value="${vo.title }" required="required"></td>
					</tr>
					<tr>
						<td>문의유형</td>
						<td>
							<select name="type" id="type">
								<option value="회원가입" <c:if test="${vo.type=='회원가입'}">selected</c:if>>회원가입</option>
								<option value="상품" <c:if test="${vo.type=='상품'}">selected</c:if>>상품</option>
								<option value="배송"<c:if test="${vo.type=='배송'}">selected</c:if>>배송</option>
								<option value="교환/환불" <c:if test="${vo.type=='교환/환불'}">selected</c:if>>교환/환불</option>
								<option value="기타" <c:if test="${vo.type=='기타'}">selected</c:if>>기타</option>
							</select><br>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="align-content: left;"><label for="contents">문의내용</label></td>
					</tr>
					<tr>
						<td colspan="2"><textarea rows="5" cols="50" id="contents" name="contents" required="required">${vo.contents }</textarea></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;">
							<input type="submit" id="upload" class="button" value="등록">
						</td>
					</tr>
					<c:if test="${status==4}">
					<script>
						document.getElementById("type").disabled="disabled";
						document.getElementById("title").disabled="disabled";
						document.getElementById("contents").disabled="disabled";
						document.getElementById("upload").disabled="disabled";
						document.getElementById("upload").style="display:none;";
					</script>
					<tr></tr>
					<tr>
						<td colspan="2"><label for="answer">답글</label></td>
					</tr>
					<tr>
						<td colspan="2"><textarea rows="5" cols="50" id="answer" name="answer">${vo.answer}</textarea></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;">
							<input type="submit" class="button" value="저장">&nbsp;&nbsp;|
							<input type="reset" class="button" value="초기값">
						</td>
					</tr>
				</c:if>
				</table>
			</form>
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp" %>
