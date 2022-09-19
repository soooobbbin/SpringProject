<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				</div>
			</div>
		</div>
		<div class="order-main-list">
			<div class="list-content">
			</div>
		</div>
	</div>
</div>
<script>
var target = document.querySelectorAll('.zipcodebtn');
var btnPopClose = document.querySelectorAll('.pop_wrap .btn_close');
var targetID;

// 팝업 열기
for(var i = 0; i < target.length; i++){
  target[i].addEventListener('click', function(){
    targetID = this.getAttribute('href');
    document.querySelector(targetID).style.display = 'block';
  });
}

// 팝업 닫기
for(var j = 0; j < target.length; j++){
  btnPopClose[j].addEventListener('click', function(){
    this.parentNode.parentNode.style.display = 'none';
  });
}
</script>
<!-- 내용 끝 -->