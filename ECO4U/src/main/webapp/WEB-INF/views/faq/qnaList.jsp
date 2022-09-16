<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/member.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/cart.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/qna.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/qna.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/wishList.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
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
<div class="page" style="height: 775px;">
	<form action="qnalist.do" id="search_form"  method="get">
	
	<!-- 좌측 메뉴바 -->
	<div class="menu">
	<div class="mypage-menu">
	<h2>My Page</h2>
	<div class="user">
		<img src="${pageContext.request.contextPath}/images/user.png">
		<p>${user.mem_name}</p>
		<p>${user.id}</p>
	</div>
	<a href="#" id="all"><h3>전체 주문 내역</h3></a>
	<a href="${pageContext.request.contextPath}/cart/wishList.do" id="all">
	<h3>나의 관심</h3></a>
	<h3>내가 쓴 글</h3>
	<a href="${pageContext.request.contextPath}/faq/qnalist.do"><p>- 문의/답변</p></a><br>
	<a href="#"><p>- 상품평</p></a>
	</div>
	</div>
	<!-- 좌측 메뉴바 종료 -->
	
	<!-- 초반 기반 폼 추후 삭제 작업필요 -->
	<!-- 문의 내역 폼 시작 -->
	<div class="mypage-div02">
		<div style="padding-left: 53px;">
		<span style="font-size:13px"><img id="qna_home" alt="마이페이지이동" src="../images/home.png" onclick="location.href='/member/myPage.do'"> > <a href="/faq/qnalist.do" style="font-weight:bold">문의내역</a></span>
		</div>
		<div class ="page-content02">
			<ul class="category-ul" id="category" name="category">
			<li class="myqna_btn01">
				<input type="button" value="   전체   " onclick="location.href='/faq/qnalist.do?category=0'">
				<input type="button" value="   회원   " onclick="location.href='/faq/qnalist.do?category=1'" style="border-left:none;">
				<input type="button" value="   상품/배송   "  onclick="location.href='/faq/qnalist.do?category=2'" style="border-left:none;">
				<input type="button" value="   기타   "  onclick="location.href='/faq/qnalist.do?category=3'">
			</li>
			</ul>
		<c:if test="${count == 0}">
		<div class="no-wish">문의 내역이 없습니다.</div>
		</c:if>
		<c:if test="${count > 0}">
		<div class="align-right">
			<span><input type="checkbox" id="selectall" name="selectall"
			 value="전체 선택"  onclick="selectAll(this)">전체 선택</span>
			<span> | <input type="button" value="선택 삭제" id="delete_btn"></span> 
		</div>
		<ul class="qnalist-ul">
			<c:forEach var="qna" items="${list}">
			<li class="qnalist-list">
				<div class="box-parent">
					<input type="hidden" value="${qna.q_category}">
					<input type="hidden" value="${qna.mem_num}">
					<!-- <div class="wish-check">
					<input type="checkbox" id="select_product" name="select_product" 
					 onclick="checkSelectAll()">
					</div> -->
					<div class="qnalist-image01">
						<img id="qnalist-image02" src="imageView.do?q_num=${qna.q_num}" onerror="this.src='../images/faq/backcolor2.png'" onclick="location.href='detail.do?q_num=${qna.q_num}'">
					</div>
					
					<div class="qnalist-span01">
						<div class="box-title"><a href="detail.do?q_num=${qna.q_num}">${qna.q_title}</a></div><br>
						<div class="box-content">
						<img src="../images/faq/enterdarkgray.png" width="15px" height="15px" style="margin-right:4px; margin-bottom:-3px">
						<c:choose>
				        <c:when test="${fn:length(qna.q_content) gt 58}">
				        <c:out value="${fn:substring(qna.q_content, 0, 57)}">
				        </c:out><a href="detail.do?q_num=${qna.q_num}" style="font-size:11px; font-weight:bold; color:#999999;">... 더보기</a>
				        </c:when>
				        <c:otherwise>
				        <c:out value="${qna.q_content}">
				        </c:out>
				        </c:otherwise>
						</c:choose>
						</div>
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
		</c:if>
		<div class="qnalistspanbottom">
		<span>*1:1문의 등록은 고객센터 우측 말풍선 아이콘 누르시면 됩니다.</span><br>
		<span>*1:1문의 등록은 고객센터 우측 말풍선 아이콘 누르시면 됩니다.</span><br>
		</div>
		<div class="page align-center">${page}</div>
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
<!-- 내용 끝 -->