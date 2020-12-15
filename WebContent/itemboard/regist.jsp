<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@include file="../include/header.jsp" %><!-- <body> -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="../js/summernote/summernote-lite.js"></script>
<script src="../js/summernote/lang/summernote-ko-KR.js"></script>

<link rel="stylesheet" href="../css/summernote/summernote-lite.css">

<form method="post" action="/itemboard/regist" >
  <label for="name">상품명 : </label> 
  <input name="name" type="text" width="30"><br>
  <label for="price">가격 : </label> 
  <input name="price" type="number" min="1000" width="30" ><br>
  
  <textarea id="summernote" name="editordata"></textarea>
  <input type="submit" value="등록">
  <input type="button" value="리셋 " onclick="onClickReset()">
</form>

<script type="text/javascript">
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
			}
		});
	}

</script>

<%@include file="../include/footer.jsp" %>