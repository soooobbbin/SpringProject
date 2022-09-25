<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- 자바스크립트 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.number.min.js"></script>

<!-- css 삽입 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">

<!-- 내용 시작 -->
<jsp:include page="/WEB-INF/views/admin/sub_menu.jsp">
	<jsp:param name="mem_name" value="${admin.mem_name}"/>
</jsp:include>

<div class="main-content">	
	<div class="sub-title">
		<span class="sub_1">${product.p_name}</span>
	</div>
	
	<div class="action-btn-2">
		<input type="button" value="수정" onclick="location.href='admin_pmodify.do?p_num=${product.p_num}'">
		<input type="button" value="삭제" id="delete_btn">
		<script type="text/javascript">
			let delete_btn = document.getElementById('delete_btn');
			
			//삭제 이벤트 연결
			delete_btn.onclick=function(){
				let choice = confirm('삭제하시겠습니까?');
				if(choice){
					location.replace('admin_pdelete.do?p_num=${product.p_num}');
				}
			};
		</script>
		<input type="button" value="목록" onclick="location.href='admin_plist.do'">
	</div>
	
	<div class="product" style="margin-left:13%">
		<div class="product-image" style="margin:0 15px auto;">
			<img src="${pageContext.request.contextPath}/product/imageView.do?p_num=${product.p_num}" class="p_photo">
		</div>
		
		<div class="product-detail">
			<table>
				<tr>
					<th>제품번호</th>
					<td>${product.p_num}</td>
					<th>상품명</th>
					<td>${product.p_name}</td>
				</tr>
				<tr>
					<th>카테고리</th>
					<td>
						<c:if test="${product.p_category==1}">Living</c:if>
						<c:if test="${product.p_category==2}">Beauty</c:if>
						<c:if test="${product.p_category==3}">Fashion</c:if>
					</td>
					<th>브랜드</th>
					<td>${product.p_brand}</td>
				</tr>
				<tr>
					<th>상태</th>
					<td>
						<c:if test="${product.p_status==1}">표시</c:if>
						<c:if test="${product.p_status==2}">미표시</c:if>
					</td>
	
					<th>재고</th>
					<td>${product.p_quantity}</td>
				</tr>
	
				<tr>
					<th>가격</th>
					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${product.p_price}"/>원</td>
					<th>배송비</th>
					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${product.p_dprice}"/>원</td>
				</tr>
	
				<tr>
					<th colspan="4">상품특징</th>
				</tr>
				<tr>
					<td colspan="4">${product.p_cont1}</td>
				</tr>
	
				<tr>
					<th colspan="4">상품상세</th>
				</tr>
				<tr>
					<td colspan="4">
						${product.p_cont2}
					</td>
				</tr>
				
				<tr>
					<th>등록일자</th>
					<td>${product.reg_date}</td>
					<th>수정일자</th>
					<td>${product.modify_date}</td>
				</tr>
			</table>
		</div>
	</div>
</div>

<!-- 내용 끝 -->