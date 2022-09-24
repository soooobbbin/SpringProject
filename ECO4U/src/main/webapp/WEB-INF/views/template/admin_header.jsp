<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">

<!-- 상단 시작 -->
<div class="admin-header">
	<a href="${pageContext.request.contextPath}/main/main.do">
		<img src="${pageContext.request.contextPath}/images/main_logo.png" class="main_logo">
	</a>
	
	<div class="align-center" id="header_center">
		<a href="${pageContext.request.contextPath}/admin/admin_list.do" id="admin_member">회원관리</a> 
		<a href="${pageContext.request.contextPath}/product/admin_plist.do" id="admin_product">상품관리</a> 
		<a href="${pageContext.request.contextPath}/faq/qnamanagementlist.do" id="admin_qna">문의관리</a>
		<a href="${pageContext.request.contextPath}/order/admin_orderList.do" id="admin_order">주문관리</a>
	</div>
	
	<div class="align-right" id="header_right">
		<c:if test="${!empty user}">
			[<span class="user_name">${user.id}</span>]
		</c:if>
	
		<c:if test="${!empty user && user.auth == 2}">
			<a href="${pageContext.request.contextPath}/main/main.do"> 
				<img src="${pageContext.request.contextPath}/images/home.png" class="home">
			</a>
		</c:if>
	</div>
</div>
<!-- 상단 끝 -->



