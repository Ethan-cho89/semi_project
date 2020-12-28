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
	
	.imgTd{
		width: 200px;
	}
	
	/* .item{
		width: 800px;
		height: 160px;
	} */
	
	.btn {
		background-color: black;
		color: white;
		margin-left: 2px;
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
	<h1>장바구니 </h1>
	<h1 id="nonCart">장바구니가 비었습니다.</h1>
	
	<table class="list">
	</table>
	
</div>

<div class="side">
	<br>
		<br>
		<h2>총 결제 금액</h2>
		<br>
		<br>
		<h2 class="priceList">
			
		</h2>
		
		<h3 id="sumPrice"></h3>
		<form id="payForm" action="/itemboard/pay" method="get">
			<input class="payBtn" type="submit" value="구매하기">
		</form>
</div>
<script type="text/javascript">
var content = $('.content');
var itemArr;

	$(document).ready(function(){
		getCartList();
		
		$('.payBtn').on('click', function(e) {
			e.preventDefault();
			
			if(itemArr.length < 1){
				return;
			}
			
			let payForm = $('#payForm');
			
			let input = $('<input>',{type:'hidden',value:JSON.stringify(itemArr),name:'json'});
			
			payForm.append(input);
			
			payForm.submit();
			
		})
	});
	

	
	function getCartList(){
		$('#nonCart').html('');
		$('.list').empty();
		$.ajax({
			type : 'get',
			url : "/itemboard/cartList",
			success : function(data) {
				console.log(data)
				var json = JSON.parse(data);
				itemArr = json;
				if(data=='null'||json.length < 1){
					$('#nonCart').html('장바구니가 비었습니다') ;
					return;
				}
				sumPrice();
				showList(json);
			}
		});
	};
	
	function showList(obj){
		let table = $('.list');
		for(let item of obj){
			let tr = $('<tr>');
			
			let imgTd = $('<td>',{class:'imgTd'} );
			
			let path = "";
			if(item.photoList.length >0){
				path = item.photoList[0].path+item.photoList[0].name;
			}else{
				path = '/upload/nonImg.png';
			}
			imgTd.append('<img alt="" src="'+path+'" width="100%" height="150px">');
			tr.append(imgTd);
			
			let infoTd =  $('<td>');
			let nameDiv = $('<div>');
			nameDiv.append('상품명 :'+ item.iname);
			infoTd.append(nameDiv);
			
			let sizeDiv = $('<div>');
			sizeDiv.append('사이즈 :'+ item.size);
			infoTd.append(sizeDiv);
			
			let cntDiv	= $('<div>');
			//cntDiv.append(item.count+'개');	
			//cntDiv.append("<input type='number' name='cnt' min=0 max=10 value="+item.count+" >");	
			let cntInput = $('<input>',{type:'number',name:'cnt',min:1,max:10,value:item.count});
			cntInput.on('change',function(e){
				if($(this).val() > 10 ){
					$(this).val(10);
					return;
				}
				
				if($(this).val() < 1 ){
					$(this).val(1);
					return;
				}
				
			});
			
			cntDiv.append(cntInput);	
			
			let cngBtn = $('<button>',{class:'btn',text:'변경하기'});
			
			cngBtn.on('click',function(e){
				e.preventDefault();
				console.log('수정');
				modify(item,cntInput.val());
			});
			
			cntDiv.append(cngBtn);	
			//cntDiv.append("<button onClick=''>변경</button>");	
			infoTd.append(cntDiv);
			
			//TODO : 버튼 이벤트 연결 삭제 버튼 추가 결제 버튼 추가
			//cntDiv.append("<button onClick=''>변경</button>");	
			
			infoTd.append(cntDiv);
			
			tr.append(infoTd);
			
			let priceDiv = $('<td>',{class:'priceDiv'});
			priceDiv.append(item.price+'원');
			
			tr.append(priceDiv);
			
			let delBtn = $('<button>',{class:'btn',text:'삭제'});
			
			let delTd = $('<td>');
			delBtn.on('click',function(e){
				e.preventDefault();
				console.log('삭제');
				remove(item);
			});
			
			delTd.append(delBtn);
			
			tr.append(delTd);
			
			table.append(tr	);
		}
	}
	
	function modify(json,cnt){
		$.ajax({
			data : {'item': JSON.stringify(json),'cnt':cnt},
			type : 'get',
			url : "/itemboard/CartUpdate",
			success : function(data) {
				getCartList();
			}
		});
	}
	
	function remove(json){
		$.ajax({
			data : {'item': JSON.stringify(json)},
			type : 'get',
			url : "/itemboard/cartDel",
			success : function(data) {
				getCartList();
			}
		});
	}
	
	function sumPrice(){
		var h2 = $('#sumPrice');
		var priceList = $('.priceList');
		priceList.empty();
		var sum =0;
		
		for(let item of itemArr){
			let price = parseInt(item.price) * parseInt(item.count);
			priceList.append(item.iname+ ' * '+ item.count+ ' = '+ (price)+'<br>');
			sum += price;
		}
		
		h2.html(sum+'원');
	}
	
</script>

<%@include file="../include/footer.jsp" %><!-- </body> -->