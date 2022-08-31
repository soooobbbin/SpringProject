<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 내용 시작 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/faq.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/faq.js"></script>
<div class="faq_main">
	<figure id="faq_main_qna">
	<img id="faq_main_img02" src="../images/faq/messenger.png" onclick="">
	<figcaption>1:1문의</figcaption>
	</figure>
	<h2 onclick="location.href='faqlist.do'"><img id="faq_main_img01" src="../images/faq/questionimg.png">자주묻는질문</h2>
	<form:form action="faqlist.do" id="search_form">
		<div class="faq-form-inline">
			<span id="faqspan1">회원문의</span>
			<span id="faqspan2">상품/배송문의</span>
			<span id="faqspan3">기타</span>
		</div>
		<div class="align-right">
			<input id="faq_btn01" type="button" value="글등록" onclick="location.href='faqwrite.do'">
		</div>
	</form:form>
	<table id="faq_list_table">
		<tr style="border-bottom:2px solid #7c8f83;">
			<th width="16%">Q</th>
			<td width="72%" height="40px" style="font-weight:bold">제목....</td>
			<td width="10%" align="right"><img id="faq-arrow" src="../images/faq/arrow.png"><img id="faq-arrow2" src="../images/faq/arrow2.png"></td>
		</tr>
		<tr id="faq-arrow-show" style="border-bottom:1px solid #7c8f83;">
			<th width="16%"></th>
			<td width="72%" height="100px">내용....</td>
			<td width="10%" align="right">
			<input class="faq_btn02" type="button" value="수정" onclick="location.href='faqupdate.do?board_num=${board.board_num}'">
			<input class="faq_btn02" type="button" value="삭제" id="delete_btn">
			</td>
		</tr>
	</table>
</div>
<!-- 내용 끝 -->



