<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 상단 시작 -->
<a href="${pageContext.request.contextPath}/main/main.do"> 
	<img src="${pageContext.request.contextPath}/images/main_logo.png" class="main_logo">
</a>
<div class="align-center" id="header_center">
	<a href="${pageContext.request.contextPath}/intro/list.do" id="intro">Intro</a>
	<a href="${pageContext.request.contextPath}/product/list.do?p_category=0" id="product">Product</a> 
	<a href="${pageContext.request.contextPath}/community/list.do" id="community">Community</a>
	<div id="menu">
		<div class="intro2">
			<a href="${pageContext.request.contextPath}/intro/eco4u.do" id="eco4u">ECO4U</a>
			<br><br><br> 
			<a href="${pageContext.request.contextPath}/intro/store.do" id="store">Offline Store</a>
		</div>
		<div class="product2">
			<a href="${pageContext.request.contextPath}/product/list.do?p_category=1" id="living">Living</a>
			<br><br> 
			<a href="${pageContext.request.contextPath}/product/list.do?p_category=2" id="beauty">Beauty</a>
			<br><br> 
			<a href="${pageContext.request.contextPath}/product/list.do?p_category=3" id="fashion">Fashion</a>
		</div>
		<div class="community2">
			<a href="${pageContext.request.contextPath}/intro/list.do" id="communication">Communication</a>
			 <br><br><br> 
			<a href="${pageContext.request.contextPath}/intro/list.do" id="QnA">QnA</a>
		</div>
	</div>
</div>
<div class="align-right" id="header_right">
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
	<c:if test="${!empty user && user.auth == 1}">
		<a href="${pageContext.request.contextPath}/member/myPage.do"> 
		<img src="${pageContext.request.contextPath}/images/home.png" class="home">
		</a>
		<a href="${pageContext.request.contextPath}/cart/cart.do"> 
		<img src="${pageContext.request.contextPath}/images/cart.png" class="cart">
		</a>
		<a href="${pageContext.request.contextPath}/cart/wishList.do"> 
		<img src="${pageContext.request.contextPath}/images/wish.png" class="wish">
		</a>
	</c:if>
	<c:if test="${!empty user && user.auth == 2}">
		<a href="#"> 
		<img src="${pageContext.request.contextPath}/images/home.png" class="home">
		</a>
	</c:if>
</div>

<!-- 상단 끝 -->