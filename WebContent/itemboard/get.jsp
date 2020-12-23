<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@include file="../include/header.jsp" %><!-- <body> -->
<script src="http://code.jquery.com/jquery-latest.js"></script>

<style>
  #itemContent{
 	border: 1px solid;
  }
</style>

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
	<c:if test="${S.count>0}"><option value="S">사이즈 S 수량 :${S.count}</option></c:if>
	<c:if test="${M.count>0}"><option value="M">사이즈 M 수량 :${M.count}</option></c:if>
	<c:if test="${L.count>0}"><option value="L">사이즈 L 수량 :${L.count}</option></c:if>
	<c:if test="${XL.count>0}"><option value="XL">사이즈 XL 수량 :${XL.count}</option></c:if>
</select>
<div id="itemList">

</div>
<div id="totalPriceDiv">
	총 금액 : 0
</div>

<input type="hidden" id="totPriceInput" name="totPrice" value="0">
</form>

<br>
<button onclick="onClickAddCart()">장바구니 담기</button>
<button onclick="onClickPay()">결제</button>

<c:if test="${status==4}">
	<form method="get">
		<input type="hidden" name="num" value="${vo.num}">
		<input type="submit" formaction="/itemboard/update" value="수정">
		<input type="submit" formaction="/itemboard/delete" value="삭제">
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
	<button id="btnshowReview" onclick="showMoreReview()">리뷰 더보기</button>
</c:if>

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

sizeMap.set("S",[<c:out value="${S.count}"/>,<c:out value="${S.snum}"/>]);
sizeMap.set("M",[<c:out value="${M.count}"/>,<c:out value="${M.snum}"/>]);
sizeMap.set("L",[<c:out value="${L.count}"/>,<c:out value="${L.snum}"/>]);
sizeMap.set("XL",[<c:out value="${XL.count}"/>,<c:out value="${XL.snum}"/>]);

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
		
		//인풋필드에 사이즈를 name으로 사용 0번 첨자는 개수 1번 첨자는 재고번호
		
		let input1 = document.createElement("input");
		input1.setAttribute("name",size);
		input1.setAttribute("type", "number");
		input1.setAttribute("value", 1);
		input1.setAttribute("max", sizeMap.get(size)[0]);
		input1.setAttribute("min", 1);
		
		input1.addEventListener("input", sumPrice, false)
		
		itemDiv.appendChild(input1);
		 
		let input2 = document.createElement("input");
		input2.setAttribute("name",size);
		input2.setAttribute("type", "hidden");
		input2.setAttribute("value",sizeMap.get(size)[1]);
		
		itemDiv.appendChild(input2);
		
		var btn = document.createElement("button");
		
		btn.innerText = "삭제";
		
		btn.addEventListener("click", function(e) {
			e.preventDefault();
			itemList.removeChild(itemDiv);
			selectedItemMap.delete(size);
			sumPrice();
		}, false);
		
		itemDiv.appendChild(btn);
		
		selectedItemMap.set(size,itemDiv);
		
		itemList.appendChild(itemDiv);
		
		 sumPrice();
		
	},false);
	
	readReview(reviewPage++);
	
	btnshowReview.addEventListener("click", function(e) {
		var cnt = reviewPage*amount;
		
		if(cnt >= reviewCnt){
			btnshowReview.style.display = 'none';
		}
		readReview(reviewPage++);
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
		console.log(selectedItemMap.size);
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
		return;
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