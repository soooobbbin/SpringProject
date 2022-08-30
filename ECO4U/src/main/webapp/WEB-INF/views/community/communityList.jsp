<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>

<div class="page-main">
	<h2>Community</h2>
/*
<!-- 글쓰기 버튼 -->
<c:if test="${!empty user}">
	<div class="align-right">
		<input type="button" value="글쓰기"
		          onclick="location.href='write.do'">
	</div>
</c:if>
<!-- 게시글 목록 -->
<c:if test="${count == 0}">
	<div class="result-display">표시할 게시물이 없습니다.</div>	
	</c:if>
	<c:if test="${count > 0}">
	<table>
		
		<c:forEach var="community" items="${list}">
		<tr>
			<td>${community.c_num}</td>
			<td><a href="detail.do?c_num=${community.c_num}">${community.title}</a></td>
			<td>${community.id}	</td>
			<td>${community.reg_date}</td>
			<td>${community.c_hit}</td>
		</tr>
		</c:forEach>
	</table>
	<div class="align-center">${page}</div>
	</c:if>	
</div>