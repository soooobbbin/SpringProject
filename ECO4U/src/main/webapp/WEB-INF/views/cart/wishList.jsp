<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/wish.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/wishList.css">
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
	<div class="wish-top">
		<div class="wish-title">
		<h2 class="wish-title-h2">관심 상품</h2>
		<span class="wish-title-span">총 ${count}개</span>
		</div>
	<div class="wish-category">
		<form action="wishList.do" id="search_form"  method="get">
			<ul class="wish-category-ul" id="category" name="category">
				<li id="all"><input type="button"  value="all"  onclick="location.href='/cart/wishList.do?category=0'"></li>
				<li id="living"><input type="button" value="living"  onclick="location.href='/cart/wishList.do?category=1'"></li>
				<li id="beauty"><input type="button" value="beauty"  onclick="location.href='/cart/wishList.do?category=2'"></li>
				<li id="fassion"><input type="button" value="fassion" onclick="location.href='/cart/wishList.do?category=3'"></li>
			</ul>
		</form>
	</div>
	</div>
	
	<div class="wish-choice">
		<span><input type="checkbox" id="selectall" name="selectall"
		 value="전체 선택"  onclick="selectAll(this)" checked="checked">전체 선택</span>
		<span> | <input type="button" value="선택 삭제" id="delete_btn"></span> <!-- 버튼으로 만들어서 선택한 상품 삭제 가능하게 하기 -->
	</div>
	
		<!-- 찜 목록에 상품이 담기지 않은 경우 -->
		<c:if test="${count == 0}">
		<div class="no-wish">관심 상품이 없습니다.</div>
		</c:if>
		
		<!-- 찜 목록에 상품이 담긴 경우 -->
		<c:if test="${count > 0}">
		<form action="addWishToCart.do" method="post" class="wish-form">
		<ul class="wish-list-ul">
			<c:forEach var="wish" items="${list}">
			<li class="wish-list-li">
				<div class="box-parent">
					<input type="hidden" value="${wish.w_num}">
					<input type="hidden" value="${wish.mem_num}">
					<!-- parent 자식1 -->
					<div class="wish-check"> 
					<input type="checkbox" class="select-product" data-wishnum="${wish.w_num}" name="select_product" 
					 onclick="checkSelectAll()" checked="checked">
					</div>
					<!-- parent 자식2 -->
					<div class="product-image"> 
						<img src="../images/product/${wish.p_photoname}" width="80" height="80">
					</div>
					<!-- parent 자식3 -->
					<div class="product-box"> 
						<div class="box-notice pb-span">30,000원 이상 무료배송</div>
						<div class="box-1">
							<div class="box-brand pb-span">[${wish.p_brand}]</div>
							<div class="box-title pb-span">${wish.p_name}</div>
						</div>
						<div class="box-price pb-span"><strong><fmt:formatNumber value="${wish.p_price}"/>원</strong></div>
					</div>
					<!-- parent 자식4 -->
					<div class="product-button"> 
				        <div class="wishTocart-btn">
				        	<input type="button" id="addCart_btn" class="wishButton" data-pnum="${wish.p_num}" value="장바구니">
				        </div>
				        <div class="delete_btn">
				        	<input type="button" class="delete-pro wishButton" data-wishnum="${wish.w_num}" value="삭제">
				        </div>
				    </div>
				</div>
			</li>
			</c:forEach>
		</ul>
		</form>
		<script type="text/javascript">
			$('.delete-pro').click(function(){
				let choice = confirm('삭제하시겠습니까?');
				if(choice){
			        let del_btn = $(this).attr('data-wishnum');
					location.replace('delWish.do?w_num=' + del_btn);
				}
				
			});
		</script>
		</c:if>
</div>

<div class="align-center">
${page}
</div>
<!-- 내용 끝 -->