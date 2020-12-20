<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@include file="../include/header.jsp" %><!-- <body> -->
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<style>
	.imgs{
		width: 200px;
		height: 150px;
	}
	.imgs img{
		width: 100%;
		height: 100%;
	}
	
</style>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>


<div style="background-color: gray">
<c:choose>
	<c:when test="${param.gender eq 0 }">남성의류 목록</c:when>
	<c:otherwise>여성의류목록</c:otherwise>
</c:choose><br>

<c:forEach items="${list}" var="item">
	<div>
		<div class="imgs">
			<c:forEach items="${item.photoList }" var="img">
				<div>
					<img alt="" src="${img.filePath}">
				</div>
			</c:forEach>
		</div>
		<a href="/itemboard/get?num=${item.num}">${item.name}</a>
	</div>
	<br>
</c:forEach>


<c:if test="${true }">
	<form action="/itemboard/regist.jsp" method="get">
		<input type="hidden" value="${param.gender}" name="gender">
		<input type="submit" value="상품등록">
	</form>
</c:if>


</div>

<script>
$(document).ready(function(){
	$('.imgs').slick({
		  infinite: true, //양방향 무한 모션
		  speed:300, // 슬라이드 스피드
		  autoplay: true, //자동플레이 유무( false시 자동플레이 안됨 )
		  autoplaySpeed:3000, // 자동플레이 스피드
		  slidesToShow: 1, //한 화면에 보여줄 아이템수
		  slidesToScroll: 1, // 한번에 슬라이드 시킬 아이템 개수
		  arrows: false, //좌우 화살 버튼 노출 여부 ( false 시 안보임 )
		});
});

</script>

<%@include file="../include/footer.jsp" %><!-- </body> -->