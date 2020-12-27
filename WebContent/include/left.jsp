<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

    <link rel="stylesheet" type="text/css" href="../../assert/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../../assert/demo.css">

    <script type="text/javascript" src="../../assert/jquery.min.js"></script>
    <script type="text/javascript" src="../../assert/jquery.easyui.min.js"></script>

	<link rel="stylesheet" type="text/css" href="../../assert/demo/sidemenu/sidemenu_style.css">

<style type="text/css">
#headmenu2 {
	height: 58px;
}
.accordion {
	border-color: black;
}
</style>
<div style=" width: 188px; float: left;" id="sm" class="easyui-sidemenu" data-options="data:data">
	<ul>
		<%-- <li>Shopping Info</li>
		<li><a href="${pageContext.request.contextPath }/shoppinginfo/orderlist">주문내역</a></li>
		<li><a href="${pageContext.request.contextPath }/shoppinginfo/couponlist">보유 쿠폰 조회</a></li>
		<li><a href="${pageContext.request.contextPath }/shoppinginfo/reviewlist">후기리스트</a></li>
		<li>My Info</li>
		<li><a href="${pageContext.request.contextPath }/member/update">회원정보 관리</a></li>
		<li><a href="${pageContext.request.contextPath }/member/deletepage.jsp">회원 탈퇴</a></li> --%>
	</ul>
</div>

<script type="text/javascript">
function menuLoad(t) {
	location.href = $(t).attr("data-url");
}

	var data = [ {
		text : '쇼핑 정보',
		iconCls : '',
		state : 'open',
		children : [ {
			text : '<strong onclick="menuLoad(this)" data-url="/shoppinginfo/orderlist">주문 내역</strong>'
		}, {
			text : '<strong onclick="menuLoad(this)" data-url="/shoppinginfo/couponlist">보유 쿠폰 조회</strong>'
		}, {
			text : '<strong onclick="menuLoad(this)" data-url="/shoppinginfo/reviewlist">리뷰 리스트</strong>'
		} ]
	}, {
		text : '내 정보',
		iconCls : '',
		children : [ {
			text : '<strong onclick="menuLoad(this)" data-url="/member/update">회원 정보 관리</strong>'
		}, {
			text : '<strong onclick="menuLoad(this)" data-url="/member/deletepage.jsp">회원 탈퇴</strong>'
		} ]
	}];

	function toggle() {
		var opts = $('#sm').sidemenu('options');
		$('#sm').sidemenu(opts.collapsed ? 'expand' : 'collapse');
		opts = $('#sm').sidemenu('options');
		$('#sm').sidemenu('resize', {
			width : opts.collapsed ? 60 : 200
		})
	}
</script>