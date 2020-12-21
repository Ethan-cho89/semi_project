<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<%@include file="../include/header.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>마이페이지</h1>
        <table>
      
            <tr>
                <td id="title">아이디</td>
                <td>${list.id }</td>
            </tr>
                    
            <tr>
                <td id="title">휴대폰번호</td>
                <td>${list.phone }</td>
            </tr>
                    
            <tr>
                <td id="title">닉네임</td>
                <td>${list.nick  }</td>
            </tr>
                    
            <tr>
                <td id="title">가입일</td>
                <td>
                   ${list.regdate  }
                </td>
            </tr>
                    
            <tr>
                <td id="title">이메일 수신여부</td>
                <td>
                <c:choose>
	                <c:when test="${list.eokay==1}">
	                   	수신
	                  </c:when>
	                   <c:otherwise>
	                   	거부
	                   </c:otherwise>
                </c:choose>
                </td>
            </tr>

        </table>
        
        <br>
      		<a href="<%=request.getContextPath() %>/member/delete?id=${member.id }">삭제</a>
			<a href="<%=request.getContextPath() %>/member/update?id=${member.id}">수정</a>


</body>
</html>
<%@include file="../include/footer.jsp" %>