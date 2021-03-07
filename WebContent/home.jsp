<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="include/header.jsp" %><!-- <body> -->
<div id="wrapper" style="width:100%; height:1100px; background-color: black;">
	<div style="width:1410px; top:150px; margin:auto; position:relative;">
		<div class="slide">
			<div><img src="${cp}/images/nike_home_1.PNG"></div>
			<div><img src="${cp}/images/nike_home_2.png"></div>
			<div><img src="${cp}/images/nike_home_3.png"></div>
			<div><img src="${cp}/images/nike_home_4.png"></div>
			<div><img src="${cp}/images/nike_home_5.png"></div>
			<div><img src="${cp}/images/nike_home_6.png"></div> 
		</div>
	</div>
	<script type="text/javascript">
		$('.slide').slick({
		    infinite: true, //양방향 무한 모션
		    speed:500, // 슬라이드 스피드
		    autoplay: true, //자동플레이 유무( false시 자동플레이 안됨 )
		    autoplaySpeed:2500, // 자동플레이 스피드
		    slidesToShow: 1, //한 화면에 보여줄 아이템수
		    slidesToScroll: 1, // 한번에 슬라이드 시킬 아이템 개수
		    arrows: false, //좌우 화살 버튼 노출 여부 ( false 시 안보임 )
		    draggable: false
		  });
	</script>
</div>
<%@include file="include/footer.jsp" %><!-- </body> -->