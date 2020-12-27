<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../include/header.jsp" %>

<style>
	#wrap{width:100%;position:relative; margin:auto; margin-bottom:50px; top:200px; align-content: center; text-align : center;}
	#wrap a{text-decoration: none; color:black; font-weight: 550;}
	th{font-size:20px; padding:5px;}
	td{font-size:15px; padding:5px;}
	.button{border-style:none; width:60px; height:25px; border:0; cursor:pointer; outline:none; background-color:black; color:white; font-weight:bold; font-size:15px; border-radius:15px;}
</style>

<c:set var="cp" value="${pageContext.request.contextPath }"/>
<div id="wrapper" style="width:100%; height:1100px; background-color: black;">
	<div id="wrap">
		<h1 style="margin-bottom:30px; color:white;">Q n A</h1>
		<c:choose>
			<c:when test="${!empty list }">
				<a href="${cp }/qna/list?pageNum=1" style="font-size:15px; color:white;">전체목록</a>&nbsp;&nbsp;
				<a href="${cp }/qna/insert" style="font-size:15px; color:white;">문의하기</a>
				<table width="1500" cellspacing=2 bgcolor="white" style="margin: auto; margin-top:15px;">
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
							<td><a href="${cp }/qna/check?num=${vo.num}" class="title">${vo.title }
							<c:if test="${vo.answer!=null }">[비밀답변]</c:if></a></td>
							<td>${vo.type }</td>
							<td>비밀글입니다</td>
							<td>${vo.regdate }</td>
						</tr>
					</c:forEach>
				</table>
				<div style="margin-top:8px">
					<c:if test="${startPageNum>10 }">
						<a href="${cp}/qna/list?pageNum=${startPageNum-1}&field=${field}&keyword=${keyword}" style="color:white;">[이전]</a>
					</c:if>
					<c:forEach var="i" begin="${startPageNum}" end="${endPageNum}">
						<c:choose>
							<c:when test="${pageNum==i }">
								<a href="${cp}/qna/list?pageNum=${i}&field=${field}&keyword=${keyword}"><span style="color:#D5D5D5">[${i}]</span></a>			
							</c:when>					
							<c:otherwise>
								<a href="${cp}/qna/list?pageNum=${i}&field=${field}&keyword=${keyword}"><span style="color:white">[${i}]</span></a>
							</c:otherwise>
						</c:choose>
					</c:forEach>			
					<c:if test="${endPageNum<pageCount}">
						<a href="${cp}/qna/list?pageNum=${endPageNum+1}&field=${field}&keyword=${keyword}" style="color:white;">[다음]</a>
					</c:if>
				</div>
				<div style="margin-top:8px">
					<form method="post" action="${cp}/qna/list">
						<select name="field">
							<option value="writer" <c:if test="${field=='writer'}">selected</c:if>>작성자</option>
							<option value="title" <c:if test="${field=='title' }">selected</c:if>>제목</option>
						</select>
						<input type="text" name = "keyword" value="${keyword }" style="border-radius:5px;">
						<input type="submit" class="button" value="검색">
					</form>
				</div>
			</c:when>
			<c:otherwise>
				<h3 style="color:white;">문의글이 존재하지 않습니다</h3>
				<br>
				<a href="${pageContext.request.contextPath }/qna/list" style="color:white;">QnA 메인 화면으로 돌아가기</a><br><br>
				<a href="${cp }/qna/insert" style="font-size:15px; color:white;">문의하기</a>
			</c:otherwise>
		</c:choose>
	</div>
</div>
<script>
	var buttons = document.getElementsByClassName("button");
	for(let i= 0; i<buttons.length; i++){
		buttons[i].addEventListener("mouseover", function(e) {
			e.target.style="background-color: #353535;";
		}, false)
	}
	for(let i= 0; i<buttons.length; i++){
		buttons[i].addEventListener("mouseout", function(e) {
			e.target.style="background-color: black;";
		}, false)
	}
	var title= document.getElementsByClassName("title");
	for(let i= 0; i<title.length; i++){
		title[i].addEventListener("mouseover", function(e) {
			e.target.style="border-bottom : 1px solid black;";
		}, false)
	}
	for(let i= 0; i<title.length; i++){
		title[i].addEventListener("mouseout", function(e) {
			e.target.style="border-bottom: 0px;";
		}, false)
	}
</script>

<%@include file="../include/footer.jsp" %>