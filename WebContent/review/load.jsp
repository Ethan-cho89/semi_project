<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../include/footer.jsp" %>

<style type="text/css">
	.comm{width: 300px; height: 150px; border: 1px solid gray; margin-bottom: 5px;}
</style>

아이템번호 입력<input type="text" id="num" name="num"><br>
<input type="button"  value="검색" onclick="bring()">
<div id="result" style="width:100px;">
</div>

<script type="text/javascript">
	function bring(){
		var xhr= null;
		xhr=new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(xhr.readyState==4 && xhr.status==200){
				var xml = xhr.responseXML;
				var avgrate= xml.getElementsByTagName("avgrate")[0].firstChild.nodeValue;
				var review = xml.getElementsByTagName("review");
				var result = document.getElementById("result");
				var avg = document.createElement("div");
				avg.style="width:300px; height:50px; border:1px solid gray";
				avg.innerHTML="전체 리뷰의 평균평점  : "+avgrate;
				result.appendChild(avg);
				for(let i=0; i<review.length; i++){
					var inum = review[i].getElementsByTagName("inum")[0].firstChild.nodeValue;
					var iname= review[i].getElementsByTagName("iname")[0].textContent;
					var id = review[i].getElementsByTagName("id")[0].textContent;
					var rate = review[i].getElementsByTagName("rate")[0].textContent;
					var content = review[i].getElementsByTagName("content")[0].textContent;
					var regdate= review[i].getElementsByTagName("regdate")[0].textContent;
				    var div=document.createElement("div");
				    div.className="comm";
					var str="상품번호 : "+inum+"<br>"+
							"상품이름 : "+iname+"<br>"+
							"구매자    : "+id+"<br>"+
							"상품평점 : "+rate+"<br>"+
							"상세리뷰 : "+content+"<br>"+
							"등록일    : "+regdate+"<br><br>";
				    console.log(str);
					div.innerHTML=str;
					result.appendChild(div);
				}
			}
		}
		xhr.open('post','${pageContext.request.contextPath}/review/load',true);
		xhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
	    var num = document.getElementById("num").value;
	    var param="inum="+num;
	    xhr.send(param);
	}
</script>

<%@include file="../include/footer.jsp" %>