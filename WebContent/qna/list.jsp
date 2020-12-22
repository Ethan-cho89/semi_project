<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../include/header.jsp" %>

<style>
	#wrap{width:1000px; margin:auto; margin-bottom:50px; align-content: center; text-align : center;}
	#wrap a{text-decoration: none; color:black; font-weight: 550;}
	td{font-size:14px;}
	.button{border-style:none; border:0; cursor:pointer; outline:none; background-color:white; font-weight:bold; font-size:16px;}
</style>

<c:set var="cp" value="${pageContext.request.contextPath }"/>

<div id="wrap">
	<h1>Q n A</h1>
	<c:choose>
		<c:when test="${!empty list }">
			<a href="${cp }/qna/list?pageNum=1" style="font-size:15px">전체목록</a>&nbsp;|&nbsp;
			<a href="${cp }/qna/insert" style="font-size:15px">문의하기</a>
			<table width="800" cellspacing=1 cellpadding=2 bgcolor="white" style="margin: auto; margin-top:15px;">
				<tr style="background-color: #EAEAEA;">
					<th>글번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>문의유형</th>
					<th>문의내용</th>
					<th>작성일</th>
				</tr>
				<c:forEach var ="vo" items="${list }"> 
					<tr style="background-color: #F6F6F6">
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
			<div style="margin-top:8px">
				<c:if test="${startPageNum>10 }">
					<a href="${cp}/qna/list?pageNum=${startPageNum-1}&field=${field}&keyword=${keyword}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${startPageNum}" end="${endPageNum}">
					<c:choose>
						<c:when test="${pageNum==i }">
							<a href="${cp}/qna/list?pageNum=${i}&field=${field}&keyword=${keyword}"><span style="color:gray">[${i}]</span></a>			
						</c:when>					
						<c:otherwise>
							<a href="${cp}/qna/list?pageNum=${i}&field=${field}&keyword=${keyword}"><span style="color:black">[${i}]</span></a>
						</c:otherwise>
					</c:choose>
				</c:forEach>			
				<c:if test="${endPageNum<pageCount}">
					<a href="${cp}/qna/list?pageNum=${endPageNum+1}&field=${field}&keyword=${keyword}">[다음]</a>
				</c:if>
			</div>
			<div style="margin-top:8px">
				<form method="post" action="${cp}/qna/list">
					<select name="field">
						<option value="writer" <c:if test="${field=='writer'}">selected</c:if>>작성자</option>
						<option value="title" <c:if test="${field=='title' }">selected</c:if>>제목</option>
					</select>
					<input type="text" name = "keyword" value="${keyword }">
					<input type="submit" class="button" value="검색">
				</form>
			</div>
		</c:when>
		<c:otherwise>
			<h3>문의글이 존재하지 않습니다</h3>
			<br>
			<a href="${cp }/qna/insert" style="font-size:15px">문의하기</a><br><br>
		</c:otherwise>
	</c:choose>
</div>


<%@include file="../include/footer.jsp" %>