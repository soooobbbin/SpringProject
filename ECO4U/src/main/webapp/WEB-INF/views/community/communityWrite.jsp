<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- include libraries(jquery,bootstrap) -->
<!-- 
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/community.css">
<style>
.ck-editor__editable_inline {
	min-height: 250px;
}

   
table{
	width:900px;
}
</style>
<!-- include ckeditor js -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/ckeditor.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/uploadAdapter.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/community.js"></script>



<div class="page-main-co">
	<div class="align-center">
		<h2 onclick="location.href='list.do?c_category=1'">Community</h2>
	</div>
	
	
	<div class="co-content-detail">
		
			<div class="cate-detail">
				<b> 글쓰기 </b>
			</div>
		
		
		
	<form:form action="write.do" modelAttribute="communityVO"
		id="register_form" enctype="multipart/form-data">
		<form:errors element="div" cssClass="error-color" />
		
		
		<table>
		
			<tr>
			<c:if test="${user.auth == 2}">
					<td><b>공지</b></td>
					<td><form:hidden path="c_auth" value='0' id="c_auth_hidden" /><form:checkbox path="c_auth" name="c_auth" value='1' id="c_auth" /> 공지로 지정합니다.</td>
		</c:if></tr>

			<tr>
			<td><b>카테고리</b></td> 
			<td><select
				name="c_category" id="c_category" class="write-cate">
					<option value="1" <c:if test="${c_category == 1}">selected</c:if>>TIP</option>
					<option value="2" <c:if test="${c_category == 2}">selected</c:if>>함께해요</option>
					<c:if test="${user.auth == 2}">
						<option value="3" <c:if test="${c_category == 3}">selected</c:if>>친환경
							소식</option>
					</c:if>
			</select></td>
			
			</tr>
				<tr>
			<td><b>제목</b></td> 
			<td><form:input path="c_title" id="c_title" /> </td>
			<td><form:errors path="c_title"
					cssClass="error-color" /><br>
			<br></td></tr>
			<tr>
			<td><b>내용</b></td>
			<td><form:textarea path="c_content" /> <form:errors
					path="c_content" cssClass="error-color" /> <script>
					 function MyCustomUploadAdapterPlugin(editor) {
						    editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
						        return new UploadAdapter(loader);
						    }
						}
					 
					 ClassicEditor
			            .create( document.querySelector( '#c_content' ),{
			            	extraPlugins: [MyCustomUploadAdapterPlugin]
			            })
			            .then( editor => {
							window.editor = editor;
						} )
			            .catch( error => {
			                console.error( error );
			            } );
				 </script> <%-- 목록 이미지 등록 --%>
				 
				 </td></tr>
				 <tr>
						<td rowspan="2"><b>썸네일 이미지 등록</b></td>
						<td><c:if test="${empty community.filename}">
								<img
									src="${pageContext.request.contextPath}/images/no_image.png"
									width="100" height="70" class="com-photo" id="upload-btn">
							</c:if> <c:if test="${!empty community.filename}">
								<img
									src="${pageContext.request.contextPath}/image_upload/${community.uploadfile}"
									width="100" height="70" class="com-photo" id="upload-btn">
							</c:if>
									<input type="file" name="upload" id="upload" class="upload-btn">
									<input type="button" value="취소" id="photo_reset"></td>
				</tr>
					 				
					
					
				
		</table>
		<hr size="1" width="100%">
		<div class="align-center">
		<br>
			<form:button id="submit-btn">등록</form:button>
		</div>
	</form:form>
</div>
</div>


<!-- 내용 끝 -->