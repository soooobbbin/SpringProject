<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/community.js"></script>

<div class="page-main">

	<div class="align-center">
		<h2 onclick="location.href='list.do'">Community</h2>
	</div>
	
	<div class="community-list-header">
			<ul class="community-category-ul" id="c_category" name="c_category">
				<li><input type="button" value="TIP" onclick="location.href='/community/list.do?c_category=tip'"></li>
				<li><input type="button" value="함께해요"  onclick="location.href='/community/list.do?c_category=함께해요'"></li>
				<li><input type="button" value="친환경 소식"  onclick="location.href='/community/list.do?c_category=친환경소식'"></li>
			</ul>
		
			
			<div class="align-right">
				<select name="keyfield" id="keyfield">
					<option value="1" <c:if test="${param.keyfield == 1}">selected</c:if>>제목</option>
					<option value="2" <c:if test="${param.keyfield == 2}">selected</c:if>>작성자 ID</option>
					<option value="3" <c:if test="${param.keyfield == 3}">selected</c:if>>내용</option>
					<option value="4" <c:if test="${param.keyfield == 4}">selected</c:if>>제목+내용</option>
				</select>
				<input type="search" name="keyword" id="keyword"
				               value="${param.keyword}">
			<input type="submit" value="찾기">
			</div>
	
		<!-- 글쓰기 버튼 -->
		<c:if test="${!empty user}">
	
		<input type="button" value="글쓰기"
		          onclick="location.href='write.do'">
			</c:if>
		
	</div>
	
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
					<td><img class="community-img" src="imageView.do?c_num=${community.c_num}&c_category=${community.c_category}" style="max-width:200px;">
					
					<!-- <img class="community-img"
								style="width: 200px; height: 250px;: "
								src="${pageContext.request.contextPath}/image_upload/${community.c_filename}"> -->
					
					</td>
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