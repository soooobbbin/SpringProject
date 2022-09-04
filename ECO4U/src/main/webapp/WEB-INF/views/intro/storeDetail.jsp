<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 내용 시작 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/store.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=51c3c8bd7cca6819fa2e02c82df6d5e3&libraries=services"></script>

<div class="page-main">
	<div>
		<h1>${store.s_name}</h1>
	</div>
	<c:if test="${user.auth == 2}"> 
	</c:if>
	<div class="align-right">
		<input type="button" value="수정" 
			onclick="location.href='update.do?s_num=${store.s_num}'">
		<input type="button" value="삭제" id="delete_btn">
		<input type="button" value="홈으로" 
			onclick="location.href='${pageContext.request.contextPath}/intro/store.do'">
	</div>
	<div id="map" style="width:500px;height:400px;float:left;">
	</div>
	<div class="store-content">
		<h2>가게 소개</h2>
		<span>${store.s_content}</span><br>
		<h2>전화번호</h2>
		<span>${store.s_tel}</span><br>
		<h2>주소</h2>
		<span>${store.zipcode}</span>
		<span>${store.address1} ${store.address2}</span>
	</div>
	
	<c:if test="${store.s_num == 27}">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/map/map1.js"></script>
	</c:if>
	<c:if test="${store.s_num == 26}">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/map/map2.js"></script>
	</c:if>
	<c:if test="${store.s_num == 25}">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/map/map3.js"></script>
	</c:if>
	<c:if test="${store.s_num == 24}">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/map/map4.js"></script>
	</c:if>
	<c:if test="${store.s_num == 23}">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/map/map5.js"></script>
	</c:if>
	<c:if test="${store.s_num == 21}">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/map/map6.js"></script>
	</c:if>
</div>
<!-- 내용 끝 -->