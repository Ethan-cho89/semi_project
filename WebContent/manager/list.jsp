<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function find(e) {
		var id=e.target.parentNode.nextSibling.nextSibling.nextSibling.nextSibling.value;//id
		var status=e.target.parentNode.nextSibling.nextSibling.value;
		console.log(id+status);
		location.href="<%=request.getContextPath() %>/manager/block?id="+id+"&status="+status;
	}

</script>
</head>
<body>
<h1>회원목록</h1>

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
			<td>${vo.id }</td>
			<td>${vo.phone }</td>
			<td>${vo.nick }</td>
			<td>
			<c:choose>
				<c:when test="${vo.status==0}">탈퇴회원</c:when>
				<c:when test="${vo.status==1}">일반회원</c:when>
				<c:when test="${vo.status==2}">비회원</c:when>
				<c:when test="${vo.status==3}">차단회원</c:when>
				<c:otherwise>관리자</c:otherwise>
			</c:choose>
			
			</td>
			<c:choose>
			<c:when test="${vo.status==1}">
			<td><input type="button" value="차단" onclick="find(event)"></td>
			<input type="hidden" name="status" value="${vo.status}">
			<input type="hidden" name="id" value="${vo.id}">
			</c:when>
			<c:when test="${vo.status==3}">
			<td><input type="button" value="차단 해제" onclick="find(event)"></td>
			<input type="hidden" name="status" value="${vo.status}">
			<input type="hidden" name="id" value="${vo.id}">
			</c:when>
			</c:choose>
		</tr>
	</c:forEach>	
</table>
</body>
</html>
<%@include file="../include/footer.jsp" %>