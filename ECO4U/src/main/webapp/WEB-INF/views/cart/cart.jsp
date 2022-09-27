<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		<div class="cart-left">장바구니</div>
		<div class="cart-right"><b>장바구니</b> > 주문/결제 > 주문완료</div>
	</div>
	<c:if test="${empty list || count == null}">
	<div class="result-display">
		장바구니에 담은 상품이 없습니다.
	</div>
	</c:if>
	<c:if test="${!empty list}">
	<div class="cart-choice">
	<span><input type="checkbox" id="selectall" name="selectall"
	 value="전체 선택"  onclick="selectAll(this)" checked="checked">전체 선택</span>
	<span> | <input type="button" value="선택 삭제" id="delete_btn"></span> 
	</div>
	
	<div class="content">
		<div class="content1">
		<ul class="cart-list-ul">
			<c:forEach var="cart" items="${list}">
			<div class="content-main">
			<li class="cart-list-li">
				<div class="box-parent">
					<input type="hidden" value="${cart.productVO.p_category}">
					<input type="hidden" value="${cart.mem_num}">
					<input type="hidden" value="${cart.cart_num}">
					<input type="hidden" value="${cart.p_num}">
					<input type="hidden" value="${cart.productVO.p_status}">
					
					<div class="div1">
						<div class="check-box">
							<input type="checkbox" class="select-product" name="select_product" 
							 onclick="checkSelectAll()" data-cartnum="${cart.cart_num}" value="${cart.cart_num}" 
							 data-price="${cart.productVO.p_price * cart.order_quantity}" checked="checked">
						 </div>
						<div class="box-brand">[${cart.productVO.p_brand}]</div>
					</div>
					
					<hr color="gray" width="95%" size="1">
					
					<div class="div2-parent">
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
								<span class="box-price"><strong><fmt:formatNumber value="${cart.productVO.p_price}"/>원</strong></span>
							</div>
							
						</div>
						<div class="div2-1">
	                        <c:if test="${cart.productVO.p_status == 2 or cart.productVO.p_quantity < cart.order_quantity}">[판매중지]</c:if>
							<c:if test="${cart.productVO.p_status == 1 and cart.productVO.p_quantity >= cart.order_quantity}">
								<button class="minus">-</button>
								<input type="number" name="order_quantity" min="1" max="99999" 
								value="${cart.order_quantity}" class="quantity-width" data-cartnum="${cart.cart_num}">
								<button class="plus">+</button>
								<br>
								<input type="button" value="변경" class="cart-modify"
								data-cartnum="${cart.cart_num}" data-pnum="${cart.p_num}">
							</c:if>
	                    </div>
	                    
	                    <div class="div2-2">
								<input type="button" value="X" class="delete-pro" data-cartnum="${cart.cart_num}">
						</div>
                    </div>
                    
					<div class="div3">
						<div class="cart-bottom-price">
							<span>상품금액</span><br>
							<div class="price-span"><fmt:formatNumber value="${cart.productVO.p_price * cart.order_quantity}"/>원</div>
						</div>
						<span class="span-sym">-</span>
						<div class="cart-bottom-price">
							<span>할인금액</span><br>
							<div class="price-span sale">0원</div>
						</div>
						<span class="span-sym">+</span>
						<div class="cart-bottom-price">
							<span>배송비</span><br>
							<c:if test="${cart.productVO.p_price * cart.order_quantity >= 30000}">
							<div class="price-span">0원</div>
							</c:if>
							<c:if test="${cart.productVO.p_price * cart.order_quantity < 30000}">
							<div class="price-span"><fmt:formatNumber value="${cart.productVO.p_dprice}"/>원</div>
							</c:if>
							
						</div>
						<span class="span-sym">=</span>
						<div class="cart-bottom-price">
							<span>주문금액</span><br>
							<div id="item_total" class="price-span"><fmt:formatNumber value="${cart.cart_total}"/>원</div>
						</div>
					</div>
				</div>
			</li>
			</div>
			</c:forEach>
		</ul>
		</div> <!-- end of content1 -->
		<script type="text/javascript">
			$('.delete-pro').click(function(){
				let choice = confirm('삭제하시겠습니까?');
				if(choice){
			        let del_btn = $(this).attr('data-cartnum');
					location.replace('delete.do?cart_num='+del_btn);
				}
				
			});
			
			$('.minus').click(function(){
				let num = $(this).parent('div').find('.quantity-width').val();
				$(this).parent('div').find('.quantity-width').val(--num);
			});
			
			
			$('.plus').click(function(){
				let num = $(this).parent('div').find('.quantity-width').val();
				$(this).parent('div').find('.quantity-width').val(++num);
			});
			
		</script> 
		
		<div class="content2">
			<span class="content2-span">결제정보</span>
			<hr color="black" width="95%" size="1">
			<br>
			<div class="order-info">
				<table class="order-info-table">
					<tr>
						<td>상품수</td>
						<td class="td-right td-count"><span class="td_count" id="td_count">${count}</span></td>
					</tr>
					<tr>
						<td>상품금액</td>
						<td class="td-right"><span class="td_all_total" id="td_all_total"><fmt:formatNumber value="${all_total}"/></span>원</td>
					</tr>
					<tr>
						<td>할인금액</td>
						<td class="td-right td-discount">-0원</td>
					</tr>
					<tr>
						<td>배송비</td>
						<c:if test="${all_total >= 30000}">
						<td class="td-right"><span class="td_b" id="td_b"><fmt:formatNumber value="0"/></span>원</td>
						</c:if>
						<c:if test="${all_total < 30000}">
						<td class="td-right"><span class="td_b" id="td_b"><fmt:formatNumber value="2500"/></span>원</td>
						</c:if>
						<!-- <td class="td-right"><fmt:formatNumber value="${cart.productVO.p_dprice}"/>원</td> -->
					</tr>
				</table>
				<hr color="black" width="95%" size="1">
				<div class="order-total">
					<table class="order-info-table">
						<tr>
							<td class="order-bottom">총 결제금액</td>
							<c:if test="${all_total >= 30000}">
							<td class="order-bottom-total all_total"><span class="td_all" id="td_all"><fmt:formatNumber value="${all_total}"/></span>원</td>
							</c:if>
							<c:if test="${all_total < 30000}">
							<td class="order-bottom-total all_total"><span class="td_all" id="td_all"><fmt:formatNumber value="${all_total+2500}"/></span>원</td>
							</c:if>
							
						</tr>
					</table>
				</div>
			</div>
			<div class="cart-order">
				<input type="button" value="결제하기" class="order-btn">
			</div>
		</div>
	</div> <!-- end of content -->
	</c:if>
		
	
</div>

<!-- 내용 끝 -->