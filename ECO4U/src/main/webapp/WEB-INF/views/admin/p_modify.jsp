<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- include libraries(jquery,bootstrap) -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.ck-editor__editable_inline{
	min-height:250px;
}
</style>
<!-- include ckeditor js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ckeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploadAdapter.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/product.control.js"></script>

<!-- css 삽입 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">

<!-- 내용 시작 -->
<div class="sub_menu"><jsp:include page="/WEB-INF/views/admin/sub_menu.jsp"/></div>

<div class="page-main">
	<h2>상품 수정</h2>
	<form:form action="admin_pmodify.do" enctype="multipart/form-data" id="pmodify_form" modelAttribute="productVO">
	<form:hidden path="p_num"/>
	<ul>
		<li>
			<label>상품 표시 여부</label>
			<form:radiobutton path="p_status" value="1" id="status1"/>미표시
			<form:radiobutton path="p_status" value="2" id="status2" checked="checked"/>표시
		</li>
		
		<li>
			<label>카테고리</label>
			<form:select path="p_category">
				<option value="1">Living</option>
				<option value="2">Beauty</option>
				<option value="3">Fashion</option>
			</form:select>
		</li>
		
		<li>
			<label for="p_name">상품명</label>
			<form:input path="p_name"/>
			<form:errors path="p_name" cssClass="error-color"/>
		</li>
		
		<li>
			<label for="p_price">가격</label>
			<form:input path="p_price"/>
			<form:errors path="p_price" cssClass="error-color"/>
		</li>
		
		<li>
			<label for="p_dprice">배송비</label>
			<form:input path="p_dprice"/>
			<form:errors path="p_dprice" cssClass="error-color"/>
		</li>
		
		<li>
			<label for="p_quantity">수량</label>
			<form:input path="p_quantity"/>
			<form:errors path="p_quantity" cssClass="error-color"/>
		</li>
		
		<li>
			<label for="p_brand">브랜드</label>
			<form:input path="p_brand"/>
			<form:errors path="p_brand" cssClass="error-color"/>
		</li>
		
		<li>
			<label for="upload">상품사진</label>
			<input type="file" name="upload" id="upload" accept="image/gif,image/png,image/jpeg">
			<form:errors path="upload" cssClass="error-color"/>
			<br>
			<img src="imageView.do?p_num=${productVO.p_num}" width="70" height="70" id="p_photo" class="p_photo">
		</li>
		
		<li>
			<label for="p_cont1">제품특징</label>
			<form:textarea path="p_cont1"/>
			<form:errors path="p_cont1" cssClass="error-color"/>
		</li>
		
		<li>제품상세</li>
		<li>
			<form:textarea path="p_cont2"/>
			<form:errors path="p_cont2" cssClass="error-color"/>
			<script>
				 function MyCustomUploadAdapterPlugin(editor) {
					    editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
					        return new UploadAdapter(loader);
					    }
					}
				 
				 ClassicEditor.create( document.querySelector('#p_cont2' ),{
			           	extraPlugins: [MyCustomUploadAdapterPlugin]
			           }).then( editor => {
						window.editor = editor;
					} ).catch( error => {
			               console.error( error );
			           });
			 </script>               
			</li>
	</ul>
	<div class="align-center">
		<form:button>저장</form:button>
		<input type="button" value="목록" onclick="location.href='admin_plist.do'">
	</div>
	</form:form>
</div>

<!-- 내용 끝 -->