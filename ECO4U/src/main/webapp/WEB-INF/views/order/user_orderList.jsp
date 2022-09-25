<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/order.list.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/order-list.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<div class="page-main" style="height: 775px;">
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
	<p><a href="${pageContext.request.contextPath}/product/listReview.do" style="color:darkgray;">- 상품평</a></p>
	</div>
	</div>
	<!-- 좌측 메뉴바 종료 -->
	<div class="orderList">
	<div style="padding-left: 80px;padding-top:20px;font-size:12pt;">
			<h2>주문 목록</h2>
	</div>
	<form id="search_form" action="orderList.do" method="get">
		<ul class="search">
			<li>
				<select name="keyfield" id="keyfield">
					<option value="1" <c:if test="${param.keyfield==1}">selected</c:if>>주문번호</option>
					<option value="2" <c:if test="${param.keyfield==2}">selected</c:if>>상품명</option>
				</select>
			</li>
			<li>
				<input type="search" size="16" name="keyword" id="keyword" value="${param.keyword}">
			</li>
			<li>
				<input type="submit" value="검색">
			</li>
		</ul>
	</form>
	<div class ="page-content" style="height: 420px;">
	<div class="align-right" style="clear:both;margin-bottom:20px;">
		<input type="button" value="목록" onclick="location.href='orderList.do'">
		<input type="button" value="홈으로" 
			onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
	</div>
	<c:if test="${count == 0}">
	<div class="result-display">표시할 주문내역이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
	<table>
		<tr>
			<th>주문 번호</th>
			<th>상품명</th>
			<th>총 구매 금액</th>
			<th>주문 날짜</th>
			<th>배송 상태</th>
		</tr>
		<c:forEach var="order" items="${list}">
		<tr>
			<td>${order.o_num}</td>
			<td><a href="orderModify.do?o_num=${order.o_num}">${order.o_name}</a></td>
			<td class="align-center"><fmt:formatNumber value="${order.o_total}"/></td>
			<td class="align-center">${order.reg_date}</td>
			<td class="align-center">
				<c:if test="${order.status == 1}">배송 대기</c:if>
				<c:if test="${order.status == 2}">배송 준비 중</c:if>
				<c:if test="${order.status == 3}">배송 중</c:if>
				<c:if test="${order.status == 4}">배송 완료</c:if>
				<c:if test="${order.status == 5}">주문 취소</c:if>
			</td>
		</tr>
		</c:forEach>
	</table>
	<div class="align-center">
		${page}
	</div>
	</c:if>
	</div>
</div>
</div>
<!-- 내용 끝 -->