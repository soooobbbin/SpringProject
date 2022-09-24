<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/cart.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/qna.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">

<jsp:include page="/WEB-INF/views/admin/sub_menu.jsp">
	<jsp:param name="mem_name" value="${admin.mem_name}"/>
</jsp:include>

<div class="main-content">
	<div class="sub-title" style="margin-left: 2.5%;">
		<span class="sub_1">문의 관리</span>
	</div>

	<div class="top-menu">
		<img id="qna_home" alt="마이페이지이동" src="../images/home.png" onclick="location.href='${pageContext.request.contextPath}/admin/admin_list.do'">
		<span style="font-weight:bold;"> > </span><a href="qnamanagementlist.do" style="font-weight: bold">문의내역</a>
	</div>
	
	<form action="qnamanagementlist.do" id="search_form"  method="get" class="search-from">		
		<!-- 검색 -->
		<input type="hidden" name="q_category" value="${param.q_category}">
		<div class="search-content">
			<!-- 카테고리 -->
			<div class="category">
				<input type="button" value="전체" onclick="location.href='/faq/qnamanagementlist.do'">
				<input type="button" value="회원" onclick="location.href='/faq/qnamanagementlist.do?q_category=1'">
				<input type="button" value="상품/배송"  onclick="location.href='/faq/qnamanagementlist.do?q_category=2'">
				<input type="button" value="기타"  onclick="location.href='/faq/qnamanagementlist.do?q_category=3'">
			</div>
			
			<!-- 검색 필드 -->
			<div class="search-q">
				<select name="keyfield" id="keyfield">
		            <option value="1" <c:if test="${param.keyfield == 1}">selected</c:if>>제목</option>
		            <option value="2" <c:if test="${param.keyfield == 2}">selected</c:if>>작성자</option>
		            <option value="3" <c:if test="${param.keyfield == 3}">selected</c:if>>내용</option>
	        	</select>
	            <input type="search" name="keyword" id="keyword" value="${param.keyword}">
	            <input type="submit" value="">
			</div>
		</div>
		
		<div class="qna-list">
			<!-- 검색 결과가 없을 경우 -->
			<c:if test="${count == 0}">
				<div class="search-result">표시할 회원 정보가 없습니다.</div>
			</c:if>
			
			<c:if test="${count > 0}">
				<table>
					<c:forEach var="qna" items="${list}"><input type="hidden" value="${qna.mem_num}">
					<tr onclick="location.href='admindetail.do?q_num=${qna.q_num}'">
						<td style="width:12%;">
							<c:if test="${qna.q_category == 1}">회원</c:if>
							<c:if test="${qna.q_category == 2}">상품/배송</c:if>
							<c:if test="${qna.q_category == 3}">기타</c:if>
						</td>
						
						<td>
							<img id="qna-photo" src="imageView.do?q_num=${qna.q_num}" onerror="this.src='../images/faq/backcolor.png'">	
						</td>
						
						<td>
							<div class="qna-box">
								<div class="qna-boxtitle">${qna.q_title}</div>
								<div class="qna-boxcontent">
									<img src="../images/faq/reply00.png" width="15px" height="15px" style="">
									<c:choose>
								    	<c:when test="${fn:length(qna.q_content) gt 40}">
											<c:out value="${fn:substring(qna.q_content, 0, 35)}"></c:out>
											<span style="font-size:11px; font-weight:bold; color:#999999;">... 더보기</span>
								    	</c:when>
								    	<c:otherwise>
								    		<c:out value="${qna.q_content}"></c:out>
								    	</c:otherwise>
									</c:choose>
								</div>
								<div class="qna-boxdate">
									<span style="font-size:9px;">${qna.reg_date}</span>
									<span style="font-size:5px;">
										<img src="../images/faq/comment.png" width="16px" height="16px" style="margin-left:10px; margin-bottom:-5px">
										(${qna.com_cnt})
									</span>
								</div>
							</div>
						</td>
						
						<td style="width:15%; color:black">${qna.mem_name}</td>
					</tr>
					</c:forEach>
				</table>
				<div class="page-num">< ${page} ></div>
			</c:if>
		</div>
	</form>	
</div>
<!-- 내용 끝 -->