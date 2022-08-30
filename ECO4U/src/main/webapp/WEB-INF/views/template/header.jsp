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
	<c:if test="${!empty user}">
		[<span class="user_name">${user.id}</span>]
	</c:if>
	<c:if test="${empty user}">
		<!--<a href="${pageContext.request.contextPath}/member/registerUser.do">회원가입</a>-->
		<a href="${pageContext.request.contextPath}/member/login.do">
		<img src="${pageContext.request.contextPath}/images/login.png" class="login">
		</a>
	</c:if>
	<c:if test="${!empty user}">
		<a href="${pageContext.request.contextPath}/member/logout.do">
		<img src="${pageContext.request.contextPath}/images/logout.png" class="logout">
		</a>
	</c:if>
	<c:if test="${!empty user && user.auth == 2}">
		<a href="${pageContext.request.contextPath}/member/myPage.do">
		<img src="${pageContext.request.contextPath}/images/home.png" class="home">
		</a>
		<a href="${pageContext.request.contextPath}/member/myPage.do">
		<img src="${pageContext.request.contextPath}/images/cart.png" class="cart">
		</a>
		<a href="${pageContext.request.contextPath}/member/myPage.do">
		<img src="${pageContext.request.contextPath}/images/wish.png" class="wish">
		</a>
	</c:if>
</div>

<!-- 상단 끝 -->



