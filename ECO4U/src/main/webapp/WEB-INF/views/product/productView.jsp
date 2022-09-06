<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/review.fav.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/product.review.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/videoAdapter.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/product-detail.css">

<form action="detail.do" method="post">
	<input type="hidden" name="p_num" value="${product.p_num}" />
</form>

<div class="page-main">
	<div id="wrapper">
	<!-- 상품 헤더 시작 -->
		<div class="detail-thumbnail">
			<img
				src="${pageContext.request.contextPath}/images/product/${product.p_photoname}"
				width="400" height="400" class="thumbnail">
		</div>
		<div class="thumbnail-side">
			<div class="detail-h2">
				<span class="title">[${product.p_brand}] ${product.p_name}</span><br>
			</div><br>
			<div class="detail-price" id="detail-div">
				<span class="price"><fmt:formatNumber type="number"
						maxFractionDigits="3" value="${product.p_price}" /> 원</span>
			</div>
			<div class="wishlist">
				<img src="${pageContext.request.contextPath}/images/heart_blank.png"
					width="30" height="30" class="wishlist">
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
			<div class="detail-buycount" id="detail-div">
				<label class="text count">${product.p_name}</label>
				<button type="button" class="minus">-</button>
				<input type="number" class="numBox" min="1" max="${product.p_quantity}" value="1" readonly="readonly"/>
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
			
			<!-- 최종 금액 끝 -->

			<hr class="hr">
			<div class="cart-buy">
				<button type="button" class="addCart_btn button">장바구니</button>
				<script>
					$(".addCart_btn").click(function(){
						var p_num = $("#p_num").val();
						var order_quantity = $(".numBox").val();
						
						var data = {
								p_num : p_num,
								order_quantity : order_quantity
								};
						
						$.ajax({
							url : "views/cart/cart",
							type : "post",
							data : data,
							success : function(result){
								
								if(result == 1){
									alert("장바구니에 상품이 담겼습니다.");
									$(".numBox").val("1");
								}else{
									alert("회원만 사용할 수 있습니다.");
									$(".numBox").val("1");
								}
								
							},
							error : function(){
								alert("장바구니 추가 실패");
							}
						});
					});
				</script>
				
				<button class="button" value="구매하기" onclick="location.href='/buy.do?p_num=${product.p_num}'">구매하기</button>
			</div>
		</div>
	<!-- 상품 헤더 끝 -->
	
	<!-- 상품 본문 시작 -->
	<table class="product-category">
		<tr>
		<td id="detail">상세 설명</td>
		<td id="review">구매 후기</td>
		</tr>
	</table>
	
	<div class="product-detail align-center">
		${product.p_cont2}
	</div>
	<!-- 상품 본문 끝 -->
	</div>
</div>




