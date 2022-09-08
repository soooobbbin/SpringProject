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

   
   <div class="cart-choice">
   <span><input type="checkbox" id="selectall" name="selectall"
    value="전체 선택"  onclick="selectAll(this)">전체 선택</span>
   <span> | 선택 삭제</span> <!-- 버튼으로 만들어서 선택한 상품 삭제 가능하게 하기 -->
   </div>
   
   
      <!-- 찜 목록에 상품이 담기지 않은 경우 -->
      <c:if test="${count == 0}">
      <div class="no-cart">관심 상품이 없습니다.</div>
      </c:if>
      
      <!-- 찜 목록에 상품이 담긴 경우 -->
      <c:if test="${count > 0}">
      
      <ul class="cart-list-ul">
         <c:forEach var="cart" items="${list}">
         <div class="content-main">
         <li class="cart-list-li">
            <div class="box-parent">
               <input type="hidden" value="${cart.p_category}">
               
               <div class="div1">
                  <div class="check-box">
                     <input type="checkbox" id="select_product" name="select_product" 
                      onclick="checkSelectAll()">
                   </div>
                  <span class="box-brand">[${cart.p_brand}]</span>
               </div>
               
               <hr color="gray" width="95%" size="1">
               <div class="div2">
                  <div class="product-image">
                     <img src="../images/product/${cart.p_photoname}" width="80" height="80">
                  </div>
                  <div class="product-box">
                     
                     <span class="box-title">${cart.p_name}</span><br>
                     <span class="box-price"><strong>${cart.p_price}</strong></span>
                  </div>
               </div>
               
               <div class="div3">
                  <div class="cart-bottom-price">
                     <span>상품금액</span><br>
                     <span>${cart.p_price}</span>
                  </div>
                  -
                  <div class="cart-bottom-price">
                     <span>할인금액</span><br>
                     <span>0</span>
                  </div>
                  -
                  <div class="cart-bottom-price">
                     <span>배송비</span><br>
                     <span>${cart.p_dprice}</span>
                  </div>
                  =
                  <div class="cart-bottom-price">
                     <span>주문금액</span><br>
                     <span>${cart.p_price}+${cart.p_dprice}</span>
                  </div>
               </div>
            </div>
         </li>
         
         
         </div>
         </c:forEach>
      </ul>
      </c:if>
      <div class="cart-order">
         <input type="button" value="결제하기" onclick="location.href='orders.do'">
      </div>
   
</div>
<!-- 내용 끝 -->