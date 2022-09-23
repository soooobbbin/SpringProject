<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- css 삽입 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<!-- 서브메뉴 시작 -->
<div class="sub-menu">
	<div class="sub-detail">
		<div class="user2" 	style="margin-top: 42%; margin-bottom: 30%; margin-left: 24%;">
			<img src="${pageContext.request.contextPath}/images/faq/management3.png"
				style="margin-left: -20%; margin-bottom: 2%; width: 74%; height: 72%;">
			<h2 style="color:gray;">${param.mem_name}</h2>
		</div>
		
		<div style="margin-left: 23%; margin-top: -5%;">
			<h2 style="margin-left: -13%; margin-bottom: 5%;">회원관리</h2>
			<p><a href="${pageContext.request.contextPath}/admin/admin_list.do" style="color: darkgray;">- 전체회원</a></p>
			<p><a href="${pageContext.request.contextPath}/admin/delete_list.do" style="color: darkgray;">- 탈퇴/정지회원</a></p>
			
			<h2 style="margin-left: -13%; margin-bottom: 5%;">상품관리</h2>
			<p><a href="${pageContext.request.contextPath}/product/admin_plist.do" style="color: darkgray;">- 전체상품</a></p>			
			<p><a href="${pageContext.request.contextPath}/product/admin_write.do" style="color: darkgray;">- 상품등록</a></p>
			
			<h2 style="margin-left: -13%; margin-bottom: 5%;">
				<a href="${pageContext.request.contextPath}/faq/qnamanagementlist.do">문의관리</a>
			</h2>
			
			<h2 style="margin-left: -13%; margin-bottom: 5%;">
				<a href="#">주문관리</a>
			</h2>		
	</div>
</div>
</div>
<!-- 서브메뉴 끝 -->