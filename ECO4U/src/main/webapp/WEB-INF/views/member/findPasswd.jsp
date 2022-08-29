<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!-- 내용 시작 -->
<div class="page-main">
	<h2>회원 비밀번호찾기</h2>
	<form:form id="findpasswd_form" action="doSend.do" modelAttribute="memberVO">
		<form:errors element="div" cssClass="error-color"/>
			<ul>
				<li>
					<label for="id">아이디</label>
					<form:input path="id"/>
					<form:errors path="id" cssClass="error-color"/>
				</li>
				<li>
					<label for="phone">핸드폰번호</label>
					<form:input path="phone"/>
					<form:errors path="phone" cssClass="error-color"/>
				</li>
			</ul>
		<div class="align-center">
			<input type="submit" value="이메일전송">
			<input type="button" value="홈으로" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
		</div>                  
	</form:form>
</div>
<!-- 내용 끝 -->