<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@include file="../include/header.jsp" %><!-- <body> -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="../js/summernote/summernote-lite.js"></script>
<script src="../js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="../css/summernote/summernote-lite.css">



<form method="post" action="/itemboard/update"  id="regForm">
  <input type="hidden" value="${vo.num}" name="num">
  <label for="name">상품명 : </label> 
  <input name="name" type="text" width="30" value="${vo.name}"><br>
  <label for="price">가격 : </label> 
  <input name="price" type="number" min="1000" width="30" value="${vo.price }" ><br>
  <fieldset>
  	<legend>성별</legend>
		<input type="radio" name="gender" value="0" onclick="return false" <c:if test="${vo.gender eq 0}">checked="checked"</c:if> >남
		<input type="radio" name="gender" value="1" onclick="return false" <c:if test="${vo.gender eq 1}">checked="checked"</c:if>>여<br>
  </fieldset>
  
  <fieldset>
  	<legend>상품 분류</legend>
		<input type="radio" name="type" value="상의" onclick="return false" <c:if test="${vo.type eq '상의'}">checked="checked"</c:if>>상의
		<input type="radio" name="type" value="하의" onclick="return false" <c:if test="${vo.type eq '하의'}">checked="checked"</c:if>>하의
		<input type="radio" name="type" value="아우터" onclick="return false" <c:if test="${vo.type eq '아우터'}">checked="checked"</c:if>>아우터<br>
  </fieldset>
  
 <fieldset>
  	<legend>사이즈 별 재고</legend>
  	 	<label>S</label>
  	 	<input type="number" name="sizeS"  min="0" value="${S}"><br>
  	 	<label>M</label>
  	 	<input type="number" name="sizeM" min="0" value="${M}"><br>
  	 	<label>L</label>
  	 	<input type="number" name="sizeL" min="0" value="${L}"><br>
  	 	<label>XL</label>
  	 	<input type="number" name="sizeXL" min="0" value="${XL}"><br>
  </fieldset>
  
  <label>내용</label><br>
  <textarea id="summernote" name="editordata">
  	<c:out value='${vo.detail}'/>
  </textarea>
  <input type="button" value="수정"  onclick="onClickUpdate()">
  <input type="button"  value="리셋 " onclick="onClickReset()">
  

</form>

<script type="text/javascript">
//console.log(self.location.host+"/");
var imgArr = new Array();
<c:forEach items="${vo.photoList}" var="item" varStatus="idx" >
imgArr.push("${item.filePath }");
</c:forEach>
	$(document).ready(function() {
		//여기 아래 부분
		$('#summernote').summernote({
			 toolbar: [
				    ['fontname', ['fontname']],
				    ['fontsize', ['fontsize']],
				    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
				    ['color', ['forecolor','color']],
				    ['table', ['table']],
				    ['para', ['ul', 'ol', 'paragraph']],
				    ['height', ['height']],
				    ['insert',['picture','link']],
				    ['view', ['fullscreen', 'help']]
				  ],
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
				  },
				  onMediaDelete:function($target, editor){
					  var s = $target[0].src;
					  s = s.substring(s.indexOf('upload')-1,s.length);
					  for(i in imgArr){
						  if(imgArr[i].indexOf(s)){
							  imgArr.splice(i,1);
							  break;
						  }
					  }
				  }
			  }//placeholder 설정
	          
		});
		
	});
	
	function onClickReset(){
		$('#summernote').summernote('reset');
	}
	
	function onClickUpdate() {
		var form = $('#regForm');
		for(var url of imgArr){
			form.append("<input type='hidden' value='"+url+"' name='img'>");
		}
		form.submit();
	}
	
	function uploadSummernoteImageFile(file, editor){
		var data = new FormData();
		data.append("file",file);
		data.append("update",0);
		$.ajax({
			data : data,
			type : "POST",
			url : "/itemboard/upload",
			contentType : false,
			processData : false,
			success : function(data) {
				data = JSON.parse(data);
				$(editor).summernote('insertImage', data.url);
				//arr.push( "<input type='hidden' value='"+data.url+"' name='img'>");
				imgArr.push(data.url);
			}
		});
	}
	

</script>

<%@include file="../include/footer.jsp" %>