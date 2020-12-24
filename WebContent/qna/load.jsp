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
	input{font-weight:bold;}
</style>

<c:set var="cp" value="${pageContext.request.contextPath }"/>
<div id="wrapper" style="width:100%; height:1100px; background-color: black;">
	<div id="wrap">
		<h1 style="color:white; margin-bottom:30px;">Q n A</h1>
		<h3 style="color:white;">문의글</h3>
		<div id="box">
			<table cellspacing="3" cellpadding="2">
				<tr>
					<td>글번호</td>
					<td><input type="text" value="${vo.num }" size="30px" disabled="disabled" ></td>
				</tr>	
				<tr>
					<td>작성자</td>
					<td><input type="text" value="${vo.writer }"size="30px" disabled="disabled"></td>
				</tr>
				<tr>
					<td>작성일</td>
					<td><input type="text" value="${vo.regdate }" size="30px" disabled="disabled"></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" value="${vo.title }" size="30px" disabled="disabled"></td>
				<tr>
					<td>문의유형</td>
					<td>
						<select name="type" id="type" disabled="disabled">
							<option value="회원가입" <c:if test="${vo.type=='회원가입'}">selected</c:if>>회원가입</option>
							<option value="상품" <c:if test="${vo.type=='상품'}">selected</c:if>>상품</option>
							<option value="배송"<c:if test="${vo.type=='배송'}">selected</c:if>>배송</option>
							<option value="교환/환불" <c:if test="${vo.type=='교환/환불'}">selected</c:if>>교환/환불</option>
							<option value="기타" <c:if test="${vo.type=='기타'}">selected</c:if>>기타</option>
						</select><br>
					</td>
				</tr>
				</tr>
				<tr>
					<td colspan="2" style="text-align: left;">문의내용</td>
				</tr>
				<tr>
					<td colspan="2"><textarea rows="5" cols="43" disabled="disabled" style="font-weight: bold;">${vo.contents }</textarea></td>
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
</div>
<%@include file="../include/footer.jsp" %>