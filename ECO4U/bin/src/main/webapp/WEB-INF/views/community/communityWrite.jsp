<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 
<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- 네이버 스마트 에디터 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/smarteditor/js/HuskyEZCreator.js"  charset="utf-8"></script>
<script type="text/javascript">
 var oEditors = []; // 개발되어 있는 소스에 맞추느라, 전역변수로 사용하엿지만, 지역변수로 사용해도 전혀 무관 함.
  $(function() {

   // Editor Setting
   nhn.husky.EZCreator.createInIFrame({
      oAppRef : oEditors, // 전역변수 명과 동일해야 함.
      elPlaceHolder : "c_content", // 에디터가 그려질 textarea ID 값과 동일 해야 함.
      sSkinURI : "${pageContext.request.contextPath}/smarteditor/SmartEditor2Skin.html", // Editor HTML
      
      fCreator : "createSEditor2" // SE2BasicCreator.js 메소드명이니 변경 금지 X
     });

});

</script>
<!-- 에디터 script 끝 -->


<div class="page-main">
<div class="align-center">
	<h2 onclick="location.href='list.do'">Community</h2> </div>
	<form:form action="write.do" modelAttribute="communityVO"
	        id="register_form"
	        enctype="multipart/form-data">
	    <form:errors element="div" cssClass="error-color"/>    
		<ul>
			<li><label for="c_category">카테고리</label>
			<select name="c_category" id="c_category">
					<option value="1"<c:if test="${c_category == 1}">selected</c:if>>TIP</option>
					<option value="2"<c:if test="${c_category == 2}">selected</c:if>>함께해요</option>
					<option value="3"<c:if test="${c_category == 3}">selected</c:if>>친환경 소식</option>
				</select><br><br>
			</li>
			
			<li><label for="c_title">제목</label>
				<form:input path="c_title"/>
				<form:errors path="c_title" 
				             cssClass="error-color"/><br><br>
			</li>
			<li><label for="c_content">내용</label>
				  <textarea id="c_content" name="c_content" style="width:100%;"></textarea> 
			
				        
				<br><br>
				    
			<li>
				<label for="upload">파일 업로드</label>
				<input type="file" name="upload" id="upload">
			</li>
		</ul>    
		<div class="align-center">
			<form:button>등록</form:button>
		</div>    
	</form:form>

	
</div>
<!-- 내용 끝 -->