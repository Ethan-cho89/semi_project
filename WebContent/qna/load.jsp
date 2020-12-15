<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnaLoad</title>
<style type="text/css">
	#wrap{width:1000px; margin:auto; align-content: center; text-align : center; background-color: pink; }
	#wrap #box{width:50%; margin:auto; margin-top:100px; text-align:left; background-color:yellow;}
</style>
</head>
<body>
<c:set var="cp" value="${pageContext.request.contextPath }"/>
<div id="wrap">
	<div id="box">
		글번호 <input type="text" value="${vo.num }" disabled="disabled" ><br>
		작성자 <input type="text" value="${vo.writer }" disabled="disabled"><br>
		작성일 <input type="text" value="${vo.regdate }" disabled="disabled"><br>
		문의유형 <input type="text" value="${vo.type }" disabled="disabled"><br>
		문의내용<br>
		<textarea rows="5" cols="50" disabled="disabled">${vo.contents }</textarea><br>
		<c:choose>
			<c:when test="${vo.answer==null }">
				<c:choose>
					<c:when test="${status!=4}">
						<a href="${cp}/qna/edit?num=${vo.num}">수정</a> 
						&nbsp;|&nbsp;
					</c:when>
					<c:otherwise>
						수정 <%-- 관리자는 회원 게시글 수정 권한이 없음 삭제만 가능! --%>
						&nbsp;|&nbsp;
						<a href="${cp}/qna/edit?num=${vo.num}">답글달기</a>
						&nbsp;|&nbsp;
					</c:otherwise>
				</c:choose>
				<a href="${cp}/qna/delete?num=${vo.num}">삭제</a>
			</c:when>
			<c:when test="${vo.answer!=null }">
				<a href="${cp}/qna/delete?num=${vo.num}">삭제</a> <%-- 답변 있으면 수정 불가! --%> 
				<br><br>
				답변<br>
				<textarea rows="5" cols="50" disabled="disabled">${vo.answer }</textarea><br>
				<c:if test="${status==4}">
					<a href="${cp}/qna/edit?num=${vo.num}">답변수정</a>
					&nbsp;|&nbsp;
					<a href="${cp}/qna/answerDelete?num=${vo.num}">답변삭제</a>
				</c:if>
			</c:when>
		</c:choose>
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
</body>
</html>