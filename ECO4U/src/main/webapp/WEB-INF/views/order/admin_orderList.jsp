<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/order.list.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/order-list.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<!-- 좌측 메뉴바 -->
	<jsp:include page="/WEB-INF/views/admin/sub_menu.jsp">
		<jsp:param name="mem_name" value="${admin.mem_name}"/>
	</jsp:include>
	<!-- 좌측 메뉴바 종료 -->
<div class="main-content">
	<div class="sub-title">
		<span class="sub_1">주문 목록</span>
		<span class="sub_2">관리 메뉴에서 <span style="font-weight:bold; color:red">회원등급 수정</span>이 가능합니다.</span>
	</div>
	
	<div class="search">
	<form id="search_form" action="admin_orderList.do" method="get">
			<select name="keyfield" id="keyfield">
				<option value="1" <c:if test="${param.keyfield==1}">selected</c:if>>주문번호</option>
				<option value="2" <c:if test="${param.keyfield==2}">selected</c:if>>ID</option>
				<option value="3" <c:if test="${param.keyfield==3}">selected</c:if>>상품명</option>
			</select>
			<input type="search" size="16" name="keyword" id="keyword" value="${param.keyword}">
			<input type="submit" value="검색">
			<input type="button" value="목록" onclick="location.href='admin_orderList.do'">
	</form>
	</div>
	
	<div class ="content-list">
	<c:if test="${count == 0}">
	<div class="search-result">표시할 주문내역이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
	<table>
		<tr>
			<th>주문 번호</th>
			<th>구매자 ID</th>
			<th>상품명</th>
			<th>총 구매 금액</th>
			<th>주문 날짜</th>
			<th>배송 상태</th>
		</tr>
		<c:forEach var="order" items="${list}">
		<tr>
			<td>${order.o_num}</td>
			<td>${order.id}</td>
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