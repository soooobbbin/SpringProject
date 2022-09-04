<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/product-detail.js"></script>



<div class="page-main">
	<div class="product-main">
		<form action="detail.do" method="post" id="detail_form">
			<input type="hidden" name="p_num" value="${list.p_num}">
			
			
			<div class="detail-thumbnail">
				<img src="${pageContext.request.contextPath}/upload/${list.p_photo}" width="300" height="500" class="thumbnail">
			</div>
			<div class="detail-h2"><h2>[${list.p_brand}]${list.p_name}</h2></div>
			<div class="detail-price" id="detail-div">
				<span class="price"><fmt:formatNumber type="number"
					maxFractionDigits="3" value="${list.p_price}" />원</span>
			</div>
				<img src="${pageContext.request.contextPath}/upload/heart_blank" width="100" height="100" class="wishlist">
			<hr>
			<div class="detail-dprice" id="detail-div">
				<label>배송비</label>${list.p_dprice}
			</div>
			<div class="detail-quantity" id="detail-div">
				<label>재고 수량</label>${list.p_quantity}
			</div>
			<hr>
			<div class="detail-cont1" id="detail-div">
				<label>제품 특징</label><br>${list.p_quantity}
			</div>
			<hr>
			
			<!-- 수량 선택 -->
			
			<!-- 수량 선택 끝 -->
			
			<!-- 최종 금액 -->
			
			<!-- 최종 금액 끝 -->
			
			<hr>
			<div class="cart-buy">
			<button class="button">장바구니</button>
			<button class="button" href="/buy?p_num=${list.p_num}">구매하기</button>

		</form>
	</div>
</div>