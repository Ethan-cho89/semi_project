<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../include/header.jsp" %>

<style type="text/css">
	#wrap{width:1000px; margin:auto; align-content: center; text-align : center; }
	#wrap #box{width:380px; margin:auto; margin-top:20px; margin-bottom:50px; text-align:left; font-weight:bold;}
	td:nth-child(1) {width:70px;}
	td:nth-child(2) {width:280px;}
	#wrap a{text-decoration: none; color:black;}
</style>

<c:set var="cp" value="${pageContext.request.contextPath }"/>
<div id="wrap">
	<h1>Q n A</h1>
	<h3>문 의 글</h3>
	<div id="box">
		<table cellspacing="3" cellpadding="2">
			<tr>
				<td>글번호</td>
				<td><input type="text" value="${vo.num }" size="36px" disabled="disabled" ></td>
			</tr>	
			<tr>
				<td>작성자</td>
				<td><input type="text" value="${vo.writer }"size="36px" disabled="disabled"></td>
			</tr>
			<tr>
				<td>작성일</td>
				<td><input type="text" value="${vo.regdate }" size="36px" disabled="disabled"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" value="${vo.title }" size="36px" disabled="disabled"></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: left;">문의내용</td>
			</tr>
			<tr>
				<td colspan="2"><textarea rows="5" cols="50" disabled="disabled">${vo.contents }</textarea></td>
			</tr>
			<c:choose>
				<c:when test="${vo.answer==null }">
					<c:choose>
						<c:when test="${status!=4}">
							<tr>
								<td colspan="2" style="text-align: center;">
								<a href="${cp}/qna/edit?num=${vo.num}">수정</a>
								&nbsp;|&nbsp;
						</c:when>
						<c:otherwise>
								<td colspan="2" style="text-align: center;">
								<a href="${cp}/qna/edit?num=${vo.num}">답글달기</a>
								&nbsp;|&nbsp;
						</c:otherwise>
					</c:choose>
								<a href="${cp}/qna/delete?num=${vo.num}">삭제</a>
								</td>
							</tr>
				</c:when>
				<c:when test="${vo.answer!=null }">
					<tr>
						<td colspan="2" style="text-align: center;">
						<a href="${cp}/qna/delete?num=${vo.num}">삭제</a></td>
					</tr>
					 <%-- 답변 있으면 수정 불가! --%> 
					<tr></tr>
					<tr>
						<td colspan="2" style="text-align:left">
							관리자답변
						</td>
					</tr>
					<tr>
						<td colspan="2"><textarea rows="5" cols="50" disabled="disabled">${vo.answer }</textarea></td>
					</tr>
					<c:if test="${status==4}">
					<tr>
						<td colspan="2" style="text-align: center;">
							<a href="${cp}/qna/edit?num=${vo.num}">답변수정</a>
							&nbsp;|&nbsp;
							<a href="${cp}/qna/answerDelete?num=${vo.num}">답변삭제</a>
						</td>
					</tr>
					</c:if>
				</c:when>
			</c:choose>
		</table>
	</div>
</div>
<c:choose>
	<c:when test="${code=='success' }">
		<script type="text/javascript">
			alert("답변을 삭제하였습니다");
		</script>
	</c:when>
	<c:when test="${code=='fail'}">
		<script type="text/javascript">
			alert("답변 삭제를 실패하였습니다");
		</script>
	</c:when>
</c:choose>

<%@include file="../include/footer.jsp" %>