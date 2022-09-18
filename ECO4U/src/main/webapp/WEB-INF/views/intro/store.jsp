<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 내용 시작 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/store.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<div class="page-main1">
	<div>
		<h1>오프라인 가게</h1>
	</div>
	<c:if test="${user.auth == 2}"> 
	<div class="align-right">
		<input type="button" value="등록" id="register" onclick="location.href='storeRegister.do'">	
	</div>
	</c:if>
	<c:if test="${count == 0}">
	<div class="result-display">표시할 게시물이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
		<c:forEach var="store" items="${list}">
		<div class="store">
			<a href="detail.do?s_num=${store.s_num}">
			<img src="imageView.do?s_num=${store.s_num}" width="300" height="300" class="my-store">
			</a>
			<p>${store.s_name}</p>
		</div>
		</c:forEach>
	<div class="align-center page">${page}</div>
	</c:if>
</div>
<!-- 내용 끝 -->