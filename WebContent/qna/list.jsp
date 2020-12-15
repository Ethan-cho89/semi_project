<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnaList.jsp</title>
<style>
	#wrap{width:1000px; margin:auto; align-content: center; text-align : center; background-color: pink; }
</style>
</head>
<c:set var="cp" value="${pageContext.request.contextPath }"/>
<body>
<div id="wrap">
	<h1>Q n A</h1>
	<br>
	<c:choose>
		<c:when test="${!empty list }">
			<a href="${cp }/qna/insert" style="font-size:15px">문의하기</a>
			<table border="1" width="800" style="margin: auto; margin-top:15px">
				<tr>
					<th>글번호</th>
					<th>작성자</th> <%-- 앞에 세글자 뒤에는 ***로 바꿔버리는 거 생각해보자 --%>
					<th>제목</th>
					<th>문의유형</th>
					<th>문의내용</th>
					<th>작성일</th>
				</tr>
				<c:forEach var ="vo" items="${list }"> 
					<tr>
						<td>${vo.num }</td>
						<td>${vo.nick }</td>
						<td><a href="${cp }/qna/check?num=${vo.num}">${vo.title }
						<c:if test="${vo.answer!=null }">[비밀답변]</c:if></a></td>
						<td>${vo.type }</td>
						<td>비밀글입니다</td>
						<td>${vo.regdate }</td>
					</tr>
				</c:forEach>
			</table>
			<div> <%--페이징 처리 --%>
				<c:if test="${startPageNum>10 }">
					<a href="${cp}/qna/list?pageNum=${startPageNum-1}&field=${field}&keyword=${keyword}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${startPageNum}" end="${endPageNum}">
					<c:choose>
						<c:when test="${pageNum==i }">
							<a href="${cp}/qna/list?pageNum=${i}&field=${field}&keyword=${keyword}"><span style="color:purple">[${i}]</span></a>			
						</c:when>					
						<c:otherwise>
							<a href="${cp}/qna/list?pageNum=${i}&field=${field}&keyword=${keyword}"><span style="color:blue">[${i}]</span></a>
						</c:otherwise>
					</c:choose>
				</c:forEach>			
				<c:if test="${endPageNum<pageCount}">
					<a href="${cp}/qna/list?pageNum=${endPageNum+1}&field=${field}&keyword=${keyword}">[다음]</a>
				</c:if>
			</div>
		</c:when>
		<c:otherwise>
			<h3>문의글이 존재하지 않습니다</h3>
			<a href="${cp }/qna/insert" style="font-size:15px">문의하기</a>
		</c:otherwise>
	</c:choose>
	<div>
		<form method="post" action="${cp}/qna/list">
			<select name="field">
				<option value="writer" <c:if test="${field=='writer'}">selected</c:if>>작성자</option>
				<option value="title" <c:if test="${field=='title' }">selected</c:if>>제목</option>
			</select>
			<input type="text" name = "keyword" value="${keyword }">
			<input type="submit" value="검색">
		</form>
	</div>
</div>
</body>
</html>