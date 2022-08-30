<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style>
#id{
	font-size: 15px;
	margin-top: 20px;
}
#mem_pw{
	font-size: 15px;
}
.submit-btn{
	color:white;
	font-size: 25px;
	background-color: gray;
	margin-top: 30px;
	margin-bottom: 30px;
	padding: 12px;
	border: none;
	border-radius: 5px;
	width: 90%;
	font-weight: bold;
	cursor:pointer;
}
</style>    
<!-- 내용 시작 -->
<div class="page-main">
	<div class="align-center" style="margin-top: 60px; margin-bottom: 30px;">
		<h1>로그인</h1>
	</div>
	<form:form id="login_form" action="login.do" modelAttribute="memberVO" style="border:1px solid white; border-radius:10px; height:450px; background-color:white;">
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
				<label for="id" id="id">아이디</label><br>
			</li>
		</ul>
		<ul>
			<li>
				<form:input path="id" placeholder="아이디를 입력해주세요" autocomplete="off" style="width:90%; height:30px; border-radius:5px; border:1px solid gray;"/>
				<form:errors path="id" cssClass="error-color"/>
			</li>
		</ul>
		<ul>
			<li>
				<label for="mem_pw" id="mem_pw">비밀번호</label><br>
			</li>
		</ul>
		<ul>
			<li>
				<form:password path="mem_pw" placeholder="비밀번호를 입력해주세요" style="width:90%; height:30px; border-radius:5px; border:1px solid gray;"/>
				<form:errors path="mem_pw" cssClass="error-color"/>
			</li>
		</ul>  
		<div class="align-center" style="margin-top: 10px;">
			<input type="submit" value="로그인" class="submit-btn">
		</div>
		<div class="align-center">
			<a href="findid.do">아이디 찾기</a> | 
			<a href="findpasswd.do">비밀번호 찾기</a> | 
			<a href="registerUser.do">회원가입</a>
		</div>
		<br>
		<div class="align-center">
 			<a href="https://kauth.kakao.com/oauth/authorize?client_id=dedecdcafbdb9f4a5cba8d8079ef6606&redirect_uri=http://localhost:8080/member/kakaologin.do&response_type=code">
			<img src="${pageContext.request.contextPath}/images/kakao_login.jpg" alt="위의 이미지를 누르면 연결됩니다." style="width:80%; border-radius:5px;">
			</a> 
		</div>                  
	</form:form>
</div>
<!-- 내용 끝 -->
