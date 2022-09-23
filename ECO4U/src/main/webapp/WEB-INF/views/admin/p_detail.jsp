<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 자바스크립트 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.number.min.js"></script>

<!-- css 삽입 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">

<!-- 내용 시작 -->
<div class="sub_menu">
	<jsp:include page="/WEB-INF/views/admin/sub_menu.jsp">
		<jsp:param name="mem_name" value="${admin.mem_name}"/>
	</jsp:include>
</div>

<div class="page-main">
	<ul>
		<li><a href="admin_plist.do">전체상품 조회</a>
		<li><a href="admin_write.do">상품등록</a>
	</ul>
	
	<div class="align-right">
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
	
	<div class="product-image">
		<img src="${pageContext.request.contextPath}/product/imageView.do?p_num=${product.p_num}" width="400" height="400">
	</div>
	
	<div class="product-detail">
		<ul>
			<li><label>제품번호</label>${product.p_num}</li>
			<li>
				<label>카테고리</label>
				<c:if test="${product.p_category==1}">Living</c:if>
				<c:if test="${product.p_category==2}">Beauty</c:if>
				<c:if test="${product.p_category==3}">Fashion</c:if>
			</li>
			<li><label>브랜드</label>${product.p_brand}</li>
			<li><label>상품명</label>${product.p_name}</li>
			<li><label>상태</label>${product.p_status}</li>
			<li><label>가격</label>${product.p_price}</li>
			<li><label>배송비</label>${product.p_dprice}</li>
			<li><label>재고</label>${product.p_quantity}</li>
			<li><label>특징</label>${product.p_cont1}</li>
			<li><label>상세설명</label>${product.p_cont2}</li>
			<li><label>등록일자</label>${product.reg_date}</li>
			<li><label>수정일자</label>${product.modify_date}</li>
		</ul>
	</div>
</div>

<!-- 내용 끝 -->