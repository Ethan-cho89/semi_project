<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../include/header.jsp" %>
<%--QnA check --%>
<style type="text/css">
	#wrap{width:1000px; margin:auto; position:relative; top:200px; align-content: center; text-align : center; background-color: black;}
	#wrap a{text-decoration: none; color:black; font-weight: 550; margin-bottom:20px;}
	#wrap #box{width:260px; margin:auto; margin-top:20px; margin-bottom:50px; text-align:left; font-weight:bold; background-color: black;}
	td{color:white; font-size:large; padding:2px;}
	td:nth-child(1) {width:100px;}
	td:nth-child(2) {width:100px;}
	.button{border-style:none; width:60px; height:25px; border:0; cursor:pointer; outline:none; background-color:black; color:white; font-weight:bold; font-size:15px; border-radius:15px;}
	#wrap p{margin-top:40px;}
</style>

<div id="wrapper" style="width:100%; height:1100px; background-color: black;">
	<div id="wrap">
		<h1 style="color:white; margin-bottom:30px;">Q n A</h1>
		<a href="${cp }/qna/list?pageNum=1" style="font-size:15px; color:white;">리스트로 돌아가기</a>
		<p style="font-weight:550; color:white;">작성자명과 비밀번호를 입력하여 주세요</p>
		<div id="box">
			<form method="post" action="${pageContext.request.contextPath }/qna/check">
				<input type="hidden" name="num" value="${num }">
				<table>
					<tr>
						<td><label for="writer">작성자</label></td>
						<td><input type="text" id="writer" name="writer" required="required" value="${writer}"></td>
					</tr>
					<tr>
						<td><label for="password">비밀번호</label></td>
						<td><input type="password" id="password" name="pwd" required="required"></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;"><input type="submit" class="button" value="확인"></td>			
					</tr>
					<c:if test="${code!=null }">
					<tr>
						<td colspan="2" style="text-align: center; color:#980000; font-size:small;" >${code}</td>
					</tr>
					</c:if>
				</table>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
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
</script>
<%@include file="../include/footer.jsp" %>