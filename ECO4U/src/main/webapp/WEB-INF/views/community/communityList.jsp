<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/community.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/videoAdapter.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/community.css">
<!-- 내용 시작 -->
<div class="page-main">
	<div class="align-center">
		<h2 onclick="location.href='list.do?c_category=1'">Community</h2>
	</div>
	<div class="community-list-header">
		<ul class="community-category-ul" id="c_category">
			<li class="tip1"><a href="list.do?c_category=1">TIP</a></li>
			<li class="tip2"><a href="list.do?c_category=2">함께해요</a></li>
			<li class="tip3"><a href="list.do?c_category=3">친환경 소식</a></li>
		</ul>
	</div>
	<form action="list.do" id="search_form" method="get">
		<ul class="search">
			<li>
			<select name="keyfield" id="keyfield">
				<option value="1" <c:if test="${param.keyfield == 1}">selected</c:if>>제목</option>
				<option value="2" <c:if test="${param.keyfield == 2}">selected</c:if>>작성자 ID</option>
				<option value="3" <c:if test="${param.keyfield == 3}">selected</c:if>>내용</option>
				<option value="4" <c:if test="${param.keyfield == 4}">selected</c:if>>제목+내용</option>
			</select>
			</li>
			<li>
				<input type="search" name="keyword" id="keyword" value="${param.keyword}">
			</li>
			<li>
				<input type="submit" value="찾기">
			</li>
		</ul>
		<!-- 글쓰기 버튼 -->
		<c:if test="${!empty user}">
			<input type="button" id="writeBtn" value="글쓰기" onclick="location.href='write.do'">
		</c:if>
	</form>
	<!-- 목록 내용 -->
	<div class="content">
	<div class="community-list-sort">
		<a href="#" class="dropdown-toggle" data-toggle="dropdown"> 정렬 <!-- 아래 화살표 -->
					<span class="caret"></span>
		</a>
		<ul class="dropdown-menu">
			<li><a class="dropdown-item"
				href="/community/list.do?c_category=${c_category}&sort=hits">조회수순</a></li>
			<li><a class="dropdown-item"
				href="/community/list.do?c_category=${c_category}&sort=likes">추천순</a></li>
			<li><a class="dropdown-item"
				href="/community/list.do?c_category=${c_category}&sort=comments">댓글순</a></li>
		</ul>
	</div>
	<!-- 게시글 목록 -->
	<c:if test="${count == 0}">
		<div class="community-result-display">표시할 게시물이 없습니다.</div>	
	</c:if>
	<c:if test="${count > 0}">
	<table>			
		<c:forEach var="community" items="${list}">
			<tr>
				<td>${community.id}	· ${community.reg_date}</td>
				<td><img src="${community.c_content}"></td>
			</tr>
			<tr>
				<td>
				<a href="detail.do?c_num=${community.c_num}">${community.c_title}</a> </td>
			</tr>
			<tr>
				<td>${community.c_hit}</td>
			</tr>
		</c:forEach>
	</table>
	<div class="align-center">${page}</div>
	</c:if>	
	</div>
</div>
<!-- 내용 끝 -->