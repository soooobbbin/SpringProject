<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 자바 스크립트 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/product.js"></script>

<!-- css 삽입 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">

<!-- 내용 시작 -->
<jsp:include page="/WEB-INF/views/admin/sub_menu.jsp">
	<jsp:param name="mem_name" value="${admin.mem_name}" />
</jsp:include>

<div class="main-content">
	<div class="sub-title">
		<span class="sub_1">전체상품</span>
		<span class="sub_2">관리 메뉴에서 <span style="font-weight:bold; color:red">상품 등록/수정</span>이 가능합니다.</span>
	</div>

	<div class="search">
		<form id="search_form" action="admin_plist.do" method="get">
			<select name="keyfield">
				<option value="1" <c:if test="${param.keyfield==1}">selected</c:if>>카테고리</option>
				<option value="2" <c:if test="${param.keyfield==2}">selected</c:if>>상품명</option>
				<option value="3" <c:if test="${param.keyfield==3}">selected</c:if>>브랜드</option>
			</select>
			<input type="search" size="16" name="keyword" id="keyword" value="${param.keyword}">
			<input type="submit" value="검색">
		</form>
	</div>
	
	<div class="action-btn-2">
		<input type="button" value="등록" onclick="location.href='admin_write.do'">
		<input type="button" value="목록" onclick="location.href='admin_plist.do'">
	</div>
	
	<div class="content-list">
		<!-- 검색 결과가 0개일 경우 -->
		<c:if test="${count == 0}">
			<div class="search-result">표시할 상품이 없습니다.</div>
		</c:if>
		
		<!-- 검색 결과가 1개 이상일 경우 -->
		<c:if test="${count > 0}">
			<table>
				<tr>
					<th>번호</th>
					<th>카테고리</th>
					<th>브랜드</th>
					<th>상품명</th>
					<th>가격</th>
					<th>재고수</th>
					<th>등록일</th>
					<th>상태</th>
				</tr>

				<c:forEach var="product" items="${list}">
					<tr onclick="location.href='admin_pdetail.do?p_num=${product.p_num}'">
						<td>${product.p_num}</td>
						<td>
							<c:if test="${product.p_category == 1}">Living</c:if> 
							<c:if test="${product.p_category == 2}">Beauty</c:if> 
							<c:if test="${product.p_category == 3}">Fashion</c:if>
						</td>
						<td>${product.p_brand}</td>
						<td>${product.p_name}</td>
						<td><fmt:formatNumber value="${product.p_price}" /></td>
						<td><fmt:formatNumber value="${product.p_quantity}" /></td>
						<td>${product.reg_date}</td>
						<td>
							<c:if test="${product.p_status == 1}">표시</c:if>
							<c:if test="${product.p_status == 2}">미표시</c:if>
						</td>
					</tr>
				</c:forEach>
			</table>
			<div class="page-num">< ${page} ></div>
		</c:if>
	</div>
</div>
<!-- 내용 끝 -->