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
		<span class="sub_1">배송 상태 수정</span>
	</div>
		
	<div class ="content-list">
	<form action="admin_modify.do" method="post" id="order_modify">
		<input type="hidden" name="o_num" value="${order.o_num}">
		<ul>
			<%-- <c:if test="${order.status == 1}">
			<li>
				<label for="receive_name">수령인</label>
				<input type="text" name="receive_name" id="receive_name" value="${order.receive_name}" maxlength="10">
			</li>
			<li>
				<label for="zipcode">우편번호</label>
				<input type="text" name="receive_post" id="zipcode" value="${order.receive_post}" maxlength="5">
				<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
			</li>
			<li>
				<label for="address1">주소</label>
				<input type="text" name="receive_address1" id="address1" value="${order.receive_address1}" maxlength="30">
			</li>
			<li>
				<label for="address2">상세주소</label>
				<input type="text" name="receive_address2" id="address2" value="${order.receive_address2}" maxlength="30">
			</li>
			<li>
				<label for="receive_phone">전화번호</label>
				<input type="text" name="receive_phone" id="receive_phone" value="${order.receive_phone}" maxlength="15">
			</li>
			<li>
				<label for="notice">남기실 말씀</label>
				<input type="text" name="notice" id="notice" value="${order.notice}" maxlength="300">
			</li>
			</c:if>
			<c:if test="${order.status >=2}">
			<li>
				<label>수령인</label>
				${order.receive_name}
			</li>
			<li>
				<label>우편번호</label>
				${order.receive_post}
			</li>
			<li>
				<label>주소</label>
				${order.receive_address1} 	${order.receive_address2}
			</li>
			<li>
				<label>전화번호</label>
				${order.receive_phone}
			</li>
			<li>
				<label>남기실 말씀</label>
				${order.notice}
			</li>
			</c:if> 
			<li>
				<label for="payment">결제수단</label><br><br>
				<c:if test="${order.payment == 1}">통장 입금</c:if>
				<c:if test="${order.payment == 2}">카드 결제</c:if>
			</li>--%>
			<li class="order-status">
				<label>배송 상태</label><br><br>
				<c:if test="${order.status != 5}">
				<input type="radio" name="status" id="status1" value="1" <c:if test="${order.status == 1}">checked</c:if>>배송 대기
				<input type="radio" name="status" id="status2" value="2" <c:if test="${order.status == 2}">checked</c:if>>배송 준비 중
				<input type="radio" name="status" id="status3" value="3" <c:if test="${order.status == 3}">checked</c:if>>배송 중
				<input type="radio" name="status" id="status4" value="4" <c:if test="${order.status == 4}">checked</c:if>>배송 완료
				</c:if>	
				<input type="radio" name="status" id="status5" value="5" <c:if test="${order.status == 5}">checked</c:if>>주문 취소
			</li>
		</ul>
		<div class="align-right btn">
			<c:if test="${order.status != 5}">
			<input type="submit" value="수정">
			</c:if>
			<input type="button" value="주문목록"  style="width:80px;" onclick="location.href='admin_orderList.do'">
		</div>
	</form>
	</div>
</div>
<!-- 내용 끝 -->