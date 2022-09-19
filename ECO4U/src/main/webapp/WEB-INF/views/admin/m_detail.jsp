<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- 내용 시작 -->
<div class="page-main">
<h2>회원 정보 상세</h2>
<div style="width:700px; border:1px solid;">
	<div class="align-right">
		<input type="button" name="modify" value="수정" onclick="location.href='admin_modify.do?mem_num=${memberVO.mem_num}'">
		<input type="button" name="list" value="목록" onclick="location.href='admin_list.do'">
	</div>
	<ul>
		<li><b>등급</b> 
			<c:if test="${memberVO.auth==0}">탈퇴</c:if>
			<c:if test="${memberVO.auth==1}">일반</c:if>
			<c:if test="${memberVO.auth==2}">관리자</c:if>
		</li>
		<li><b>이름</b> ${memberVO.mem_name}</li>
		<li><b>아이디</b> ${memberVO.id}</li>
		<li><b>전화번호</b> ${memberVO.mem_cell}</li>
		<li><b>이메일</b> ${memberVO.mem_email}</li>
		<li><b>가입일</b> ${memberVO.reg_date}</li>
	</ul>
</div>

</div>

<!-- 내용 끝 -->