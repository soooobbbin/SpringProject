<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- css 삽입 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">

<!-- 내용 시작 -->
<div class="sub_menu">
	<jsp:include page="/WEB-INF/views/admin/sub_menu.jsp">
		<jsp:param name="mem_name" value="${admin.mem_name}"/>
	</jsp:include>
</div>

<div class="page-main">
<h2>회원 정보 수정</h2>
<form:form modelAttribute="memberVO" action="admin_update.do" id="memMdoify_form">
	<form:hidden path="mem_num"/>
	<form:errors element="div" cssClass="error-color"/>
	<div class="align-right">
		<c:if test="${memberVO.auth!=2}">
			<input type="submit" value="저장">
		</c:if>
		<input type="button" value="목록" onclick="location.href='admin_list.do'">
	</div>
	<ul>
		<li>
			<label>회원등급</label>
			<c:if test="${memberVO.auth < 2}">
				<form:radiobutton path="auth" value="0"/>탈퇴
				<form:radiobutton path="auth" value="1"/>일반
				<form:radiobutton path="auth" value="3"/>정지
			</c:if>
			<c:if test="${memberVO.auth == 2}">관리자</c:if>
		</li>
	</ul>
	<ul>
		<li><label>이름</label>	${memberVO.mem_name}</li>
		<li><label>아이디</label>	${memberVO.id}</li>
		<li><label>전화번호</label>${memberVO.mem_cell}</li>
		<li><label>이메일</label>	${memberVO.mem_email}</li>
		<li><label>가입일</label>	${memberVO.reg_date}</li>
	</ul>
</form:form>
</div>

<!-- 내용 끝 -->