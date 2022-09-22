<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/order.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/order.css">
<!-- 내용 시작 -->
<div class="page-main">
	<div class="header">
		<div class="header-left">
			주문결제
		</div>
		<div class="header-right">
			장바구니><b>주문결제</b>>주문완료
		</div>
	</div>
	<div class="order-main">
		<div class="order-main-left">
			<div class="order-zipcode">
				<div class="order-zipcode-content">
					<div class="zip-content1">
					 <img src="${pageContext.request.contextPath}/images/placeholder.png"> 배송지</div>
					<div class="zip-content2"><input type="button" value="배송지 변경" id="zipcodebtn" class="zipcodebtn" href="#pop_info_1">
					<!-- 파업창 시작 -->
						<div id="pop_info_1" class="pop_wrap">
				          <div class="pop_inner">
				          	<div class="pop_content">
				          		<div class="pop_content_title" style="padding-left:2%;"><h3>배송지 주소록</h3></div>
				          		<c:forEach var="zip" items="${zip_list}">
									<div class="pop_content1">
										${zip.zip_name} [${zip.zip_rec}] ${zip.zip_cell}<br>
										${zip.zipcode}<br>
										${zip.address1} ${zip.address2}
										<hr size="1px" noshade="noshade" width="100%">
									</div>
									<div class="pop_content2">
										<input type="button" value="배송지 내용 수정" id="btn-modify" onclick="location.href='/cart/zipcodeUpdate.do?zip_num=${zip.zip_num}'">
										<input type="button" value="대표 배송지 선택" id="btn-check" onclick="location.href='/cart/updateauth.do?zip_num=${zip.zip_num}'">
									</div>
							 	</c:forEach>
							 </div>
							<div class="align-center">${page}</div>
				            <input type="button" value="배송지 추가" id="btn-add" onclick="location.href='zipcodeInsert.do'">
				            <button type="button" class="btn_close">닫기</button>
				         </div>
				       </div>
				       <!-- 파업창 끝 -->
					</div>
					<div class="zip-content3">
						${zipcode.zip_rec} ${zipcode.zip_cell}<br>
						${zipcode.address1} ${zipcode.address2}<br>
						<form:form id="notice_form" action="notice.do" modelAttribute="orderVO" style="border:none; width:100%; margin-left:-38px; margin-top:20px">
							<form:input path="notice" placeholder="배송시 요청사항을 입력해주세요." style="width:85%; height:70px; float:left; font-size:15px; border-radius:5px; border:1px solid gray; padding-left: 0.75rem;"/>
							<form:button id="sub_btn" style="width:10%; height:75px; float:right; border-radius:5px; border:1px solid gray; cursor:pointer;">></form:button>
						</form:form>
					</div>
				</div>
			</div>
			<div class="order-kind">
				<div class="order-kind-content">
					<button id="apibtn">카카오페이</button>
					<h2>결제 수단</h2>
					<hr color="gray" width="98%" size="1">
					<form id="payment_form" action="payment.do" method="post" >
					<ul>
						<li>
							<input type="radio" name="payment" id="payment1" value="1">통장입금
							<input type="radio" name="payment" id="apibtn" value="2">카카오페이
						</li>
					</ul>
					</form>
				</div>
			</div>
		</div>
		<div class="order-main-list">
			<div class="list-content">
				<ul class="cart-list-ul">
				<h2>주문상품 ${pcount}개</h2>
				<hr color="gray" width="95%" size="1">
				<c:forEach var="cart" items="${cartList}">
				<div class="content-main">
				<li class="cart-list-li">
					<div class="box-parent">
						<input type="hidden" value="${cart.productVO.p_category}">
						<input type="hidden" value="${cart.mem_num}">
						<input type="hidden" value="${cart.cart_num}">
						<input type="hidden" value="${cart.p_num}">
						<input type="hidden" value="${cart.productVO.p_status}">
						<input type="hidden" value="${cart_num}">
						<input type="hidden" value="${pcount}" id="pcount">
						<input type="hidden" value="${cart.productVO.p_name}" id="p_name">
						<input type="hidden" value="${all_total}" id="all_total">
						
						<div class="div1">
							<div class="box-brand">[${cart.productVO.p_brand}]</div>
						</div>
						
						<div class="div2-parent">
							<div class="div2">
								<div class="product-image">
								<a href="${pageContext.request.contextPath}/product/detail.do?p_num=${cart.p_num}">
									<img src="../images/product/${cart.productVO.p_photoname}" width="80" height="80">
								</a>
								</div>
								<div class="product-box">
									<a href="${pageContext.request.contextPath}/product/detail.do?p_num=${cart.p_num}">
									<span class="box-title">${cart.productVO.p_name}</span><br>
									</a><br>
									<span class="box-price"><strong><fmt:formatNumber value="${cart.productVO.p_price}"/>원</strong>
														/ <c:if test="${cart.order_quantity!=0}">${cart.order_quantity}개</c:if>  
														  <c:if test="${cart.order_quantity==0}">${order_quantity}개</c:if>
									</span>
								</div>
							</div>
	                    </div>
	                    
						<div class="div3">
							<div class="cart-bottom-price">
								<span style="color:dimgray;">배송비</span><br>
								<c:if test="${cart.cart_total >= 30000}">
								<div class="price-span">무료배송</div>
								</c:if>
								<c:if test="${cart.cart_total < 30000}">
								<div class="price-span"><fmt:formatNumber value="${cart.productVO.p_dprice}"/>원</div>
								</c:if>
							</div>
						</div>
					</div>
				</li>
				</div>
			
				</c:forEach>
			</ul>
			<br>
				<hr color="gray" width="95%" size="1">
				<div class="content2">
				<div class="order-info">
					<table class="order-info-table">
						<tr>
							<td>상품금액</td>
							<td class="td-right"><fmt:formatNumber value="${all_total}"/>원</td>
						</tr>
						<tr>
							<td>할인금액</td>
							<td class="td-right td-discount">-0원</td>
						</tr>
						<tr>
							<td>배송비</td>
							<c:if test="${all_total >= 30000}">
							<td class="td-right">0원</td>
							</c:if>
							<c:if test="${all_total < 30000}">
							<td class="td-right"><fmt:formatNumber value="2500"/>원</td>
							</c:if>
						</tr>
					</table>
					<hr color="black" width="95%" size="1">
					<div class="order-total">
						<table class="order-info-table">
							<tr>
								<td class="order-bottom">총 결제금액</td>
								<c:if test="${all_total >= 30000}">
								<td class="order-bottom-total"><fmt:formatNumber value="${all_total}"/>원</td>
								</c:if>
								<c:if test="${all_total < 30000}">
								<td class="order-bottom-total"><fmt:formatNumber value="${all_total + 2500}"/>원</td>
								</c:if>
								
							</tr>
						</table>
					</div>
				</div>
		
				<div class="cart-order">
				<input type="button" value="결제하기" onclick="location.href='#'"
					class="order-btn">
				</div>
				</div>
		
			</div>
		</div>
	</div>
</div>
<!-- 내용 끝 -->