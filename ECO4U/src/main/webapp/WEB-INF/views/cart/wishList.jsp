<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/cart.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/wishList.css">
<div class="page-main">
	<h2>관심 상품</h2>
	<!-- 찜 목록에 상품이 담기지 않은 경우 -->
	<c:if test="${count == 0}">
	관심 상품이 없습니다.
	</c:if>
	
	<!-- 찜 목록에 상품이 담긴 경우 -->
	<table class="wish-category">
		<tr>
		<td>전체</td>
		<td>패션</td>
		<td>뷰티</td>
		<td>리빙</td>
		</tr>
	</table>
	
	<div class="wish-choice">
		<input type="checkbox" name="cart" value="전체 선택">전체 선택
		| 선택 삭제
	</div>
	<c:forEach var="wish" items="${list}">
	<div class="content-main">
		찜번호 : ${wish.w_num}
	</div>
	</c:forEach>
	
</div>
<!-- 내용 끝 -->