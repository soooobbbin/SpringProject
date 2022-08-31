<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 내용 시작 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/store.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<div class="page-main">
	<div>
		<h1>오프라인 가게</h1>
	</div>
	<c:if test="${user.auth == 2}"> <%--관리자 2 --%>
	</c:if>
	<div class="align-right">
		<input type="button" value="등록" id="register" onclick="location.href='storeRegister.do'">	
	</div>
</div>
<!-- 내용 끝 -->