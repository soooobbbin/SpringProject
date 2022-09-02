<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<div class="page-main">
<div class="align-center">
	<h2 onclick="location.href='list.do'">Community</h2> </div>
	<form:form action="write.do" modelAttribute="communityVO"
	        id="register_form"
	        enctype="multipart/form-data">
	    <form:errors element="div" cssClass="error-color"/>    
		<ul>
			<li><label for="c_category">카테고리</label>
			<select name="c_category" id="c_category">
					<option value="1"<c:if test="${c_category == 1}">selected</c:if>>TIP</option>
					<option value="2"<c:if test="${c_category == 2}">selected</c:if>>함께해요</option>
					<option value="3"<c:if test="${c_category == 3}">selected</c:if>>친환경 소식</option>
				</select><br><br>
			</li>
			
			<li><label for="c_title">제목</label>
				<form:input path="c_title"/>
				<form:errors path="c_title" 
				             cssClass="error-color"/><br><br>
			</li>
			<li><label for="c_content">내용</label>
				<form:textarea path="c_content"/>
				<form:errors path="c_content" 
				             cssClass="error-color"/><br><br>
			<li>
				<label for="upload">파일 업로드</label>
				<input type="file" name="upload" id="upload">
			</li>
		</ul>    
		<div class="align-center">
			<form:button>등록</form:button>
		</div>    
	</form:form>
</div>
<!-- 내용 끝 -->