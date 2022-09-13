<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/cart.js"></script>
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
	<h2>관심 상품</h2>
	<div class="wish-category">
		<form action="wishList.do" id="search_form"  method="get">
			<ul class="wish-category-ul" id="category" name="category">
				<li><input type="button" value="all" onclick="location.href='/cart/wishList.do?category=0'"></li>
				<li><input type="button" value="living" onclick="location.href='/cart/wishList.do?category=1'"></li>
				<li><input type="button" value="beauty"  onclick="location.href='/cart/wishList.do?category=2'"></li>
				<li><input type="button" value="fassion"  onclick="location.href='/cart/wishList.do?category=3'"></li>
			</ul>
		</form>
	</div>
	</div>
	
	<div class="wish-choice">
		<span><input type="checkbox" id="selectall" name="selectall"
		 value="전체 선택"  onclick="selectAll(this)">전체 선택</span>
		<span> | 선택 삭제</span> <!-- 버튼으로 만들어서 선택한 상품 삭제 가능하게 하기 -->
	</div>
	
		<!-- 찜 목록에 상품이 담기지 않은 경우 -->
		<c:if test="${count == 0}">
		<div class="no-wish">관심 상품이 없습니다.</div>
		</c:if>
		
		<!-- 찜 목록에 상품이 담긴 경우 -->
		<c:if test="${count > 0}">
		
		<ul class="wish-list-ul">
			<c:forEach var="wish" items="${list}">
			<li class="wish-list-li">
				<div class="box-parent">
					<input type="hidden" value="${wish.p_category}">
					<input type="hidden" value="${wish.mem_num}">
					<div class="wish-check">
					<input type="checkbox" id="select_product" name="select_product" 
					 onclick="checkSelectAll()">
					</div>
					<div class="product-image">
						<img src="../images/product/${wish.p_photoname}" width="80" height="80">
					</div>
					<div class="product-box">
						<span class="box-brand">[${wish.p_brand}]</span><br>
						<span class="box-title">${wish.p_name}</span><br>
						<span class="box-price"><strong>${wish.p_price}</strong></span><br>
						<span class="box-dprice">배송비 ${wish.p_dprice}</span><br>
						<span class="box-pcate">카테고리 ${wish.p_category}</span>
					</div>
				</div>
			</li>
			</c:forEach>
		</ul>
		</c:if>
</div>

<div class="align-center">
${page}
</div>
<!-- 내용 끝 -->