<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>안내</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
<style type="text/css">
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
</head>
<body>
<div class="page-main">
	<div class="align-center" style="margin-top: 60px; margin-bottom: 30px;">
		<h1>카카오페이 구매 실패</h1>
	</div>
	<div class="result-display" style="box-shadow: 2px 2px 7px gray; border:1px solid white; border-radius:10px; height:250px; width:30%; background-color:white; padding-top:30px;">
		<div class="align-center">
				구매에 실패했습니다.<br>
				문의 사항은 고객 센터를 통해 문의해 주세요.
			<p>
				<input type="button" value="메인으로" class="submit-btn" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">	
		</div>
	</div>
</div>
</body>
</html>





