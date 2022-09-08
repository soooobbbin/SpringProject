<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 내용 시작 -->
<!-- Accordion -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/faq.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/faq.js"></script><br><br>
<span class="faq_main"><a href="/main/main.do">홈</a>><a href="/faq/faqlist.do">자주찾는질문</a></span>
<h2 align="center" class="faqh2"><img id="faq_main_img01" src="../images/faq/support.png">고객센터</h2>
<c:if test="${user.auth == 1}">
<div class="faq_main_qna02" align="right">
<figure id="faq_main_qna">
	<img id="faq_main_img02" src="../images/faq/messenger.png" onclick="location.href='qnawrite.do'">
	<figcaption>1:1문의</figcaption>
</figure>
</div>
</c:if>
 <c:if test="${empty user || user.auth == 2}">
 <br>
 <br>
 <br> 
 </c:if>
<div class="faq_main">
	<form action="faqlist.do" id="search_form">
		<div class="faq-form-inline">
			<ul class="faq-category-ul" id="category" name="category">
				<li>
				<input class="faqbtn00" type="button" value="전체" onclick="location.href='/faq/faqlist.do?category=0'">|
				<input class="faqbtn01" type="button" value="회원" onclick="location.href='/faq/faqlist.do?category=1'">|
				<input class="faqbtn02" type="button" value="상품/배송"  onclick="location.href='/faq/faqlist.do?category=2'">|
				<input class="faqbtn03" type="button" value="기타"  onclick="location.href='/faq/faqlist.do?category=3'">
				</li>
			</ul>
		</div>
	</form><br>
	<c:if test="${user.auth == 2}">
	<div class="align-right">
		<input id="faq_btn01" type="button" value="글등록" onclick="location.href='faqwrite.do'">
	</div>
	</c:if>
	<br>
	<c:if test="${count == 0}">
		<div class="community-result-display">표시할 게시물이 없습니다.</div>	
	</c:if>
		
		<c:if test="${count > 0}">
	<!-- Example Code -->
	<div class="accordion accordion-flush" id="accordionFlushExample">
	  <c:forEach var="faq" items="${list}" varStatus="status">
	  <div class="accordion-item">
	    <h2 class="accordion-header" id="flush-heading${status.index}" >
	      <button id="title_btn01" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse${status.index}" aria-expanded="false" aria-controls="flush-collapse${status.index}">
	      <span id="title_btn02">문 의</span>${faq.f_title}
	      </button>
	    </h2>
	    <div style="background:#f4f9f2; border-bottom:1px solid #7c8f83;" id="flush-collapse${status.index}" class="accordion-collapse collapse" aria-labelledby="flush-heading${status.index}" data-bs-parent="#accordionFlushExample">
	      <div class="accordion-body">${faq.f_content}</div>
	      <c:if test="${user.auth == 2}">
	      <div class="faq_btn_group" align="right">
	      <input type="button" value="수정" onclick="location.href='faqupdate.do?f_num=${faq.f_num}'">
		  <input type="button" value="삭제" id="delete_btn${status.index}">
		  <script type="text/javascript">
			let delete_btn${status.index} = document.getElementById('delete_btn${status.index}');
			//이벤트 연결
			delete_btn${status.index}.onclick=function(){
				let choice = confirm('삭제하시겠습니까?');
				if(choice){
					location.replace('delete.do?f_num=${faq.f_num}');
				}
			};
			</script> 
	      </div>
	      </c:if>
	    </div>
	  </div>
	  </c:forEach>
	</div>
	</c:if>
    <!-- End Example Code -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<%-- 		<c:if test="${!empty user}">
		<div class="align-right">
			<input id="faq_btn01" type="button" value="글등록" onclick="location.href='faqwrite.do'">
		</div>
		</c:if>
	<table id="faq_list_table">
		<c:forEach var="faq" items="${list}">
		<tr style="border-bottom:2px solid #7c8f83;">
			<th width="16%">Q</th>
			<td width="72%" height="40px" style="font-weight:bold">${faq.f_title}</td>
			<td width="10%" align="right"><img class="faq-arrow" src="../images/faq/arrow.png"><img class="faq-arrow2" src="../images/faq/arrow2.png"></td>
		</tr>
		<tr class="faq-arrow-show" style="border-bottom:1px solid #7c8f83;">
			<th width="16%"></th>
			<td width="72%" height="100px">${faq.f_content}</td>
			<td width="10%" align="right">
			<input class="faq_btn02" type="button" value="수정" onclick="location.href='faqupdate.do?board_num=${board.board_num}'">
			<input class="faq_btn02" type="button" value="삭제" id="delete_btn">
			</td>
		</tr>
		</c:forEach>
	</table> --%>
</div>
<!-- 내용 끝 -->



