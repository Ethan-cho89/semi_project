<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../include/header.jsp"%>

<c:set var="cp" value="${pageContext.request.contextPath }" />

<%--배송지 관리 --%>

<style>
*{margin:0px; padding:0px;}
#wrap {
	width: 1000px;
	margin: auto;
	margin-bottom: 50px;
	margin-top: 50px;
	align-content: center;
	text-align: center;
}

#wrap a {
	text-decoration: none;
	color: black;
	font-weight: 550;
}
#listTable tr{background-color: #F6F6F6;}
th:nth-child(1) {width: 100px;}
th:nth-child(2) {width: 150px;}
th:nth-child(3) {width: 400px;}
th:nth-child(4) {width: 50px;}
th:nth-child(5) {width: 100px;}
td:nth-child(1) {width: 100px;}
td:nth-child(2) {width: 150px;}
td:nth-child(3) {width: 400px;}
td:nth-child(4) {width: 50px;}
td:nth-child(5) {width: 100px;}
</style>

<%-- 삭제를 하면 ajax로 바로 그 행을 지우는 기능 추가 --%>

<div id="wrap">
	<h1>배송지 관리</h1>
			<br>
			<a href="${cp}/address/insert">배송지 추가</a>
			<table width="800" cellspacing=1 cellpadding=2 bgcolor="white"
				style="margin: auto; margin-top: 15px;">
				<tr style="background-color: #EAEAEA;">
					<th>기본배송지</th>
					<%--기본배송지냐 아니냐 --%>
					<th>배송지명</th>
					<th>주소</th>
					<th>수정</th>
					<%--수정에 들어가면 기본 배송지로 지정 가능 --%>
					<th>삭제</th>
				</tr>
			</table>
			<table width="800" cellspacing=1 cellpadding=2 bgcolor="white"
				id="listTable" style="margin: auto; font-size:14px;">
			</table>

</div>
<script>
	function remove(num) {
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var listTable = document.getElementById("listTable");
				var tr = listTable.getElementsByTagName("tr");
				var xml = xhr.responseXML;
				var code = xml.getElementsByTagName("code")[0].firstChild.nodeValue;
				if (code == "success") {
					for (let i = tr.length - 1; i >= 0; i--) {
						listTable.deleteRow(i);
					}
					getList();
				} else {
					alert("삭제하는 도중 오류가 발생하였습니다.");
				}
			}
		}
		xhr.open('get', '${cp}/address/delete?num=' + num, true);
		xhr.send();
	}

	function getList() {
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var listTable = document.getElementById("listTable");
				var json = JSON.parse(xhr.responseText);
				if(json[0].code==false){
				}else{
					for (let i = 0; i < json.length; i++) {
						var num = json[i].num;
						var isDefault = json[i].isDefault;
						var name = json[i].name;
						var address = json[i].address;
						var tr=document.createElement("tr");
						var td1=document.createElement("td");
						var td2=document.createElement("td");
						var td3=document.createElement("td");
						var td4=document.createElement("td");
						var td5=document.createElement("td");
						if(isDefault=="1"){
							td1.innerHTML="V";
							td5.innerHTML="기본배송지";
						}else{
							td1.innerHTML="";
							td5.innerHTML="<a href='javascript:remove("+num+")'>삭제</a>";
						}
						td2.innerHTML=name;
						td3.innerHTML=address;
						td4.innerHTML="<a href='${cp}/address/edit?num="+num+"'>수정</a>";
						tr.appendChild(td1);
						tr.appendChild(td2);
						tr.appendChild(td3);
						tr.appendChild(td4);
						tr.appendChild(td5);
						listTable.appendChild(tr);
					}
				}
			}
		}
		xhr.open('post', '${cp}/address/list', true);
		xhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		xhr.send();
	}
	getList();
</script>

<%@include file="../include/footer.jsp"%>