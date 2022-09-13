<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style>
#id{
	width:25%;
	font-size: 15px;
}
#mem_pw{
	width:25%;
	font-size: 15px;
}
#mem_pwcheck{
	width:25%;
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
		<h1>회원비밀번호변경</h1>
	</div>
	<form:form id="updatePw_from" action="updatepw.do" modelAttribute="memberVO" style="box-shadow: 2px 2px 7px gray; border:1px solid white; border-radius:10px; height:480px; background-color:white; padding-top:30px;">
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
				<label for="id" id="id" >아이디</label>
				<form:errors path="id" cssClass="error-color"/><br>
			</li>
		</ul>
		<ul>
			<li>
				<form:input path="id" placeholder="아이디를 입력해주세요" autocomplete="off" style="width:90%; height:30px; border-radius:5px; border:1px solid gray; padding-left: 0.6rem;"/>
			</li>
		</ul>
		<ul>
			<li>
				<label for="mem_pw" id="mem_pw">비밀번호</label>
				<form:errors path="mem_pw" cssClass="error-color"/><br>
			</li>
		</ul>
		<ul>
			<li>
				<form:password path="mem_pw" placeholder="비밀번호를 입력해주세요" style="width:90%; height:30px; border-radius:5px; border:1px solid gray; padding-left: 0.6rem;"/>
			</li>
		</ul>
		<ul>
			<li>
				<label for="mem_pwcheck" id="mem_pwcheck">비밀번호확인</label>
				<form:errors path="mem_pwcheck" cssClass="error-color"/><br>
			</li>
		</ul>
		<ul>
			<li>
				<form:password path="mem_pwcheck" placeholder="비밀번호를 입력해주세요" style="width:90%; height:30px; border-radius:5px; border:1px solid gray; padding-left: 0.6rem;"/>
			</li>
		</ul>  
		<div class="align-center" style="margin-top: 10px;">
			<input type="submit" value="비밀번호변경" class="submit-btn">
		</div>
		<div class="align-center" style="font-size:15px; color:gray; margin-top: 20px;">
		입력하신 비밀번호로 변경됩니다.<br>
		다음 로그인부터는 변경된 비밀번호로 로그인 부탁드립니다.
		</div>	                  
	</form:form>
</div>
<!-- 내용 끝 -->