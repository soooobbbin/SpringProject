<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/community.like.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/community.comment.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/videoAdapter.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/community.css">

<div class="page-main">
	<div class="align-center">
		<h2 onclick="location.href='list.do?c_category=1'">Community</h2>

	</div>

	<div class="co-content-detail">
		<c:if test="${community.c_category==1}">
			<div class="cate-detail">
				<a href="list.do?c_category=1">커뮤니티><b>'TIP'</b></a>
			</div>
		</c:if>
		<c:if test="${community.c_category==2}">
			<div class="cate-detail">
				<a href="list.do?c_category=2">커뮤니티><b>'함께해요'</b></a>
			</div>
		</c:if>
		<c:if test="${community.c_category==3}">
			<div class="cate-detail">
				<a href="list.do?c_category=3">커뮤니티><b>'친환경 소식'</b></a>
			</div>
		</c:if>
		<div class="co-title">
			<h2>${community.c_title}</h2>
		</div>
		<hr size="1" width="100%">

		<ul class="detail-info">

			<li><b>${community.id}</b> <c:if
					test="${!empty community.modify_date}">
			· 수정일 : ${community.modify_date} 	
			</c:if> <c:if test="${empty community.modify_date}">
			· 작성일 : ${community.reg_date2}	
			</c:if>· 조회 : ${community.c_hit}</li>
		</ul>


		<div class="co-content">${community.c_content}</div>
		<div class="like-comment">
			<%-- 좋아요 --%>
			<img id="output_like"
				src="${pageContext.request.contextPath}/images/community/like01.png"
				width="40"> <span id="output_lcount"></span>
			<%-- 댓글 카운트 --%>
			&nbsp;<img id="output_comment"
				src="${pageContext.request.contextPath}/images/community/comment02.png"
				width="40"> ${community.com_cnt}

			<div class="page-right">

				<c:if test="${user.auth == 2 && community.c_auth==0}">
					<input type="button" value="공지지정" id="notice_btn">
					<script type="text/javascript">
						let notice_btn = document.getElementById('notice_btn');
						//이벤트 연결
						notice_btn.onclick = function() {
							let choice = confirm('공지로 지정하시겠습니까?');
							if (choice) {
								location
										.replace('updatenotice.do?c_num=${community.c_num}');
							}
						};
					</script>
				</c:if>
				<c:if test="${user.auth == 2 && community.c_auth==1}">
					<input type="button" value="공지해제" id="notice_btn">
					<script type="text/javascript">
						let notice_btn = document.getElementById('notice_btn');
						//이벤트 연결
						notice_btn.onclick = function() {
							let choice = confirm('공지를 해제시겠습니까?');
							if (choice) {
								location
										.replace('updatenotice2.do?c_num=${community.c_num}');
							}
						};
					</script>
				</c:if>


				<c:if test="${!empty user && user.mem_num == community.mem_num}">
					<input type="button" value="수정" id="update_btn"
						onclick="location.href='update.do?c_num=${community.c_num}'">
				</c:if>
				<c:if
					test="${!empty user && user.mem_num == community.mem_num || user.auth == 2 }">
					<input type="button" value="삭제" id="delete_btn">
					<script type="text/javascript">
						let delete_btn = document.getElementById('delete_btn');
						//이벤트 연결
						delete_btn.onclick = function() {
							let choice = confirm('삭제하시겠습니까?');
							if (choice) {
								location
										.replace('delete.do?c_num=${community.c_num}');
							}
						};
					</script>
				</c:if>
				<c:if test="${community.c_category==1}">
					<input type="button" value="목록" id="list_btn"
						onclick="location.href='list.do?c_category=1'">
				</c:if>
				<c:if test="${community.c_category==2}">
					<<input type="button" value="목록" id="list_btn"
						onclick="location.href='list.do?c_category=2'">
				</c:if>
				<c:if test="${community.c_category==3}">
					<input type="button" value="목록" id="list_btn"
						onclick="location.href='list.do?c_category=3'">
				</c:if>
			</div>

		</div>
		<hr size="1" width="100%">
		<!-- 댓글 UI 시작 -->


		<!-- 댓글 목록 출력 -->
		<div class="outputs">
			<div id="output"></div>
		</div>
		<div class="paging-button" style="display: none;">
			<input type="button" value="다음글 보기">
		</div>
		<div id="loading" style="display: none;">
			<img
				src="${pageContext.request.contextPath}/images/community/loading.gif"
				width="100" height="100">
		</div>
		<!-- 댓글 UI 끝 -->
	</div>
</div>

<form id="com_form">
	<input type="hidden" name="c_num" value="${community.c_num}" id="c_num">
	<textarea rows="3" cols="100" name="com_content" id="com_content"
		class="comm-content" placeholder="댓글을 입력하세요."
		onfocus="this.placeholder=''" onblur="this.placeholder = '댓글을 입력하세요.'"
		autocomplete="off"
		<c:if test="${empty user}">disabled="disabled"</c:if>><c:if
			test="${empty user}">로그인해야 작성할 수 있습니다.</c:if></textarea>
	<c:if test="${!empty user}">
		<div id="com_second" class="submit-co-div">
			<input type="submit" value="전송" id="submit_btn">
		</div>
	</c:if>
</form>


<!-- 내용 끝 -->
