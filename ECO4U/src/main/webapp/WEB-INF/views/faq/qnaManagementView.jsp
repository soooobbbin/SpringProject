<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/qna.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/qna.mncomment.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/qna.css">
<style>
body{
	background-color:white;
}
#main_header{
	background-color:#f4f9f2;
}
#qnadiv01{
	margin-top:50px;
	font-size:12px;
	font-weight:bold;
	color:red;
}
.modify-btn{
	width:35px;
	height:20px;
	background-color: #F7F8F9;
	border: none;
	font-weight:bold;
	font-size:12px;
	float:right;
}

.delete-btn{
	margin-right:1%;
	width:35px;
	height:20px;
	margin-left:-3px;
	background-color: #F7F8F9;
	border: none;
	font-weight:bold;
	font-size:12px;
	float:right;
}
</style>
<!-- 내용 시작 -->
<div class="qna-main">
<div class="align-right" style="font-size:12px">
<a href="${pageContext.request.contextPath}/admin/admin_list.do">HOME</a> > 
<a href="/faq/qnamanagementlist.do">문의내역</a> > 
<a href="admindetail.do?q_num=${qna.q_num}" style="color:black;">문의상세</a></div>
<div class="qnaViewtb">
<img class="qnarefresh" width="20px" height="20px" src="${pageContext.request.contextPath}/images/faq/refresh.png" onclick="location.href='admindetail.do?q_num=${qna.q_num}'">
	<div class="align-right" id="qnadiv01">관리자 문의 상세</div>
	<table class="qnaViewtable">
		<tr>
			<th width="15%" style="border-top: 2px solid lightgray;">제목</th>
			<td width="85%" style="border-top: 2px solid lightgray;">${qna.q_title}</td>
		</tr>
		<tr>
			<th width="15%">카테고리</th>
			<c:if test="${qna.q_category == 1}">
			<td width="85%">회원문의</td>
			</c:if>
			<c:if test="${qna.q_category == 2}">
			<td width="85%">상품/배송문의</td>
			</c:if>
			<c:if test="${qna.q_category == 3}">
			<td width="85%">기타문의</td>
			</c:if>
		</tr>
		<tr>
			<th width="15%">작성자</th>
			<td width="85%">${qna.mem_name}</td>
		</tr>
		<tr>
			<th width="15%">작성일</th>
			<td width="85%">${qna.reg_date}</td>
		</tr>
	</table>
</div>
	<div class="accordion" id="accordionExample">
	  <div class="accordion-item">
	    <h2 class="accordion-header" id="heading">
	      <button id="qnaac01" style="background:white; color:black;" class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapse" aria-expanded="true" aria-controls="collapse">
	      <span id="qnaac02" class="qnaac2">내용</span>
	      </button>
	    </h2>
    <div id="collapse" class="accordion-collapse collapse show" aria-labelledby="heading" data-bs-parent="#accordionExample">
     <div class="qna_btn_group" align="right">
	      <input type="button" value="수정" onclick="location.href='qnamnupdate.do?q_num=${qna.q_num}'">
		  <input type="button" value="삭제" id="delete_btn">
		  <script type="text/javascript">
			let delete_btn = document.getElementById('delete_btn');
			//이벤트 연결
			delete_btn.onclick=function(){
				let choice = confirm('삭제하시겠습니까?');
				if(choice){
					location.replace('qnamndelete.do?q_num=${qna.q_num}');
				}
			};
			</script> 
	  </div>
      <div class="accordion-body">
      <div class="align-center"><img id="qnalist-image03" src="imageView.do?q_num=${qna.q_num}" onerror="this.style.display='none';"></div>
      ${qna.q_content}
      </div>
    </div>
  </div>
</div>
<div class="qna_btn02" align="right">
<input type="button" value="목록" onclick="location.href='qnamanagementlist.do'">
</div>
	<!-- 댓글 시작 -->
	<div id="qnacomment_div" class="align-center">
		<form id="qcom_form">
			<input type="hidden" name="q_num" value="${qna.q_num}" id="q_num"><textarea rows="1" cols="100" name="qc_content" id="qc_content" class="qcom-content" placeholder="댓글을 입력하세요." onfocus="this.placeholder=''" onblur="this.placeholder = '댓글을 입력하세요.'" autocomplete="off"
			<c:if test="${empty user}">disabled="disabled"</c:if>><c:if test="${empty user}">로그인해야 작성할 수 있습니다.</c:if></textarea>
			<c:if test="${!empty user}">
			<span class="qna_btn03"><input type="submit" value="+"></span>
			</c:if>
		</form>
	</div>
	<!-- 댓글 목록 -->
	<div id="output"></div>
	<div class="paging-button" style="display:none;">
		<input type="button" value="더보기">
	</div>
	<div id="loading" style="display:none;">
		<img src="${pageContext.request.contextPath}/images/faq/loading.gif" width="100" height="100">
	</div>
	<!-- 댓글 UI 끝 -->
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</div>
<!-- 내용 끝 -->


