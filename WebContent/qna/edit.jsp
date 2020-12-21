<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../include/header.jsp" %>

<style type="text/css">
	#wrap{width:1000px; margin:auto; align-content: center; text-align : center; }
	#wrap #box{width:380px; margin:auto; margin-top:50px; margin-bottom:50px; text-align:left; font-weight:bold;}
	td:nth-child(1) {width:70px;}
	td:nth-child(2) {width:280px;}
	#wrap a{text-decoration: none; color:black;}
</style>

<c:set var="cp" value="${pageContext.request.contextPath }"/>
<div id="wrap">
	<h1>Q n A</h1>
	<h3>문의글 수정</h3>
	<div id="box">
		<form method="post" action="${pageContext.request.contextPath }/qna/edit">
			<input type="hidden" name="num" value="${vo.num }">
			<input type="hidden" name="writer" value="${vo.writer }" >
			<input type="hidden" name="pwd" value="${vo.pwd }">
			<input type="hidden" name="regdate" value="${vo.regdate }" >
			<table cellspacing="3" cellpadding="2">
				<tr>
					<td>글번호</td>
					<td><input type="text" size="36px" value="${vo.num }" disabled="disabled" ></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><input type="text"  size="36px" value="${vo.writer }" disabled="disabled"></td>
				</tr>
				<tr>
					<td>작성일</td>
					<td><input type="text"  size="36px" value="${vo.regdate }" disabled="disabled"></td>
				</tr>
				<tr>
					<td><label for="title" >제목</label></td>
					<td><input type="text" name="title" size="36px" value="${vo.title }" required="required"></td>
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
					<td colspan="2" style="text-align: center;"><input type="submit" value="등록"></td>
				</tr>
				<c:if test="${status==4}">
				<script type="text/javascript">
					document.getElementById("type").disabled="disabled";
					document.getElementById("title").disabled="disabled";
					document.getElementById("contents").disabled="disabled";
				</script>
				<tr></tr>
				<tr>
					<td colspan="2"><label for="answer">답글</label></td>
				</tr>
				<tr>
					<td colspan="2"><textarea rows="5" cols="50" id="answer" name="answer">${vo.answer}</textarea></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="저장">|<input type="reset" value="초기값"></td>
				</tr>
			</c:if>
			</table>
		</form>
	</div>
</div>


<%@include file="../include/footer.jsp" %>
