<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
/* 	function block() {
		var status=document.getElementById("status").value;
		if(status==1){
			alert("차단 완료");
			}else if(status==3){
				alert("차단 해제");
			}
		} */

</script>
</head>
<body>
<h1>회원목록</h1>
<form action="<%=request.getContextPath() %>/manager/block">
<table border="1" width="500">
	<tr>
		<th>아이디</th>
		<th>휴대폰번호</th>
		<th>닉네임</th>
		<th>회원상태</th>
		<th>차단여부</th>
	</tr>
	<c:forEach var="vo" items="${requestScope.list }">
		<tr>
			<th>${vo.id }</th>
			<th>${vo.phone }</th>
			<th>${vo.nick }</th>
			<th>
			<c:choose>
				<c:when test="${vo.status==0}">탈퇴회원</c:when>
				<c:when test="${vo.status==1}">일반회원</c:when>
				<c:when test="${vo.status==2}">비회원</c:when>
				<c:when test="${vo.status==3}">차단회원</c:when>
				<c:otherwise>관리자</c:otherwise>
			</c:choose>
			
			</th>
			<c:choose>
			<c:when test="${vo.status==1}">
			<th><input type="submit" value="차단"></th>
			<input type="hidden" name="status" value="${vo.status}">
			<input type="hidden" name="id" value="${vo.id}">
			</c:when>
			<c:when test="${vo.status==3}">
			<th><input type="submit" value="차단 해제"></th>
			<input type="hidden" name="status" value="${vo.status}">
			<input type="hidden" name="id" value="${vo.id}">
			</c:when>
			</c:choose>
		</tr>
	</c:forEach>	
</table>
</form>
</body>
</html>