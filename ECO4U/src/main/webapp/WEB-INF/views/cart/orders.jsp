<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/order.css">
<!-- 내용 시작 -->
<div class="page-main">
	<div class="header">
		<div class="header-left">
			주문결제
		</div>
		<div class="header-right">
			장바구니><b>주문결제</b>>주문결제
		</div>
	</div>
	<div class="order-main">
		<div class="order-main-left">
			<div class="order-zipcode">
				<div class="order-zipcode-content">
					<div class="zip-content1">배송지</div>
					<div class="zip-content2"><input type="button" value="배송지 변경" id="zipcodebtn"></div>
					<div class="zip-content3">
						${zipcode.zip_rec} ${zipcode.zip_cell}<br>
						${zipcode.address1} ${zipcode.address2}<br>
						 
					</div>
				</div>
			</div>
			<div class="order-kind">
				<div class="order-kind-content">
				</div>
			</div>
		</div>
		<div class="order-main-list">
			<div class="list-content">
			</div>
		</div>
	</div>
</div>
<!-- 내용 끝 -->