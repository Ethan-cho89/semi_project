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
	.wrap{
        width:300px;position:relative; 
		background-color: white;
		margin:auto; margin-bottom:50px; 
		top:200px; align-content: center; 
		text-align : center; padding: 50px 50px 50px 50px;}
        }
	.mytitle{
            text-align: center;
            }

        .input-group {
		    top: 180px;
		   
		    width: 280px;
		    transition: .5s;
		}
		.input-field {
		    width: 100%;
		    padding: 10px 0;
		    margin: 5px 0;
		    border: none;
		    border-bottom: 1px solid #999;
		    outline: none;
		    background: transparent;
		}
		.input-link{
			font-size: 12px;
			float:right;
			padding-top: 15px;
            padding-bottom: 15px;
		}
		a { text-decoration:none;} 


</style>
</head>
<body>
<%@include file="../include/left.jsp" %> 
<div id="wrapper" style="width:100%; height:1100px; background-color: black;">
 <div class="wrap">
	 <div class="mytitle"> 
<h2>나의 회원 정보</h2>
	 </div>
	 <div class="input-group">
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
		</div>
		     
        <br>
        	<div class="input-link">
			<a href="<%=request.getContextPath() %>/member/update?id=${member.id}">정보수정하기</a>
		</div>
		</div>   
	</div>
</body>
</html>
<%@include file="../include/footer.jsp" %>