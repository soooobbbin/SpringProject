<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/review.fav.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/product.review.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/videoAdapter.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/product-detail.css">

<div class="page-main">
	<div id="wrapper">
		<div class="detail-thumbnail">
			<img
				src="${pageContext.request.contextPath}/upload/${product.p_photo}"
				width="400" height="550" class="thumbnail">
		</div>
		<div class="thumbnail-side">
			<div class="detail-h2">
				<span class="title">[${product.p_brand}] ${product.p_name}</span><br>
			</div><br>
			<div class="detail-price" id="detail-div">
				<span class="price"><fmt:formatNumber type="number"
						maxFractionDigits="3" value="${product.p_price}" />원</span>
			</div>
			<div class="wishlist">
				<img src="${pageContext.request.contextPath}/images/heart_blank.png"
					width="30" height="30" class="wishlist">
			</div>
			<div class="detail-dprice" id="detail-div">
				<label class="text">배송비</label>
				<fmt:formatNumber type="number"
						maxFractionDigits="3" value="${product.p_dprice}" />원
			</div>
			<div class="detail-quantity" id="detail-div">
				<label class="text">재고 수량</label>
				<fmt:formatNumber type="number"
						maxFractionDigits="3" value="${product.p_quantity}" />
			</div>
			<hr class="hr">
			<div class="detail-cont1" id="detail-div">
				<label class="text">제품 특징</label><br><br>${product.p_cont1}
			</div>

			<hr class="hr">

			<!-- 수량 선택 -->

			<!-- 수량 선택 끝 -->

			<!-- 최종 금액 -->

			<!-- 최종 금액 끝 -->

			<hr class="hr">
			<div class="cart-buy">
				<button class="button">장바구니</button>
				<button class="button" href="/buy.do?p_num=${product.p_num}">구매하기</button>
			</div>
		</div>
	</div>
</div>