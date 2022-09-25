<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 내용 시작 -->

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.0/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/review.fav.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/product.review.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/product.detail.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/videoAdapter.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/product-detail.css">

<div class="page-main">
	<c:if test="${product.p_status == 2}"><!-- 미표시 상품 -->
	<div class="result-display">
		<div class="align-center">
			본 상품은 판매 중지되었습니다.<br>
			<input type="button" value="판매상품 보기" onclick="location.href='list.do'">
		</div>
	</div>
	</c:if>
	<c:if test="${product.p_status == 1}"><!-- 표시 상품 -->
	<div id="wrapper">
	<!-- 상품 헤더 시작 -->
		<div class="detail-thumbnail">
			<img src="${pageContext.request.contextPath}/product/imageView.do?p_num=${product.p_num}"
					width="400" height="400" class="thumbnail">
		</div>
		<div class="thumbnail-side">
			<form id="product_cart" method="post">
			<input type="hidden" name="p_num" value="${product.p_num}" id="p_num">
			<input type="hidden" name="p_price" value="${product.p_price}" id="p_price">
			<input type="hidden" name="p_quantity" value="${product.p_quantity}" id="p_quantity">
			
			<div class="detail-h2">
				<span class="title">[${product.p_brand}] ${product.p_name}</span><br>
			</div><br>
			<div class="detail-price" id="detail-div">
				<span class="price"><fmt:formatNumber type="number"
						maxFractionDigits="3" value="${product.p_price}" /> 원</span>
			</div>
			<div class="wishlist">
				<img src="${pageContext.request.contextPath}/images/heart_blank.png"
					width="30" height="30" id="wishlist">
			</div>
			<div class="detail-dprice" id="detail-div">
				<label class="text">배송비</label>
				<fmt:formatNumber type="number"
						maxFractionDigits="3" value="${product.p_dprice}" /> 원
			</div>
			<div class="detail-quantity" id="detail-div">
				<label class="text">재고 수량</label>
				<fmt:formatNumber type="number"
						maxFractionDigits="3" value="${product.p_quantity}" /> EA
			</div>
			<hr class="hr">
			<div class="detail-cont1" id="detail-div">
				<label class="text">제품 특징</label><br><br>${product.p_cont1}
			</div>

			<hr class="hr">
			
			<!-- 수량 선택 -->
			<c:if test="${product.p_quantity > 0}">
			<div class="detail-buycount" id="detail-div">
				<label class="text count">${product.p_name}</label>
				<!-- 리뷰에 필요한 p_num 불러오기 -->
				<button type="button" class="minus">-</button>
				<input type="number" name="order_quantity"  id="order_quantity" class="numBox" min="1" max="${product.p_quantity}" value="1" readonly="readonly"/>
				<button type="button" class="plus">+</button>
				<script>
					$(".minus").click(function(){
						var num = $(".numBox").val();
						var minusNum = Number(num) - 1;
						
						if(minusNum <= 0){
							$(".numBox").val(num);
						}else{
							$(".numBox").val(minusNum);
						}
					});
					
					$(".plus").click(function(){
						var num = $(".numBox").val();
						var plusNum = Number(num) + 1;
						
						if(plusNum > ${product.p_quantity}){
							$(".numBox").val(num);
						}else{
							$(".numBox").val(plusNum);
						}
					});
				</script>
			</div>
			<!-- 수량 선택 끝 -->
			<!-- 최종 금액 -->
			<hr class="hr">
			<div class="cart-buy">
				<button type="submit" class="addCart_btn button">장바구니</button>
				<button type="button" class="button" value="구매하기" onclick="location.href='orders.do'">구매하기</button>
			</div>
			<!-- 최종 금액 끝 -->
			</c:if>
			<c:if test="${product.p_quantity <= 0}">
				<li class="align-center">
					<span class="sold-out">품절</span>
				</li>
			</c:if>
			
			</form>
		</div>
	<!-- 상품 헤더 끝 -->
	
	<!-- 카테고리를 누르면 해당 위치로 이동하는 스크립트 -->
	<script>
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){ 
           event.preventDefault();
		$('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
		});
	});
	</script>
	<!-- 상품 본문 시작 -->
	<table class="product-category">
		<tr>
		<td id="detail">
			<a href="#target1" class="scroll">상세 설명</a></td>
		<td id="review">
			<a href="#target1" class="scroll">구매 후기(${product.review_count})</a></td>
		</tr>
	</table>
	<div id="target1">
		<div class="product-detail align-center">
			${product.p_cont2}
		</div>
	</div>
	<br>
	<br>
	<!-- 상품 본문 끝 -->
	<!-- 리뷰 시작 -->
	<div id="target1">
		<h4>후기 (${product.review_count}건)</h4>
		<!-- 리뷰 등록 버튼 -->
		<div id="review_div">
			<span class="re-name">상품평 달기</span>
			<form id="re_form">
				<input type="hidden" name="p_num"
				   value="${product.p_num}" id="p_num">
				<textarea rows="3" cols="50" 
				  name="re_content" id="re_content"
				  class="rep-content"
				  <c:if test="${empty user}">disabled="disabled"</c:if>
				  ><c:if test="${empty user}">로그인해야 작성할 수 있습니다.</c:if></textarea>
				<c:if test="${!empty user}">
				<div id="re_first">
					<span class="letter-count">300/300</span>
				</div>
				<div id="re_second" class="align-right">
					<input type="submit" value="등록">
				</div>
				</c:if>
			</form>
		</div>
		<!-- 리뷰 등록 버튼 끝-->
		<div id="output"></div>
		<div class="paging-button" style="display:none;">
			<input type="button" value="다음 리뷰 보기">
		</div>
	</div>
	<!-- 리뷰 끝 -->
	</div>
	</c:if>
</div>




