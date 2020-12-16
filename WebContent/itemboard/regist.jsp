<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@include file="../include/header.jsp" %><!-- <body> -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="../js/summernote/summernote-lite.js"></script>
<script src="../js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="../css/summernote/summernote-lite.css">



<form method="post" action="/itemboard/regist"  id="regForm">

  <label for="name">상품명 : </label> 
  <input name="name" type="text" width="30"><br>
  <label for="price">가격 : </label> 
  <input name="price" type="number" min="1000" width="30" ><br>
  <fieldset>
  	<legend>성별</legend>
		<input type="radio" name="gender" value="0" readonly="readonly" <c:if test="${param.gender eq 0}">checked="checked"</c:if> >남
		<input type="radio" name="gender" value="1" readonly="readonly" <c:if test="${param.gender eq 1}">checked="checked"</c:if>>여<br>
  </fieldset>
  
  <fieldset>
  	<legend>상품 분류</legend>
		<input type="radio" name="type" value="상의">상의
		<input type="radio" name="type" value="하의">하의
		<input type="radio" name="type" value="아우터">아우터<br>
  </fieldset>
  
 <fieldset>
  	<legend>사이즈 별 재고</legend>
  	 	<label>S</label>
  	 	<input type="number" name="sizeS"  min="0" value="0"><br>
  	 	<label>M</label>
  	 	<input type="number" name="sizeM" min="0" value="0"><br>
  	 	<label>L</label>
  	 	<input type="number" name="sizeL" min="0" value="0"><br>
  	 	<label>XL</label>
  	 	<input type="number" name="sizeXL" min="0" value="0"><br>
  </fieldset>
  
  <label>내용</label><br>
  <textarea id="summernote" name="editordata"></textarea>
  <input type="button" value="등록"  onclick="onClickSubmit()">
  <input type="button"  value="리셋 " onclick="onClickReset()">
  

</form>

<script type="text/javascript">

var arr = new Array();
	$(document).ready(function() {
		//여기 아래 부분
		$('#summernote').summernote({
			  height: 300,  
			  width: 800,// 에디터 높이
			  minHeight: null,             // 최소 높이
			  maxHeight: null,             // 최대 높이
			  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			  lang: "ko-KR",					// 한글 설정
			  placeholder: '최대 2048자까지 쓸 수 있습니다',
			  callbacks:{
				  onImageUpload: function(files){
					  uploadSummernoteImageFile(files[0],this);
				  }
			  }//placeholder 설정
	          
		});
	});
	
	function onClickReset(){
		$('#summernote').summernote('reset');
	}
	
	function onClickSubmit() {
		var form = $('#regForm');
		
		for(str of arr){
			form.append(str);
		}
		
		form.submit();
	}
	
	function uploadSummernoteImageFile(file, editor){
		var data = new FormData();
		data.append("file",file);
		$.ajax({
			data : data,
			type : "POST",
			url : "/itemboard/upload",
			contentType : false,
			processData : false,
			success : function(data) {
				data = JSON.parse(data);
				$(editor).summernote('insertImage', data.url);
				arr.push( "<input type='hidden' value='"+data.url+"' name='img'>");
			}
		});
	}

</script>

<%@include file="../include/footer.jsp" %>