<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style>
#mem_name{
	width:15%;
	font-size: 15px;
}
#mem_email{
	width:15%;
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
.submit-btn:hover{
	filter: brightness(95%);
}
</style>     
<!-- 내용 시작 -->
<div class="page-main">
	<div class="align-center" style="margin-top: 60px; margin-bottom: 30px;">
		<h1>아이디 찾기</h1>
	</div>
	<form:form id="findid_form" action="doSendid.do" modelAttribute="memberVO" style="box-shadow: 2px 2px 7px gray; border:1px solid white; border-radius:10px; height:400px; background-color:white; padding-top:30px;">
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
				<label for="mem_name" id="mem_name">이름</label>
				<form:errors path="mem_name" cssClass="error-color"/><br>
			</li>
		</ul>
		<ul>
			<li>
				<form:input path="mem_name" placeholder="이름을 입력해주세요" autocomplete="off" style="width:90%; height:30px; border-radius:5px; border:1px solid gray; padding-left: 0.6rem;"/>
			</li>
		</ul>
		<ul>
			<li>
				<label for="mem_email" id="mem_email">이메일</label>
				<form:errors path="mem_email" cssClass="error-color"/><br>
			</li>
		</ul>
		<ul>
			<li>
				<form:input path="mem_email" placeholder="이메일을 입력해주세요" style="width:90%; height:30px; border-radius:5px; border:1px solid gray; padding-left: 0.6rem;"/>
			</li>
		</ul>  
		<div class="align-center" style="margin-top: 10px;">
			<input type="submit" value="아이디 찾기" class="submit-btn">
		</div>
		<div class="align-center" style="font-size:15px; color:gray; margin-top: 20px;">
		가입하신 성함과 이메일을 입력해주시면<br>
		가입하신 아이디를 아스타처리하여 보여드립니다.
		</div>	                  
	</form:form>
</div>
<!-- 내용 끝 -->