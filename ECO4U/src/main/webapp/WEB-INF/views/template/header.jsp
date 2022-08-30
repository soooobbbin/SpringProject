<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 상단 시작 -->
<a href="${pageContext.request.contextPath}/main/main.do">
<img src="${pageContext.request.contextPath}/images/main_logo.png" class="main_logo">
</a>
<div class="align-center" id="header_center">
<a href="${pageContext.request.contextPath}/intro/list.do">Intro</a>
<a href="${pageContext.request.contextPath}/product/list.do">Product</a>
<a href="${pageContext.request.contextPath}/community/list.do">Community</a>
</div>
<div class="align-right" id="header_right" >
	<a href="${pageContext.request.contextPath}/board/list.do">게시판</a>
	<c:if test="${!empty user && !empty user.photo}">
		<img src="${pageContext.request.contextPath}/member/photoView.do" width="25" height="25" class="my-photo">
	</c:if>
	<c:if test="${!empty user && empty user.photo}">
		<img src="${pageContext.request.contextPath}/images/face.png" width="25" height="25" class="my-photo">
	</c:if>
	<c:if test="${!empty user && !empty user.nick_name}">
		[<span class="user_name">${user.nick_name}</span>]
	</c:if>
	<c:if test="${!empty user && empty user.nick_name}">
		[<span class="user_name">${user.id}</span>]
	</c:if>
	<c:if test="${empty user}">
		<a href="${pageContext.request.contextPath}/member/registerUser.do">회원가입</a>
		<a href="${pageContext.request.contextPath}/member/login.do">로그인</a>
	</c:if>
	<c:if test="${!empty user}">
		<a href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a>
	</c:if>
	<c:if test="${!empty user && user.auth == 2}">
		<a href="${pageContext.request.contextPath}/member/myPage.do">MY페이지</a>
	</c:if>
</div>

<!-- 상단 끝 -->



