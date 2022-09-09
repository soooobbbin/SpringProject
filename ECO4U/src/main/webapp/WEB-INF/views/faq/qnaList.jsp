<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/member.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/cart.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/qna.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/qna.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/wishList.css">
<!-- <script type="text/javascript">
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
</script> -->
<div class="page" style="height: 793px;">
	<form action="qnalist.do" id="search_form"  method="get">
	
	<!-- 좌측 메뉴바 -->
	<div class="align-center" style="width: 50%; float:left; padding-top: 65px;">
		<div class="menu">
		<input type="button" value="전체주문내역" id="all" onclick="location.href='#'">
		</div>
		<div class="menu">
		<input type="button" value="나의 관심" id="my-wish" onclick="location.href='${pageContext.request.contextPath}/cart/wishList.do'">
		</div>
		<div id="nav-v2">
			<div class="menu-v2"><input type="button" value="내가 쓴 글" id="my-write" onclick="location.href='#'">
				<div class="submenu">
					<div class="submenu2">
						<a href="${pageContext.request.contextPath}/faq/qnalist.do">문의/답변</a>
					</div>
					<div class="submenu2">
						<a href="#">상품평</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 좌측 메뉴바 종료 -->
	
	<!-- 초반 기반 폼 추후 삭제 작업필요 -->
	<!-- 문의 내역 폼 시작 -->
	<div class="mypage-div02">
		<div style="padding-left: 27px; margin-top:-5px">
		<span style="font-size:13px"><a href="/member/myPage.do">My</a> > <a href="/faq/qnalist.do" style="font-weight:bold">문의내역</a></span>
		</div>
		<div class ="page-content02">
			<ul class="category-ul" id="category" name="category">
			<li class="myqna_btn01">
				<input type="button" value="   전체   " onclick="location.href='/faq/qnalist.do?category=0'">
				<input type="button" value="   회원   " onclick="location.href='/faq/qnalist.do?category=1'" style="border-left:none;">
				<input type="button" value="   상품/배송   "  onclick="location.href='/faq/qnalist.do?category=2'" style="border-left:none;">
				<input type="button" value="   기타   "  onclick="location.href='/faq/qnalist.do?category=3'" style="border-left:none;">
			</li>
			</ul>
			
		<c:if test="${count == 0}">
		<div class="no-wish">관심 상품이 없습니다.</div>
		</c:if>
		
		<c:if test="${count > 0}">
		<ul class="qnalist-ul">
			<c:forEach var="qna" items="${list}">
			<!--  -->
			<li class="qnalist-list">
				<div class="box-parent">
					<%-- <input type="hidden" value="${qna.q_category}"> --%>
					<!-- <div class="wish-check">
					<input type="checkbox" id="select_product" name="select_product" 
					 onclick="checkSelectAll()">
					</div> -->
					<div class="qnalist-image01">
						<img src="imageView.do?q_num=${qna.q_num}" onerror="this.src='../images/faq/backcolor.png'" width="75" height="75">
					</div>
					
					<div class="qnalist-span01">
						<span class="box-title"><a href="detail.do?q_num=${qna.q_num}">${qna.q_title}</a></span><br>
						<div class="box-content"><img src="../images/faq/entergray.png" width="15px" height="15px" style="margin-right:4px; margin-bottom:-3px">${qna.q_content}</div>
						<span class="box-date">${qna.reg_date}</span>
						<span class="box-comment" style="font-size:5px">
						<img src="../images/faq/comment.png" width="16px" height="16px" style="margin-left:10px; margin-bottom:-5px">
						(0)
						</span>
					</div>
				</div>
			</li>
			</c:forEach>
		</ul>
		<div class="qnalistspanbottom">
		<span>*1:1문의 등록은 고객센터 우측 말풍선 아이콘 누르시면 됩니다.</span><br>
		<span>*1:1문의 등록은 고객센터 우측 말풍선 아이콘 누르시면 됩니다.</span><br>
		<span>*1:1문의 등록은 고객센터 우측 말풍선 아이콘 누르시면 됩니다.</span>
		</div>
		<div class="page align-center">${page}</div>
		</c:if>
		</div>
	</div>
	<!-- 문의 내역 폼 끝 -->
	</form>
</div>

<!-- 내가 쓴 글 subbar.js -->
<script>
//script.js
$(document).ready(function(){	
	//menu v2
	$(".menu-v2").mouseover(function(){
		$(this).children(".submenu").show(400);
	});
	$(".menu-v2").mouseleave(function(){
		$(this).children(".submenu").hide(200);
	});
	
});
</script>
<%--
<div class="page-main">
	<div class="wish-top">
	<h2>관심 상품</h2>
	<div class="wish-category">
		<form action="qnalist.do" id="search_form"  method="get">
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
		</c:if> --%>
<!-- 내용 끝 -->