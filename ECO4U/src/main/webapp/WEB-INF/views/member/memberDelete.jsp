<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style>
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
.btn01{
	color:white;
	font-size: 25px;
	background-color: gray;	
	margin-bottom: 30px;
	padding: 12px;
	border: none;
	border-radius: 5px;
	width: 90%;
	font-weight: bold;
	cursor:pointer;
}
.btn01:hover{
	filter: brightness(95%);
}
</style>     
<!-- 내용 시작 -->
<div class="page-main" style="min-height: 775px;">
	<div class="align-center" style="margin-top: 60px; margin-bottom: 30px;">
		<h1>회원탈퇴신청</h1>
	</div>
	<form:form id="delete_from" action="delete.do" modelAttribute="memberVO" style="box-shadow: 2px 2px 7px gray; border:1px solid white; border-radius:10px; height:250px; background-color:white; padding-top:30px;">
		<div class="align-center" style="font-size:15px; color:gray; margin-top: 20px;">
		ECO4U를 이용해주셔서 감사합니다.<br>
		</div>	 
		<div class="align-center" style="margin-top: 10px;">
			<input type="submit" value="회원탈퇴확인" class="submit-btn">
			<input type="button" value="회원탈퇴취소" class="btn01" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
		</div>  
	</form:form>
</div>
<!-- 내용 끝 -->