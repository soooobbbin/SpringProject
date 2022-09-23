<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/member.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<div class="page-main" style="height: 775px;">
<div class="menu">
	<div class="mypage-menu">
	<h2>My Page</h2>
	<div class="user">
		<img src="${pageContext.request.contextPath}/images/user.png">
		<p>${member.mem_name}</p>
		<p>${member.id}</p>
	</div>
	<a href="#" id="all"><h3>전체 주문 내역</h3></a>
	<a href="${pageContext.request.contextPath}/cart/wishList.do" id="all">
	<h3>나의 관심</h3></a>
	<h3>내가 쓴 글</h3>
	<a href="${pageContext.request.contextPath}/faq/qnalist.do"><p>- 문의/답변</p></a><br>
	<a href="${pageContext.request.contextPath}/product/reviewMypage.do"><p>- 상품평</p></a>
	</div>
</div>
	<div class="mypage-content" >
		<div style="padding-left: 80px;padding-top:20px;font-size:15pt;">
			<h2>${member.mem_name}님 회원상세정보</h2>
		</div>
		<hr width="80%" noshade="noshade" size="1px">
		<div class ="page-content"style="height: 420px;">
			<div class="page-content01" style="width: 25%; float:left; padding-left: 5%;">
				<ul>
					<li>이름</li><br>
					<li>전화번호</li><br>
					<li>이메일</li><br>
					<li>가입날짜</li><br>
					<c:if test="${!empty member.modify_date}">
					<li>정보 수정일</li><br>
					</c:if>
					<li>우편번호</li><br>
					<li>주소</li><br>
					<li>상세주소</li><br>
				</ul>
			</div>
			<div class ="page-content02" style="width: 65%; float:left;">
				<ul>
					<li>${member.mem_name}</li><br>
					<c:if test="${!empty member.mem_cell}"><li>${member.mem_cell}</li><br></c:if>
					<c:if test="${empty member.mem_cell}"><li style="color : gray;">전화번호를 등록해주세요.</li><br></c:if>
					<li>${member.mem_email}</li><br>
					<li>${member.reg_date}</li><br>
					<c:if test="${!empty member.modify_date}">
					<li>${member.modify_date}</li><br>
					</c:if>
					<c:if test="${!empty member.zipcode}"><li>${member.zipcode} <b style="color:blue;">[대표배송지]</b></li><br></c:if>
					<c:if test="${empty member.zipcode}"><li style="color : gray;">우편번호를 등록해주세요.</li><br></c:if>
					<c:if test="${!empty member.address1}"><li>${member.address1}</li><br></c:if>
					<c:if test="${empty member.address1}"><li style="color : gray;">주소를 등록해주세요.</li><br></c:if>
					<c:if test="${!empty member.address2}"><li>${member.address2}</li><br></c:if>
					<c:if test="${empty member.address2}"><li style="color : gray;">상세주소를 등록해주세요.</li><br></c:if>
				</ul>
			</div>
		</div>
		<div class="align-right">
			<input type="button" value="회원정보수정" id="btnmodify" onclick="location.href='update.do'">
			<input type="button" value="비밀번호변경" id="btnupdate" onclick="location.href='updatepw.do'">
			<input type="button" value="회원탈퇴" id="btndelete" onclick="location.href='delete.do'">
			
		</div>
	</div>
</div>
<!-- 내용 끝 -->
<script>
//script.js
$(document).ready(function(){	
	//menu v2
	$(".menu-v2").mouseover(function(){
		$(this).children(".submenu").show(400);
	});
	$(".menu-v2").mouseleave(function(){
		$(this).children(".submenu").hide(200);
	});
	
});
</script>


