<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/cart.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/cart.css">
<script type="text/javascript">
function checkSelectAll()  {
	  // 전체 체크박스
	  const checkboxes 
	    = document.querySelectorAll('input[name="select_product"]');
	  // 선택된 체크박스
	  const checked 
	    = document.querySelectorAll('input[name="select_product"]:checked');
	  // select all 체크박스
	  const selectAll 
	    = document.querySelector('input[name="selectall"]');
	  
	  if(checkboxes.length === checked.length)  {
	    selectAll.checked = true;
	  }else {
	    selectAll.checked = false;
	  }
}

function selectAll(selectAll)  {
	  const checkboxes 
	     = document.getElementsByName('select_product');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked
	  })
}
</script>
<div class="page-main">
	<div class="cart-top">
		<h2 class="cart-left">장바구니</h2>
		<p class="cart-right1">장바구니</p>
		<p class="cart-right2"> > 주문/결제 > 주문완료</p>
	</div>
	<c:if test="${empty list}">
	<div class="result-display">
		장바구니에 담은 상품이 없습니다.
	</div>
	</c:if>
	<c:if test="${!empty list}">
	<div class="cart-choice">
	<span><input type="checkbox" id="selectall" name="selectall"
	 value="전체 선택"  onclick="selectAll(this)">전체 선택</span>
	<span> | <input type="button" value="선택 삭제" id="delete_btn"></span> 
	</div>
	
		<ul class="cart-list-ul">
			<c:forEach var="cart" items="${list}">
			<div class="content-main">
			<li class="cart-list-li">
				<div class="box-parent">
					<input type="hidden" value="${cart.productVO.p_category}">
					<input type="hidden" value="${cart.mem_num}">
					<input type="hidden" value="${cart.cart_num}">
					<input type="hidden" value="${cart.p_num}">
					
					<div class="div1">
						<div class="check-box">
							<input type="checkbox" class="select-product" name="select_product" 
							 onclick="checkSelectAll()" data-cartnum="${cart.cart_num}" value="${cart.cart_num}">
						 </div>
						<span class="box-brand">[${cart.productVO.p_brand}]</span>
					</div>
					
					<hr color="gray" width="95%" size="1">
					<div class="div2">
						<div class="product-image">
						<a href="${pageContext.request.contextPath}/product/detail.do?p_num=${cart.p_num}">
							<img src="../images/product/${cart.productVO.p_photoname}" width="80" height="80">
						</a>
						</div>
						<div class="product-box">
							<a href="${pageContext.request.contextPath}/product/detail.do?p_num=${cart.p_num}">
							<span class="box-title">${cart.productVO.p_name}</span><br>
							</a>
							<span class="box-price"><strong>${cart.productVO.p_price}</strong></span>
						</div>
						<input type="button" value="삭제" class="delete-pro" data-cartnum="${cart.cart_num}">
					</div>
					
					<div class="div3">
						<div class="cart-bottom-price">
							<span>상품금액</span><br>
							<span>${cart.productVO.p_price}</span>
						</div>
						-
						<div class="cart-bottom-price">
							<span>할인금액</span><br>
							<span>0</span>
						</div>
						-
						<div class="cart-bottom-price">
							<span>배송비</span><br>
							<span>${cart.productVO.p_dprice}</span>
						</div>
						=
						<div class="cart-bottom-price">
							<span>주문금액</span><br>
							<span id="item_total">${cart.cart_total}</span>
						</div>
					</div>
				</div>
			</li>
			</div>
			</c:forEach>
		</ul>
		<script type="text/javascript">
			$('.delete-pro').click(function(){
				let choice = confirm('삭제하시겠습니까?');
				if(choice){
			        let del_btn = $(this).attr('data-cartnum');
					location.replace('delete.do?cart_num='+del_btn);
				}
				
			});
			
		</script> 
		<div class="cart-order">
			<input type="button" value="결제하기" onclick="location.href='orders.do'">
		</div>
		</c:if>
</div>

<!-- 내용 끝 -->