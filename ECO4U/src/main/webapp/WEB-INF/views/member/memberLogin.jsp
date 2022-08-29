<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!-- 내용 시작 -->
<div class="page-main">
	<h2>회원 로그인</h2>
	<form:form id="login_form" action="login.do" modelAttribute="memberVO">
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
				<label for="id">아이디</label>
				<form:input path="id" placeholder="아이디를 입력해주세요" autocomplete="off"/>
				<form:errors path="id" cssClass="error-color"/>
			</li>
			<li>
				<label for="mem_pw">비밀번호</label>
				<form:password path="mem_pw" placeholder="비밀번호를 입력해주세요"/>
				<form:errors path="mem_pw" cssClass="error-color"/>
			</li>
		</ul>  
		<div class="align-center">
			<input type="submit" value="로그인">
			<%-- <input type="button" value="아이디 찾기" onclick="location.href='${pageContext.request.contextPath}/member/findid.do'"> --%>
			<%-- <input type="button" value="비밀번호 찾기" onclick="location.href='${pageContext.request.contextPath}/member/findpasswd.do'"> --%>
			<input type="button" value="회원가입" onclick="location.href='${pageContext.request.contextPath}/member/registerUser.do'">
			<input type="button" value="홈으로" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
			<!-- <a href="https://kauth.kakao.com/oauth/authorize?client_id=dedecdcafbdb9f4a5cba8d8079ef6606&redirect_uri=http://localhost:8080/member/kakaologin.do&response_type=code">
			카카오톡로그인
			</a> -->
		</div>                  
	</form:form>
</div>
<!-- 내용 끝 -->





