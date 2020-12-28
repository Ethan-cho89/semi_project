<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
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
	
	.payBtn{
		background-color: black;
		color: white;
		margin-left: 2px;
		width: 100%;
		height: 80px;
		position: absolute;
		bottom: 0px;
	}
	
</style>

<div class="content">
	<form method="post" action="/pay/insert" id="payForm">
		<input type="hidden" name="size" value="${fn:length(list)}" >
		<table>
			<c:set var="sum" value="0"/>
			<c:forEach items="${list}" var="item">
				<tr>
					<td> 
						<div>
							상품명 : ${item.iname}
							<input type="hidden" name="inum" value="${item.iname}" >
						</div> 
					</td>
					<td> 
						<div>
							사이즈 : ${item.size }
							<input type="hidden" name="snum" value="${item.snum }" >
						</div> 
					</td>
					<td>
						<div>
							${item.count } 개
							<input type="hidden" name="cnt" value="${item.count }" >
						</div>
					</td>
					<td>
						<div>
							${item.price * item.count}원
							<c:set var="sum" value="${sum+ item.price * item.count}"/>
							 <input type="hidden" name="price" value="${item.price}" >
							<%-- <input type="hidden" name="price" value="${item.price * item.count}" > --%>
						</div>
					</td>
				</tr>
			</c:forEach>
			<%-- <tr>
				<td colspan="4" style="text-align: center;">
					합계 : ${sum}
				</td>
			</tr> --%>
		</table>
		
		<c:if test="${id !=''  }">
			<div id="coupon">
				쿠폰 목록
				<br>
				<br>
				<div id="cList">
				</div>
			</div>
			<input type="hidden" name="cnum"  >
		</c:if>
		
		<div>
			<br>
			배송지 목록
			<br>
			<div id="addrList">
			</div>
			
			<input type="hidden" id="adNum" name="adNum" value="-1">
			
			<label>배송지 별칭 : </label><input type="text" name='aName' ><br>
			<label>주소 : </label><input type="text" name='addr' ><br>
			<label>수취인 이름 : </label><input type="text" name='rN' value=""><br>
			<label>수취인 연락처 : </label><input type="text" name='rP' value=""><br>
			
			<c:if test="${ id == '' }">
				<label>주문자 이메일 : </label><input type="text" name='oderM' value="">
				<label>주문자 연락처 : </label><input type="text" name='oderP' value="">
			</c:if>
			<br>
			<!-- <button class="btn" id="addAddress">추가하기</button> -->
		</div>
		
	</form>
</div>

<div class="side">
	<br>
		<br>
		<h2>총 결제 금액</h2>
		<br>
		<br>
		적용된 쿠폰
		<div id="useC">
			
		</div>
		
		<h3 id="sumPrice">000원</h3>
	
		<button id="payBtn" class="payBtn">결제하기</button>

</div>


<script type="text/javascript">
	var id = "<c:out value='${id}'/>";
	
	var cList = $('#cList');
	var cnum = $('input[name=cnum]');
	
	var addrList = $('#addrList');
	var rN = $("input[name='rN']");
	var rP = $("input[name='rP']");
	
	var drate = 0;
	
	var usedCoupon = $('.coupon');
	var sumPrice = <c:out value="${sum}"/>;
	var payForm =$('#payForm');
	
	$(document).ready(function(){
		
		$("#payBtn").on('click',function(e){
			e.preventDefault();
			payForm.append("<input type='hidden' name='dcrate' value="+drate+">");
			
			payForm.submit();
		});
		
		if(id!=null&&id!=""){
			getAddress();
			getCoupon();
		}
		showSum(sumPrice);
	});
	

	
	function showSum(val) {
		realPay = parseInt(val);
		$('#sumPrice').html(realPay+'원');
	}
	
	function getCoupon(){
		$.ajax({
			type : 'get',
			url : "/pay/getCoupon",
			success : function(data) {
				console.log(data);
				var json = JSON.parse(data);
				addCoupon(json);
			}	
		});
	}
	
	function addCoupon(arr){
		cnum.empty();
		for(let item of arr){
			let rad = $('<input>',{type:'radio',name:'cRadio'});
			
			rad.on('change',function(e){
				let cH = $('<h2>');
				let dc = item.coupon.dcrate;
				
				cH.append(item.coupon.name+' '+ item.coupon.dcrate+'% 할인');
				
				let useC = $('#useC');
				useC.empty();
				
				let btn = $('<button>',{text:'취소'});
				
				btn.on('click', function(e) {
					e.preventDefault();
					showSum(sumPrice);
					useC.empty();
					rad.prop("checked", false);
					cnum.val(-1);
				})
				
				useC.append(cH);
				useC.append(btn);
				
				
				cnum.val(item.num);
	
				showSum(sumPrice * (1-dc/100));
				
				drate = dc;
			});
			
			cList.append(rad);
			cList.append(item.coupon.name+' '+ item.coupon.dcrate+'% 할인 <br>');
		}
	}
	
	function getAddress(){
		$.ajax({
			type : 'get',
			url : "/pay/getAddr",
			success : function(data) {
				var json = JSON.parse(data);
				addAddress(json);
			}	
		});
	}

	function addAddress(arr){
		addrList.empty();
		let aN = $("#adNum");
		let aname = $("input[name='aName']");
		let addr = $("input[name='addr']");
		
		for(let item of arr){
			let rad = $('<input>',{type:'radio',name:'addrRadio'});
			
			rad.on('click',function(e){
				console.log(item);
				aN.val(item.num);
				aname.val(item.name);
				addr.val(item.address);
			});
			
			addrList.append(rad);
			addrList.append(item.name+'<br>');
		}
	}
	
</script>
<%@include file="../include/footer.jsp" %><!-- </body> -->