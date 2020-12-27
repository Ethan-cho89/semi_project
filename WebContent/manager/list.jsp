<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.wrap{width:300px;position:relative; 
		margin:auto; margin-bottom:50px; 
		top:200px; align-content: center; 
		text-align : center; padding: 50px 50px 50px 50px;}

	.mytitle{
			color:white;
			padding-bottom: 20px;
			padding-left:20px;
            text-align: center;
            }
	

</style>
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
<div id="wrapper" style="width:100%; height:1100px; background-color: black;">
<div class="wrap">
	 <div class="mytitle"> 
<h1>회원목록</h1>
	 </div>
	 	 <div class="input-group">
<table border="1" width="500" style="color: white;" >
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
</div>
</div>
</div>
</body>
</html>
<%@include file="../include/footer.jsp" %>