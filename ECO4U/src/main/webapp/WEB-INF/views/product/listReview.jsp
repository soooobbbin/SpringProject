<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/member.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/cart.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/list-review.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/wishList.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">


<script type="text/javascript">
function checkSelectAll()  {
	  // 전체 체크박스
	  const checkboxes = document.querySelectorAll('input[name="select_review"]');
	  // 선택된 체크박스
	  const checked = document.querySelectorAll('input[name="select_review"]:checked');
	  // select all 체크박스
	  const selectAll = document.querySelector('input[name="selectall"]');
	  
	  if(checkboxes.length === checked.length)  {
	    selectAll.checked = true;
	  }else {
	    selectAll.checked = false;
	  }
}

function selectAll(selectAll)  {
	  const checkboxes = document.getElementsByName('select_review');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked
	  })
}
</script>


<div class="page" style="height: 775px;">
	<form action="mypageReview.do" id="search_form"  method="get">
	
	<!-- 좌측 메뉴바 -->
	<div class="menu">
	<div class="mypage-menu">
	<h2>My Page</h2>
	<div class="user">
		<img src="${pageContext.request.contextPath}/images/user.png">
		<p>${member.mem_name}</p>
		<p>${user.id}</p>
	</div>
	<h3><a href="${pageContext.request.contextPath}/order/orderList.do" id="all">전체 주문 내역</a></h3>
	<h3><a href="${pageContext.request.contextPath}/cart/wishList.do" id="all">나의 관심</a></h3>
	<h3>내가 쓴 글</h3>
	<p><a href="${pageContext.request.contextPath}/faq/qnalist.do" style="color:darkgray;">- 문의/답변</a></p><br>
	<p><a href="${pageContext.request.contextPath}/product/mypageReview.do" style="color:darkgray;">- 상품평</a></p>
	</div>
	</div>
	<!-- 좌측 메뉴바 종료 -->
	<!-- 문의 내역 폼 시작 -->
	<div class="mypage-div02">
		<div style="padding-left: 53px;">
		<span style="font-size:13px"><img id="review_home" alt="마이페이지이동" src="../images/home.png" onclick="location.href='/member/myPage.do'"> > <a href="/product/mypageReview.do" style="font-weight:bold">상품평</a></span>
		</div>
		<div class ="page-content02">
			<ul class="category-ul" id="category" name="category">
			<li class="myreview_btn01">
				<input type="button" value="   전체   " onclick="location.href='/product/mypageReview.do'">
			</li>
			</ul>
		<c:if test="${count == 0}">
		<div class="no-wish">등록된 상품평이 없습니다.</div>
		</c:if>
		<c:if test="${count > 0}">
		<ul class="reviewlist-ul">
		<!-- 전체 선택 체크박스 -->
		<li id="reviewcb">
			<span style="float:left;"><input type="checkbox" id="selectall" name="selectall" value="전체 선택"  onclick="selectAll(this)"></span>
			<span style="float:right; margin-top:1px;">전체 선택&nbsp;&nbsp;|<input type="button" value="삭제" id="reviewdelete_btn">
			</span>
		</li>
		<!-- 전체 선택 체크박스 끝 -->
			<c:forEach var="review" items="${list}">
			<li class="reviewlist-list">
				<div class="box-parent">
					<input type="hidden" value="${review.mem_num}">
					<!-- 선택 체크박스 -->
					<div class="reviewcheck-box">
						<input type="checkbox" class="select-review" name="select_review" 
						 onclick="checkSelectAll()" data-cartnum="${review.r_num}" value="${review.r_num}">
					</div>
					<!-- 선택 체크박스 끝 -->
					<div class="reviewlist-image01">
						<img id="reviewlist-image02" src="imageView.do?p_num=${review.p_num}" onerror="this.src='../images/faq/backcolor.png'" onclick="/product/detail.do?p_num=${review.p_num}'">
					</div>
					
					<div class="reviewlist-span01">
						<img src="../images/faq/reply00.png" width="15px" height="15px" style="margin-right:4px; margin-bottom:-2px">${review.productVO.p_name}<br>
						<div class="box-title"><a href="/product/detail.do?p_num=${review.p_num}">${review.r_content}</a></div><br><br>
						<span class="box-date">${review.reg_date}</span>
						<span class="box-comment" style="font-size:5px">
						<img src="../images/product/like.png" width="16px" height="16px" style="margin-left:10px; margin-bottom:-5px">
						(${review.like_cnt})
						</span>
					</div>
				</div>
			</li>
			</c:forEach>
		</ul>
		</c:if>
		<div class="reviewlistspanbottom">
		<span>* 상품평 등록은 전체 주문 내역에서 할 수 있습니다.</span><br>
		</div>
		<div class="page align-center" style="margin-left:5%;">${page}</div>
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