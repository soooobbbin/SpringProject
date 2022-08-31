<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 내용 시작 -->
<!-- include libraries(jquery,bootstrap) -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- include ckeditor js -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/faq.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/faq.js"></script>
<div class="faq_main">
	<h3>FAQ</h3>
	<form:form action="faqwrite.do" modelAttribute="FAQVO" id="register_form" enctype="multipart/form-data">
	    <form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
			<label for="title">제목</label>
			
		</ul>
		<div class="align-center">
			<form:button>전송</form:button>
			<input type="button" value="목록" onclick="location.href='faqlist.do'">
		</div>
	</form:form>
</div>
<!-- 내용 끝 -->