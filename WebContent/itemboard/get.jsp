<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@include file="../include/header.jsp" %><!-- <body> -->
<script src="http://code.jquery.com/jquery-latest.js"></script>

<style>

  #itemContent{
 	border: 1px solid;
 	width: 900px;
  }
  
  .content{
		padding-top:82px;
		position:relative;
		height:1500px;
		padding-left: 500px;
	}
	
	.btn,#reviewUl button {
		background-color: black;
		color: white;
		width: 50px;
		height: 30px;
		margin-left: 10px;
		margin-bottom: 5px;
	}
	
	#reviewUl li{
		list-style: none;
	}
	
</style>

<div class="content">
	<div>상품 상세</div>
	상품명 : ${vo.name}<br>
	분류 : ${vo.type }<br>
	가격 : ${vo.price }<br>
	
	<form id="itemForm">
	<input type="hidden" name="name"value="${vo.name}">
	<input type="hidden" name="num"value="${vo.num}">
	<input type="hidden" name="price" value="${vo.price}">
	<select id=sizeSelect>
		<option value="null">사이즈 선택</option>
		<c:if test="${S.count>0}"><option value="S">사이즈 S </option></c:if>
		<c:if test="${M.count>0}"><option value="M">사이즈 M </option></c:if>
		<c:if test="${L.count>0}"><option value="L">사이즈 L </option></c:if>
		<c:if test="${XL.count>0}"><option value="XL">사이즈 XL </option></c:if>
	</select>
	<div id="itemList">
	
	</div>
	
	<div id="totalPriceDiv">
		총 금액 : 0
	</div>
	
	<input type="hidden" id="totPriceInput" name="totPrice" value="0">
	</form>
	
	<br>
	<button class="btn" onclick="onClickAddCart()" style="width: 100px">장바구니 담기</button>
	<button class="btn" onclick="onClickPay()">구매</button>
	
	<c:if test="${status==4}">
		<form method="get">
			<input type="hidden" name="num" value="${vo.num}">
			<input class="btn" type="submit" formaction="/itemboard/update" value="수정">
			<input class="btn" type="submit" formaction="/itemboard/delete" value="삭제">
		</form>
	</c:if>
	<br>
	상품설명
	<div id="itemContent">
		${vo.detail }
	</div>
	
	
	리뷰 수 : ${vo.review}<br>
	평점 : ${vo.avgrate }<br>
	<ul id ="reviewUl">
	</ul>
	<c:if test="${vo.review>0 }">
		<button class="btn"  id="btnshowReview" style="width: 100px">리뷰 더보기</button>
	</c:if>
</div>


<script type="text/javascript">
const amount = 5;

var reviewUl = document.getElementById("reviewUl");
var totalPriceDiv = document.getElementById("totalPriceDiv");
var totPriceInput = document.getElementById("totPriceInput");
var select = document.getElementById("sizeSelect");
var itemList = document.getElementById("itemList");
var btnshowReview = document.getElementById("btnshowReview");

var sizeMap = new Map();
var selectedItemMap = new Map();
var inum = <c:out value="${vo.num}" />;
var reviewCnt =  <c:out value="${vo.review}" />;
var reviewPage = 1;

sizeMap.set("S",<c:out value="${S.snum}"/>);
sizeMap.set("M",<c:out value="${M.snum}"/>);
sizeMap.set("L",<c:out value="${L.snum}"/>);
sizeMap.set("XL",<c:out value="${XL.snum}"/>);

window.onload = function(){
	select.addEventListener("change",function(e){
		let size = e.target.value;
		
		if(size=='null'){
			return;
		}
		
		if(selectedItemMap.has(size)){
			alert("이미 선택된 옵션입니다");
			return;
		}
		
		var itemDiv = document.createElement("div");
		itemDiv.setAttribute("id","selectedItem");
		
		itemDiv.innerHTML += "사이즈 : "+size+" ";
		
		
		let input1 = document.createElement("input");
		input1.setAttribute("name",size);
		input1.setAttribute("type", "number");
		input1.setAttribute("value", 1);
		//input1.setAttribute("max", sizeMap.get(size)[0]);
		input1.setAttribute("max", 10);
		
		input1.setAttribute("min", 1);
		
		input1.addEventListener("input", sumPrice, false)
		
		itemDiv.appendChild(input1);
		 
		let input2 = document.createElement("input");
		input2.setAttribute("name",size);
		input2.setAttribute("type", "hidden");
		input2.setAttribute("value",sizeMap.get(size));
		
		itemDiv.appendChild(input2);
		
		
		let btn = document.createElement("button");
		
		btn.innerText = "삭제";

		btn.addEventListener("click", function(e) {
			e.preventDefault();
			itemList.removeChild(itemDiv);
			selectedItemMap.delete(size);
			sumPrice();
		}, false);
		
		btn.className = "btn";
		
		itemDiv.appendChild(btn);
		
		selectedItemMap.set(size,itemDiv);
		
		itemList.appendChild(itemDiv);
		
		 sumPrice();
		
	},false);
	
	readReview(reviewPage++);
	
	btnshowReview.addEventListener("click", function(e) {
		readReview(reviewPage++);
		var cnt = reviewPage*amount;
		if(cnt >= reviewCnt){
			btnshowReview.style.display = 'none';
		}
	}, false)
	
}//onload
	
	function readReview(page){
		$.ajax({
			data : {"inum":inum,"pageNum":page,"amount":amount},
			type : "GET",
			url : "/review/load",
			success : function(data) {
				var json = JSON.parse(data);
				
				for(obj of json){
					var li = document.createElement("li");
					li.innerHTML = obj.id +" "+obj.rate +" "+obj.content;
					
					<c:if test="${status == 4}">
						let btn = document.createElement("button");
						let rnum = obj.rnum;
						btn.innerHTML="삭제";
						
						btn.addEventListener("click",function(e){
							removeReview(li,rnum);
						},false);
						
						li.appendChild(btn);
					</c:if>
					
					reviewUl.appendChild(li);
				}
			},
			failure:function(){
				console.log("error");
			}
			
		});
	}
	
	function removeReview(li,num){
		$.ajax({
			data : {'rnum':num},
			type : 'get',
			url : "/review/delete",
			success : function(data) {
				reviewUl.removeChild(li);
				//readReview();
			}
		});
	}
	
	function onClickAddCart(){
		if(selectedItemMap.size<1){
			alert('옵션을 선택하세요');	
			return;
		}
		
		var itemForm = $("#itemForm");

		$.ajax({
			data : itemForm.serialize(),
			type : "POST",
			url : "/itemboard/addcart",
			success : function(data) {
				var json = JSON.parse(data);
				if(json.code =='ok')
					alert("장바구니에 추가됨");
			}
		});
	}
	
	function onClickPay(){
		if(selectedItemMap.size<1){
			alert('옵션을 선택하세요');	
			return;
		}
		
		var itemForm = $("#itemForm");

		itemForm.attr("action", "/itemboard/buy");
		itemForm.submit();
	}

	function sumPrice(e){
		let cntIntputs =document.querySelectorAll("input[type='number']");
		let tot = 0;
		for(ci of cntIntputs){
			tot+=parseInt(ci.value)*<c:out value='${vo.price}'/>;
		}
		totalPriceDiv.innerText="총 금액 : "+tot;
		totPriceInput.value = tot;
	}
</script>

<%@include file="../include/footer.jsp" %><!-- </body> -->