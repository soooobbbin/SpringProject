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
	  const checkboxes = document.querySelectorAll('input[name="select_qna"]');
	  // 선택된 체크박스
	  const checked = document.querySelectorAll('input[name="select_qna"]:checked');
	  // select all 체크박스
	  const selectAll = document.querySelector('input[name="selectall"]');
	  
	  if(checkboxes.length === checked.length)  {
	    selectAll.checked = true;
	  }else {
	    selectAll.checked = false;
	  }
}

function selectAll(selectAll)  {
	  const checkboxes = document.getElementsByName('select_qna');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked
	  })
}
</script>
<style>
.page-content02{
	margin-top: 10%;
}
</style>
<div class="page" style="height: 835px;">
	<form action="qnamanagementlist.do" id="search_form"  method="get">
	<!-- 문의 내역 폼 시작 -->
	<div class="mypage-div02">
		<div style="padding-left: 53px;">
		<span style="font-size:13px"><img id="qna_home" alt="마이페이지이동" src="../images/home.png" onclick="location.href='/faq/qnalist.do'"> > <a href="qnamanagementlist.do" style="font-weight:bold">문의내역</a></span>
		</div>
		<div class ="page-content02">
		<c:if test="${count == 0}">
		<div class="no-wish">문의 내역이 없습니다.</div>
		</c:if>
		<c:if test="${count > 0}">
		<ul class="qnalist-ul">
		<!-- 전체 선택 체크박스 -->
		<li id="qnacb">
			<span style="float:left;"><input type="checkbox" id="selectall" name="selectall" value="전체 선택"  onclick="selectAll(this)"></span>
			<span style="float:right; margin-top:1px;">전체 선택&nbsp;&nbsp;|<input type="button" value="삭제" id="qnadelete_btn">
			</span>
		</li>
		<!-- 전체 선택 체크박스 끝 -->
			<c:forEach var="qna" items="${list}">
			<li class="qnalist-list">
				<div class="box-parent">
					<input type="hidden" value="${qna.q_category}">
					<%-- <input type="hidden" value="${qna.mem_num}"> --%>
					<!-- 선택 체크박스 -->
					<div class="qnacheck-box">
						<input type="checkbox" class="select-qna" name="select_qna" 
						 onclick="checkSelectAll()" data-cartnum="${qna.q_num}" value="${qna.q_num}">
					</div>
					<!-- 선택 체크박스 끝 -->
					<div class="qnalist-image01">
						<img id="qnalist-image02" src="imageView.do?q_num=${qna.q_num}" onerror="this.src='../images/faq/backcolor.png'" onclick="location.href='detail.do?q_num=${qna.q_num}'">
					</div>
					<div class="qnalist-span01">
						<div class="box-title"><a href="detail.do?q_num=${qna.q_num}">${qna.q_title}</a></div><br>
						<div class="box-content">
						<img src="../images/faq/reply00.png" width="15px" height="15px" style="margin-right:4px; margin-bottom:-2px">
						<c:choose>
				        <c:when test="${fn:length(qna.q_content) gt 45}">
				        <c:out value="${fn:substring(qna.q_content, 0, 44)}">
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
						(${qna.com_cnt})
						</span>
					</div>
				</div>
			</li>
			</c:forEach>
		</ul>
		</c:if>
		<div class="qnalistspanbottom">
		<span>*1:1문의 등록은 고객센터 우측 말풍선 아이콘 누르시면 됩니다.</span><br>
		</div>
		<div class="page align-center" style="margin-left:5%;">${page}</div>
		</div>
	</div>
	<!-- 문의 내역 폼 끝 -->
	</form>
</div>
<!-- 내가 쓴 글 subbar.js -->
<!-- <script>
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
</script> -->
<!-- 내용 끝 -->