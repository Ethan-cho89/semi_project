<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@include file="../include/header.jsp" %><!-- <body> -->
<script src="http://code.jquery.com/jquery-latest.js"></script>

<style>
  .content{
		padding-top:82px;
		position:relative;
		height:1500px;
		padding-left: 500px;
	}
	
	table{
		width: 800px;
		margin-top: 200px;
	}
	
	tr td{
		border: 1px solid; black;
	}
	
	.btn {	
		background-color: black;
		color: white;
		margin-left: 2px;
	}
	
	#sumPrice{
		position: absolute;
		bottom: 90px;
		right: 10px;
	}
	
	.priceList{
		position: absolute;
		right: 10px;
	}
	
	.side{
		width:300px;
		height:900px;
		background-color: #F6F6F6; 
		float: right;
		right:1px;
		position: fixed;
		top: 82px;
	}
	
</style>

<div class="content">
	<table>
		<c:set var="sum" value="0"/>
		<c:forEach items="${list}" var="item">
			<tr>
				<td> 
					<div>
						상품명 : ${item.iname}
						
					</div> 
				</td>
				<td> 
					<div>
						사이즈 : ${item.size }
					</div> 
				</td>
				<td>
					<div>
						<input type="number" name="" value="${item.count }" readonly="readonly">
					</div>
				</td>
				<td>
					<div>
						${item.price * item.count}원
						<c:set var="sum" value="${sum+ item.price * item.count}"/>
					</div>
				</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="4" style="text-align: center;">
				합계 : ${sum}
			</td>
		</tr>
	</table>
	
	<c:if test="${not empty id }">
		<div id="coupon">
			쿠폰 영역
		</div>
	</c:if>
	
	<div>
		<div id="addrList">
		</div>
		
		<div>
		</div>
		<button class="btn" id="addAddress">추가하기</button>
	</div>
	
</div>


<script type="text/javascript">
	var id = "<c:out value='${id}'/>";
	
	var addrList = $('#addrList');
	
	$(document).ready(function(){
		
		if(id!=null&&id!=""){
			getAddress();
		}
		
	});
	
	function getAddress(){
		$.ajax({
			type : 'get',
			url : "/pay/getAddr",
			success : function(data) {
				console.log(data);
			}	
		});
	}
	
</script>

<%@include file="../include/footer.jsp" %><!-- </body> -->