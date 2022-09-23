<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- include libraries(jquery,bootstrap) -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/review.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/product.review.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">


<!-- 내용시작 -->
<div class="review_write_main">
	<h2 style="font-weight:bold">리뷰 등록</h2>
	<hr class="review_write_hr" width="135px" align="left">
	
	<c:forEach var="review" items="${list}">
		<input type="hidden" value="${review.productVO.p_category}">
		<input type="hidden" value="${review.mem_num}">
		<input type="hidden" value="${review.r_num}">
		<input type="hidden" value="${review.p_num}">

		<div class="div1">
			<span class="box-brand">[${review.productVO.p_brand}]</span>
		</div>

		<hr color="gray" width="95%" size="1">
		<div class="div2">
			<div class="product-image">
				<a href="${pageContext.request.contextPath}/product/detail.do?p_num=${review.p_num}">
					<img src="../images/product/${review.productVO.p_photoname}" width="80" height="80">
				</a>
			</div>
			<div class="product-box">
				<a href="${pageContext.request.contextPath}/product/detail.do?p_num=${review.p_num}">
					<span class="box-title">${review.productVO.p_name}</span><br></a>
					<span class="box-price"><strong>${review.productVO.p_price}</strong></span>
			</div>
		</div>
	</c:forEach>
	
	<form:form action="writeReview.do" modelAttribute="reviewVO" id="register_form" enctype="multipart/form-data">
	    <form:errors element="div" cssClass="error-color"/>
	    <div class="box-parent">

					
			
		</div>
	    <div class="photoUpload">
				<ul>
					<li class="photoUpload_li">
						<c:if test="${empty review.r_photoname}">
						<img src="${pageContext.request.contextPath}/images/faq/camera_img.png" class="my-photo2">
						</c:if>
						<c:if test="${!empty review.r_photoname}">
						<img src="${pageContext.request.contextPath}/image_upload/${review.r_photo}" width="130" height="160" class="my-photo">
						</c:if>
					</li>
					<li class="review_write_btn02">
						<input type="file" id="upload" name="upload">
						<img id="photo_reset" src="${pageContext.request.contextPath}/images/faq/bin.png">
					</li>
				</ul>
		</div>
	    <ul class="r_title_li">
	    	<li>
			<form:input path="r_title" maxlength='42' placeholder="제목을 입력하세요." onfocus="this.placeholder=''" onblur="this.placeholder = '제목을 입력하세요.'" autocomplete="off"/>
			<form:errors path="r_title" cssClass="error-color"/>
			</li>
		    	<li>
					<form:textarea id="r_content_length" path="r_content" maxlength='500' placeholder="내용을 입력하세요." onfocus="this.placeholder=''" onblur="this.placeholder = '내용을 입력하세요.'" autocomplete="off"/>
					<form:errors path="r_content" cssClass="error-color"/>
					<div id="r_content_ckeck">(0 / 500자)</div>
					<script>
					 function MyCustomUploadAdapterPlugin(editor) {
						    editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
						        return new UploadAdapter(loader);
						    }
						}
					 
					 ClassicEditor
			            .create( document.querySelector( '#r_content' ),{
			            	extraPlugins: [MyCustomUploadAdapterPlugin]
			            })
			            .then( editor => {
							window.editor = editor;
						} )
			            .catch( error => {
			                console.error( error );
			            } );
				    </script>
				</li>
			 </ul>
			<div class="align-left" id="review_write_btn01">
			<form:button id="review_write_btn02">등록</form:button>
			<input type="button" value="취소" id="review_write_btn03">
			</div>
	</form:form>
</div>
<!-- 내용 끝 -->