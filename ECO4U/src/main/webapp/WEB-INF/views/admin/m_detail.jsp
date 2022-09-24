<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- css 삽입 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">

<!-- 내용 시작 -->
<jsp:include page="/WEB-INF/views/admin/sub_menu.jsp">
	<jsp:param name="mem_name" value="${admin.mem_name}"/>
</jsp:include>

<div class="main-content">
	<div class="sub-title">
		<span class="sub_1">회원 정보 상세</span>
	</div>
	
	<div class="mem-data">
		<div class="action-btn">
			<input type="button" name="modify" value="수정" onclick="location.href='admin_modify.do?mem_num=${memberVO.mem_num}'">
			<input type="button" name="list" value="목록" onclick="location.href='admin_list.do'">
		</div>
	
		<table>
			<tr>
				<th>등급<th>
				<td>
					<c:if test="${memberVO.auth==1}">일반</c:if>
					<c:if test="${memberVO.auth==2}">관리자</c:if>
					<c:if test="${memberVO.auth==3}">정지</c:if>
				</td>
			</tr>
			
			<tr>
				<th>이름<th>
				<td>${memberVO.mem_name}</td>
			</tr>
			
			<tr>
				<th>아이디<th>
				<td>${memberVO.id}</td>
			</tr>
				
			<tr>
				<th>전화번호<th>
				<td>${memberVO.mem_cell}</td>
			</tr>
			
			<tr>
				<th>이메일<th>
				<td>${memberVO.mem_email}</td>
			</tr>
				
			<tr>
				<th>가입일<th>
				<td>${memberVO.reg_date}</td>
			</tr>
		</table>
	</div>
</div>

<!-- 내용 끝 -->