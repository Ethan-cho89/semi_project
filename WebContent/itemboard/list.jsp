<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@include file="../include/header.jsp" %><!-- <body> -->
<!-- <link rel="stylesheet" type="text/css" href="../js/slick/slick.css"/> -->

<style>
	.slick-track:before,
	.slick-track:after
	{
		display: block;
	    content: '';
	}
	
	table{
		border-spacing: 50px 10px;
	}
	
	td {
		padding:0;
		border: 1px solid black;
	}

	.imgs img{
		width: 100%;
		height: 300px;
		top: 0px;
	}
	
	.item{
		width: 350px;
		height: 430px;
	}
	
	.adminForm{
		position: absolute;
		left:10%; 
		transform:translateX(-50%);
		bottom:50px;
	}
	
	.adminForm input[type='submit']{
		background-color: black;
		color: white;
		width: 100px;
		height: 30px;
	}
	
	li{
		list-style-type: none;
	}
	
	.pagebuttons{
		position: absolute;
		left:50%; 
		transform:translateX(-50%) ;
		bottom:50px;
	}
	
	.pageBtn_prev{
		width:50px;
		font: bold;
	}
	
	.pageBtn_next{
		font: bold;
		width:50px;
	}
	
	.pagebuttons li{
		display: inline-block;
		border: 1px solid black;
		margin-left: 2px;
		text-align: center;
	}
	
	.page{
		width:20px;
		background-color: white;
	}
	
	.page_cur{
		width:20px;
		background-color: black;
	}
	
	.pagebuttons a{
		text-decoration:none;
		color:black;
	}
	
	.page_cur a{
		text-decoration:none;
		color: white;
		pointer-events: none;
	}
	
	.content{
		padding-top:82px;
		position:relative;
		height:1500px;
	}
	
	.side{
		width:250px;
		height:1500px;
		background-color: #F6F6F6; 
		z-index : 0;
		float: left;
		position: absolute;
		padding-top: 50px;
		padding-left: 50px;
		font-size: 20px;
	}
	
	.list{
		height:1500px;
		left:251px;
		position: absolute;
	}
	
	.sideFilter a{
		text-decoration: none;
		color : black;
	}
	
	
</style>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<div class="content">
	<div class="side">
		<c:choose>
			<c:when test="${not empty param.keyword and param.keyword!=''}">${param.keyword } ?????? ??????</c:when>
			<c:when test="${param.gender eq 0 }">???????????? ??????</c:when>
			<c:when test="${param.gender eq 1 }">???????????? ??????</c:when>
		</c:choose>
		<br>	
		<br>
		<b>?????? ??????</b>
		<br>
		<br>
		<form action="/itemboard/list" method="get" id="sideForm">
			<input type="hidden" name="keyword" value="${param.keyword}">
			<input type="hidden" name="gender" value="${param.gender}">
			<input type="hidden" name="type" value="${param.type}">
			
			<ul class="sideFilter">
				<li><b>??????</b></li>
				<li><a href="??????" ${param.type=='??????'?"style='font-weight: bolder;'":''} >??????</a></li>
				<li><a href="??????"  ${param.type=='??????'?"style='font-weight: bolder;'":''}>??????</a></li>
				<li><a href="?????????"  ${param.type=='?????????'?"style='font-weight: bolder;'":''}>?????????</a></li>
				<br>
				<br>
				<br>
				<br>
				<br>
				<li><b>?????????</b></li>
				<li><input type="checkbox" name="size" value="S" ${fn:contains(pageMaker.cri.size,'S')?"checked='checked'" :""} >S</li>
				<li><input type="checkbox" name="size" value="M" ${fn:contains(pageMaker.cri.size,'M')?"checked='checked'" :""}>M</li>
				<li><input type="checkbox" name="size" value="L" ${fn:contains(pageMaker.cri.size,'L')?"checked='checked'" :""}>L</li>
				<li><input type="checkbox" name="size" value="XL" ${fn:contains(pageMaker.cri.size,'X')?"checked='checked'" :""}>XL</li>
			</ul>
		</form>
	</div>
	<div class="list">
		<table>
		<tr>
			<c:forEach items="${list}" var="item" varStatus="idx">
				<td>
					<div class="item">
						<div class="imgs">
							<c:if test="${fn:length(item.photoList)<1 }">
								<div>
									<img alt="" src="/upload/nonImg.png">
								</div>
							</c:if>
							<c:forEach items="${item.photoList }" var="img">
								<div>
									<img alt="" src="${img.filePath}">
								</div>
							</c:forEach>
						</div>
						<div class="itemText">
							<a href="/itemboard/get?num=${item.num}">${item.name}</a>
							<p>${item.type }</p>
							<p>${item.price } ???</p>
						</div>
					</div>
				</td>
				<c:if test="${(idx.index+1)%4==0}">
					<tr>
					</tr>
				</c:if>
			</c:forEach>
		</tr>
		</table>
		
		<form id="actionForm" action="/itemboard/list" method='get'>
			<input type="hidden" value="${param.gender}" name="gender">
			<input type='hidden' name='pageNum' value= '<c:out value="${empty pageMaker.cri.pageNum ?1:pageMaker.cri.pageNum}"/>' /> 
			<input type='hidden' name='amount' value='<c:out value="${empty pageMaker.cri.amount?12:pageMaker.cri.amount}"/>'/>
			<input type='hidden' name='keyword' value='<c:out value="${empty pageMaker.cri.keyword?'':pageMaker.cri.keyword}"/>'/>
			<input type='hidden' name='type' value='<c:out value="${empty pageMaker.cri.type?'':pageMaker.cri.type}"/>'/>
			<input type='hidden' name='gender' value='<c:out value="${empty pageMaker.cri.gender?'':pageMaker.cri.gender}"/>'/>
			<c:forTokens var="item" items="${ pageMaker.cri.size}" delims=" ">
				<input type='hidden' name='size' value='${item}'/>
			</c:forTokens>
		</form>
		
	<c:if test="${true }">
		<form action="/itemboard/regist.jsp" method="get" class="adminForm">
			<input type="hidden" value="${param.gender}" name="gender">
			<input type="submit" value="????????????">
		</form>
	</c:if>
	
	<ul class="pagebuttons">
		<c:if test="${pageMaker.prev}">
			<li class="pageBtn_prev">
				<a href="${pageMaker.start-1}">??????</a>
			</li>
		</c:if>
	
		<c:forEach begin="${pageMaker.start}" end="${pageMaker.end}" var="num">
			<li class="page${num==pageMaker.cri.pageNum ?'_cur':''}">
				<a href="${num}">${num}</a>
			</li>
		</c:forEach>
		
		<c:if test="${pageMaker.next}">
			<li class="pageBtn_next">
				<a href="${pageMaker.end+1}">??????</a>
			</li>
		</c:if>
	</ul>
		
	</div> <!--end list  -->
</div><!--end content  -->

<script>

var actionForm=$("#actionForm");
var sideFilter=$(".sideFilter");
var sf= $("#sideForm");

$(document).ready(function(){
	$('.imgs').slick({
		  infinite: true, //????????? ?????? ??????
		  speed:300, // ???????????? ?????????
		  autoplay: true, //??????????????? ??????( false??? ??????????????? ?????? )
		  autoplaySpeed:2000, // ??????????????? ?????????
		  slidesToShow: 1, //??? ????????? ????????? ????????????
		  slidesToScroll: 1, // ????????? ???????????? ?????? ????????? ??????
		  arrows: false, //?????? ?????? ?????? ?????? ?????? ( false ??? ????????? )
		  draggable : false,
		  adaptiveHeight: false
		});
	
	$('.item').on("click",function(e){
		e.preventDefault();
		self.location = $(this).find("a").attr("href");
	});
	
	$(".pagebuttons a").on("click",function(e){
		e.preventDefault();
		let num = $(this).attr("href");
		actionForm.find("input[name='pageNum']").val(num);
		actionForm.submit();
	});
	
	$(".sideFilter a").on("click",function(e){
		e.preventDefault();
		sf.empty();
		<c:if test="${not empty param.gender}" >
			sf.append("<input type='hidden' name='gender' value='"+<c:out value='${param.gender}'/>+"''>")
		</c:if>
		sf.append("<input type='hidden' name='type' value='"+$(this).attr("href")+"''>")
		sf.submit();
	});
	
	$(".sideFilter input[type=checkbox]").on("change",function(e){
		let isChecked =e.target.checked;
		let size = e.target.value;
		/*if(isChecked){
			//actionForm.append("<input type='hidden' id='"+size+"' name='size' value='"+size+"'>");
			//actionForm.submit();
		
		}else{
			//$("#"+size).remove();
		}*/
		sf.submit();
	});
	
});//ready

</script>

<%@include file="../include/footer.jsp" %><!-- </body> -->