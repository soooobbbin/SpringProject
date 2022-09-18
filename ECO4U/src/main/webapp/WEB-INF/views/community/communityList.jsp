<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/community.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/community.like.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/videoAdapter.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/community.css">

<!-- 내용 시작 -->
<div class="page-main">
   <div class="align-center">
      <h2 onclick="location.href='list.do?c_category=1'">Community</h2>
   </div>
   <div class="community-list-header">
      <ul class="community-category-ul" id="c_category">
         <li class="tip1"><a href="list.do?c_category=1">TIP</a></li>
         <li class="tip2"><a href="list.do?c_category=2">함께해요</a></li>
         <li class="tip3"><a href="list.do?c_category=3">친환경 소식</a></li>
      </ul>
   </div>
   <form action="list.do" id="search_form" method="get">
      <ul class="search">
         <li>
         <select name="keyfield" id="keyfield">
            <option value="1" <c:if test="${param.keyfield == 1}">selected</c:if>>제목</option>
            <option value="2" <c:if test="${param.keyfield == 2}">selected</c:if>>작성자 ID</option>
            <option value="3" <c:if test="${param.keyfield == 3}">selected</c:if>>내용</option>
            <option value="4" <c:if test="${param.keyfield == 4}">selected</c:if>>제목+내용</option>
         </select>
         </li>
         <li>
            <input type="search" name="keyword" id="keyword" value="${param.keyword}">
         </li>
         <li>
            <input type="submit" value="찾기">
         </li>
      </ul>
      <!-- 글쓰기 버튼 -->
      <c:if test="${!empty user}">
         <input type="button" id="writeBtn" value="글쓰기" onclick="location.href='write.do'">
      </c:if>
   </form>
   <!-- 목록 내용 -->
   <div class="content">
   <div class="community-list-sort">
      <div class="community-list-sort">
		<select name="keyfield" id="order">
			<option value="1" <c:if test="${param.keyfield==1}">selected</c:if>>조회수순</option>
			<option value="2" <c:if test="${param.keyfield==2}">selected</c:if>>추천순</option>
			<option value="3" <c:if test="${param.keyfield==3}">selected</c:if>>댓글순</option>
		</select>
	</div>
   </div>
   <!-- 게시글 목록 -->
   <c:if test="${count == 0}">
      <div class="community-result-display">표시할 게시물이 없습니다.</div>   
   </c:if>

   <c:if test="${count > 0}">
   
      
          
      <c:forEach var="community" items="${list}">
      
      <c:if test="${community.c_category==1}">
       <table> 
         <tr>
            <td>${community.id}   · ${community.reg_date}</td>
         </tr>
         <tr>
            <td><a href="detail.do?c_num=${community.c_num}">${community.c_title}</a></td>
            <td>
	              	<c:if test="${!empty community.filename}">
	              <a href="detail.do?c_num=${community.c_num}"><img src="imageView.do?&c_num=${community.c_num}" width="150" height="120" class="com-photo">
	              </a></c:if>
	              </td>
	              </tr>
        
         <tr>
            <td><img src="${pageContext.request.contextPath}/images/community/hit.png" width="18" height="18"> ${community.c_hit} 
            <img src="${pageContext.request.contextPath}/images/community/like03.png" width="18" height="18"> ${community.like_cnt}
            <img src="${pageContext.request.contextPath}/images/community/comment.png" width="18" height="18"> ${community.com_cnt}</td>
            
         </tr>
         </table> 
        </c:if>
        
     <!--함께해요 -->
     <c:if test="${community.c_category==2}">
       <table> 
         <tr>
            <td>${community.id}   · ${community.reg_date}</td>
         </tr>
         <tr>
            <td><a href="detail.do?c_num=${community.c_num}">${community.c_title}</a></td>
            <td>
	              	<c:if test="${!empty community.filename}">
	              <a href="detail.do?c_num=${community.c_num}"><img src="imageView.do?&c_num=${community.c_num}" width="150" height="120" class="com-photo">
	              </a></c:if>
	              </td>
	              </tr>
        
         <tr>
            <td><img src="${pageContext.request.contextPath}/images/community/hit.png" width="18" height="18"> ${community.c_hit} 
            <img src="${pageContext.request.contextPath}/images/community/like03.png" width="18" height="18"> ${community.like_cnt}
            <img src="${pageContext.request.contextPath}/images/community/comment.png" width="18" height="18"> ${community.com_cnt}</td>
            
         </tr>
         </table> 
        </c:if>
 
     <!-- 친환경소식 -->
       <c:if test="${community.c_category==3}">
         
         <div class="news">
	         <c:if test="${!empty community.filename}">
				<a href="detail.do?c_num=${community.c_num}"><img src="imageView.do?&c_num=${community.c_num}" width="150" height="120" class="com-photo"> </a>
			 </c:if>
			 <c:if test="${empty community.filename}">
				<a href="detail.do?c_num=${community.c_num}"><img src="${pageContext.request.contextPath}/images/no_image.png" width="150" height="120"> </a>
			</c:if>
	  		  <span class="news_title"><a href="detail.do?c_num=${community.c_num}">${community.c_title}</a></span>
	 			 <span class="news_date">
	 			
	 			 ${community.reg_date2}</span> 
      	</div>
      </c:if>
          
   </c:forEach>
   
   <div class="align-center">${page}</div>
   </c:if>  
  
   </div>
   
   
</div>
<!-- 내용 끝 -->