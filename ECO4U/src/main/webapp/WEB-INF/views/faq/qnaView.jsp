<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/board.reply.js"></script> --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/qna.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/qna.css">
<style>
	body{
	background-color:white;
	}
	#main_header{
	background-color:#f4f9f2;
	}
</style>
<!-- 내용 시작 -->
<div class="qna-main">
<div class="align-right" style="font-size:12px">
<a href="/member/myPage.do">HOME</a> > 
<a href="/faq/qnalist.do">문의내역</a> > 
<a href="detail.do?q_num=${qna.q_num}" style="color:black;">문의상세</a></div>
<%-- <h3>「 ${qna.mem_name} 」 님의 문의</h3> --%>
<div class="qnaViewtb">
<img class="qnarefresh" width="20px" height="20px" src="${pageContext.request.contextPath}/images/faq/refresh.png" onclick="location.href='detail.do?q_num=${qna.q_num}'">
	<div class="align-right" id="qnadiv01"><a href="${pageContext.request.contextPath}/faq/qnawrite.do" style="color:#666666;">다시 문의하기</a></div>
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
	      <input type="button" value="수정" onclick="location.href='qnaupdate.do?q_num=${qna.q_num}'">
		  <input type="button" value="삭제" id="delete_btn">
		  <script type="text/javascript">
			let delete_btn = document.getElementById('delete_btn');
			//이벤트 연결
			delete_btn.onclick=function(){
				let choice = confirm('삭제하시겠습니까?');
				if(choice){
					location.replace('qnadelete.do?q_num=${qna.q_num}');
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
<input type="button" value="목록" onclick="location.href='qnalist.do'">
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
<!--  -->
	<div id="output"></div>
	<div class="paging-button" style="display:none;">
		<input type="button" value="다음글 보기">
	</div>
	<div id="loading" style="display:none;">
		<img src="${pageContext.request.contextPath}/images/faq/loading.gif" width="100" height="100">
	</div>
	<!-- 댓글 UI 끝 -->
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<%-- 	<div class="accordion accordion-flush" id="accordionFlushExample">
	  <div class="accordion-item">
	    <h2 class="accordion-header" id="flush-heading" >
	      <button id="title_btn01" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse" aria-expanded="false" aria-controls="flush-collapse">
	      <span id="title_btn02">내용</span>
	      </button>
	    </h2>
	    <div style="background:white; border-bottom:1px solid #7c8f83;" id="flush-collapse" class="accordion-collapse collapse" aria-labelledby="flush-heading" data-bs-parent="#accordionFlushExample">
	      <div class="accordion-body">${qna.q_content}</div>
	      <div class="faq_btn_group" align="right">
	      <input type="button" value="수정" onclick="location.href='faqupdate.do?f_num=${qna.q_num}'">
		  <input type="button" value="삭제" id="delete_btn">
		  <script type="text/javascript">
			let delete_btn = document.getElementById('delete_btn');
			//이벤트 연결
			delete_btn.onclick=function(){
				let choice = confirm('삭제하시겠습니까?');
				if(choice){
					location.replace('delete.do?q_num=${qna.q_num}');
				}
			};
			</script> 
	      </div>
	    </div>
	  </div>
	</div>
	--%>
	<%-- <h2>${board.title}</h2> --%>
	<%-- <ul class="detail-info">
		<li>
			<c:if test="${!empty board.photo_name}">
			<img src="imageView.do?board_num=${board.board_num}&board_type=1" width="40" height="40" class="my-photo">
			</c:if>
			<c:if test="${empty board.photo_name}">
			<img src="${pageContext.request.contextPath}/images/face.png" width="40" height="40" class="my-photo">
			</c:if>
		</li>
		<li>
			<c:if test="${empty board.nick_name}">${board.id}</c:if>
			<c:if test="${!empty board.nick_name}">${board.nick_name}</c:if>
			<br>
			<c:if test="${!empty board.modify_date}">
			최근 수정일 : ${board.modify_date}	
			</c:if>
			<c:if test="${empty board.modify_date}">
			작성일 : ${board.reg_date}	
			</c:if>
			조회 : ${board.hit}
		</li>
	</ul>
	<ul>
		<c:if test="${!empty board.filename}">
		<li>
			첨부파일 : <a href="file.do?board_num=${board.board_num}">${board.filename}</a>
		</li>
		</c:if>
	</ul>
	<hr size="1" width="100%">
	<c:if test="${fn:endsWith(board.filename,'.jpg') ||
	              fn:endsWith(board.filename,'.JPG') ||
	              fn:endsWith(board.filename,'.jpeg') ||
	              fn:endsWith(board.filename,'.JPEG') ||
	              fn:endsWith(board.filename,'.gif') ||
	              fn:endsWith(board.filename,'.GIF') ||
	              fn:endsWith(board.filename,'.png') ||
	              fn:endsWith(board.filename,'.PNG')}">
	<div class="align-center">
		<img src="imageView.do?board_num=${board.board_num}&board_type=2" style="max-width:500px;">
	</div>
	</c:if>
	<p>
		${board.content}
	</p>
	<div>
		좋아요
		<img id="output_fav" src="${pageContext.request.contextPath}/images/fav01.gif" width="40">
		<span id="output_fcount"></span>
	</div>
	<hr size="1" width="100%">
	<div class="align-right">
		<c:if test="${!empty user && user.mem_num == board.mem_num}">
		<input type="button" value="수정" 
		  onclick="location.href='update.do?board_num=${board.board_num}'">
		<input type="button" value="삭제" id="delete_btn">
		<script type="text/javascript">
			let delete_btn = document.getElementById('delete_btn');
			//이벤트 연결
			delete_btn.onclick=function(){
				let choice = confirm('삭제하시겠습니까?');
				if(choice){
					location.replace('delete.do?board_num=${board.board_num}');
				}
			};
		</script>  
		</c:if>
		<input type="button" value="목록"
		       onclick="location.href='list.do'">
	</div>
	<hr size="1" width="100%">
	<!-- 댓글 UI 시작 -->
	<div id="reply_div">
		<span class="re-title">댓글 달기</span>
		<form id="re_form">
			<input type="hidden" name="board_num"
			   value="${board.board_num}" id="board_num">
			<textarea rows="3" cols="50" 
			  name="re_content" id="re_content"
			  class="rep-content"
			  <c:if test="${empty user}">disabled="disabled"</c:if>
			  ><c:if test="${empty user}">로그인해야 작성할 수 있습니다.</c:if></textarea>
			<c:if test="${!empty user}">
			<div id="re_first">
				<span class="letter-count">300/300</span>
			</div>
			<div id="re_second" class="align-right">
				<input type="submit" value="전송">
			</div>
			</c:if>
		</form>
	</div>
	<!-- 댓글 목록 출력 -->
	<div id="output"></div>
	<div class="paging-button" style="display:none;">
		<input type="button" value="다음글 보기">
	</div>
	<div id="loading" style="display:none;">
		<img src="${pageContext.request.contextPath}/images/loading.gif" width="100" height="100">
	</div>
	<!-- 댓글 UI 끝 --> --%>
	</div>
<!-- 내용 끝 -->


