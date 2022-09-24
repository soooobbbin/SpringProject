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
<jsp:include page="/WEB-INF/views/admin/sub_menu.jsp">
	<jsp:param name="mem_name" value="${admin.mem_name}"/>
</jsp:include>

<div class="main-content">
	<br>
	<form:form action="admin_write.do" enctype="multipart/form-data" id="pwrite_form" modelAttribute="productVO">
		<div class="action-btn-3">
			<form:button>등록</form:button>
			<input type="button" value="목록" onclick="location.href='admin_plist.do'">
		</div>

		<div class="product">
			<div class="product-image">
				<c:if test="${empty product.p_photoname}">
					<img src="${pageContext.request.contextPath}/images/no_image.png" class="p_photo">
				</c:if>
				<c:if test="${!empty product.p_photoname}">
					<img src="imageView.do?p_num=${productVO.p_num}" class="p_photo">
				</c:if>
				<input type="file" name="upload" id="upload" accept="image/gif,image/png,image/jpeg">			
				<form:errors path="upload" cssClass="error-color"/>
			</div>
			
			<div class="product-detail">
				<table>
					<tr>
						<th>상품명</th>
						<td colspan="3">
							<form:input path="p_name" /><br>
							<form:errors path="p_name" cssClass="error-color" />
						</td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td>
							<form:select path="p_category">
								<option value="1">Living</option>
								<option value="2">Beauty</option>
								<option value="3">Fashion</option>
							</form:select>
						</td>
						<th>브랜드</th>
						<td>
							<form:input path="p_brand"/><br>
							<form:errors path="p_brand" cssClass="error-color"/>
						</td>
					</tr>
					<tr>
						<th>상태</th>
						<td>
						<form:radiobutton path="p_status" value="1" id="status1" /><label for="status1">미표시</label>
						<form:radiobutton path="p_status" value="2" id="status2" checked="checked" /><label for="status2">표시</label>
						</td>
						
						<th>재고</th>
						<td>
							<form:input path="p_quantity"/><br>
							<form:errors path="p_quantity" cssClass="error-color"/>
						</td>
					</tr>
					
					<tr>
						<th>가격</th>
						<td>
							<form:input path="p_price"/>
							<br><form:errors path="p_price" cssClass="error-color"/>
						</td>
						<th>배송비</th>
						<td>
							<form:input path="p_dprice"/>
							<br><form:errors path="p_dprice" cssClass="error-color"/>
						</td>
					</tr>
					
					<tr>
						<th colspan="4">상품특징</th>
					</tr>				
					<tr>
						<td colspan="4">
							<form:textarea path="p_cont1"/><br>
							<form:errors path="p_cont1" cssClass="error-color"/>
						</td>
					</tr>
					
					<tr>
						<th colspan="4">상품상세</th>
					</tr>				
					<tr>
						<td colspan="4">
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
							               console.error( error ); });
							 </script>               
						</td>
					</tr>
				</table>
			</div>
		</div>
	</form:form>
	
</div>
<!-- 내용 끝 -->