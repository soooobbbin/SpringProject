<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/faq.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/faq.css">
<div class="faq_main">
	<h2>QnA 게시판 목록</h2>
	<form:form action="faqlist.do" id="search_form">
		
	</form:form>
</div>
<!-- 내용 끝 -->



