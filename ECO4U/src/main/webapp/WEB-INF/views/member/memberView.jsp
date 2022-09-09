<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
/*버튼*/
#btnmodify{
	color:white;
	font-size: 15px;
	background-color: gray;
	padding: 9px;
	margin-top: -10px;
	border: none;
	border-radius: 5px;
	width: 20%;
	height:45px;
	cursor:pointer;
	margin-right: 20px;
}
#btnmodify:hover{
	filter: brightness(95%);
}
#btnupdate{
	color:white;
	font-size: 15px;
	background-color: gray;
	padding: 9px;
	margin-top: -10px;
	border: none;
	border-radius: 5px;
	width: 20%;
	height:45px;
	cursor:pointer;
	margin-right: 20px;
}
#btnupdate:hover{
	filter: brightness(95%);
}
#btndelete{
	color:white;
	font-size: 15px;
	background-color: gray;
	padding: 9px;
	margin-top: -10px;
	border: none;
	border-radius: 5px;
	width: 20%;
	height:45px;
	cursor:pointer;
	margin-right: 40px;
}
#btndelete:hover{
	filter: brightness(95%);
}
#all{
	color:white;
	font-size: 15px;
	background-color: rgba(110, 131, 118, 0.85);
	padding: 9px;
	margin-top: -10px;
	border: none;
	border-radius: 5px;
	width: 20%;
	height:45px;
	cursor:pointer;
}
#all:hover{
	filter: brightness(95%);
}
#my-wish{
	color:white;
	font-size: 15px;
	background-color: rgba(110, 131, 118, 0.85);
	padding: 9px;
	margin-top: -10px;
	border: none;
	border-radius: 5px;
	width: 20%;
	height:45px;
	cursor:pointer;
}
#my-wish:hover{
	filter: brightness(95%);
}
.menu{
	height: 55px;
}
/*가로 슬라이드*/
.menu-v2{
	left:384px;
	width:193px;
	position:relative;
}
#my-write{
	color:white;
	font-size: 15px;
	background-color: rgba(110, 131, 118, 0.85);
	padding: 9px;
	margin-top: -10px;
	border: none;
	border-radius: 5px;
	width:193px;
	height:45px;
	cursor:pointer;
}
#my-write:hover{
	filter: brightness(95%);
}
.submenu{
	position:absolute;
	width:193px;
	left:0px;
	top:35px;
	display:none;
	border:1px solid white;
	box-shadow: 2px 2px 7px gray;
	border-radius:10px;
	height:120px;
	background-color:white;
}
.submenu2{
	margin-top:25px;
	height: 30px;
	font-size: 15px;
	cursor:pointer;
}
.submenu2:hover{
	color: gray;
}
/*li*/
.page-content li{
	font-size: 20px;
	list-style: none;
	
}
</style>    
<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/member.js"></script>
<div class="page" style="height: 775px;">
	<div class="align-center" style="width: 50%; float:left; padding-top: 65px;">
		<div class="menu">
		<input type="button" value="전체주문내역" id="all" onclick="location.href='#'">
		</div>
		<div class="menu">
		<input type="button" value="나의 관심" id="my-wish" onclick="location.href='${pageContext.request.contextPath}/cart/wishList.do'">
		</div>
		<div id="nav-v2">
			<div class="menu-v2"><input type="button" value="내가 쓴 글" id="my-write" onclick="location.href='#'">
				<div class="submenu">
					<div class="submenu2">
						<a href="${pageContext.request.contextPath}/faq/qnalist.do">문의/답변</a>
					</div>
					<div class="submenu2">
						<a href="#">상품평</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="mypage-div" style="box-shadow: 2px 2px 7px gray; border:1px solid white; border-radius:10px; width:35%; height:600px; background-color:white; padding-top:30px; padding-top:30px; margin-top: 50px; margin-left: -250px;">
		<div style="padding-left: 20px;">
			<h2>${member.mem_name}님 회원상세정보</h2>
		</div>
		<hr width="100%" noshade="noshade" size="1px">
		<div class ="page-content"style="height: 470px;">
			<div class="page-content01" style="width: 25%; float:left; padding-left: 5%;">
				<ul>
					<li>이름</li><br>
					<li>전화번호</li><br>
					<li>이메일</li><br>
					<li>가입날짜</li><br>
					<c:if test="${!empty member.modify_date}">
					<li>정보 수정일</li><br>
					</c:if>
					<li>우편번호</li><br>
					<li>주소</li><br>
					<li>상세주소</li><br>
				</ul>
			</div>
			<div class ="page-content02" style="width: 65%; float:left;">
				<ul>
					<li>${member.mem_name}</li><br>
					<c:if test="${!empty member.mem_cell}"><li>${member.mem_cell}</li><br></c:if>
					<c:if test="${empty member.mem_cell}"><li style="color : gray;">전화번호를 등록해주세요.</li><br></c:if>
					<li>${member.mem_email}</li><br>
					<li>${member.reg_date}</li><br>
					<c:if test="${!empty member.modify_date}">
					<li>${member.modify_date}</li><br>
					</c:if>
					<c:if test="${!empty member.zipcode}"><li>${member.zipcode} <b style="color:blue;">[대표배송지]</b></li><br></c:if>
					<c:if test="${empty member.zipcode}"><li style="color : gray;">우편번호를 등록해주세요.</li><br></c:if>
					<c:if test="${!empty member.address1}"><li>${member.address1}</li><br></c:if>
					<c:if test="${empty member.address1}"><li style="color : gray;">주소를 등록해주세요.</li><br></c:if>
					<c:if test="${!empty member.address2}"><li>${member.address2}</li><br></c:if>
					<c:if test="${empty member.address2}"><li style="color : gray;">상세주소를 등록해주세요.</li><br></c:if>
				</ul>
			</div>
		</div>
		<div class="align-right">
			<input type="button" value="회원정보수정" id="btnmodify" onclick="location.href='update.do'">
			<input type="button" value="비밀번호변경" id="btnupdate" onclick="location.href='updatepw.do'">
			<input type="button" value="회원탈퇴" id="btndelete" onclick="location.href='delete.do'">
		</div>
	</div>
</div>
<!-- 내용 끝 -->
<script>
//script.js
$(document).ready(function(){	
	//menu v2
	$(".menu-v2").mouseover(function(){
		$(this).children(".submenu").show(400);
	});
	$(".menu-v2").mouseleave(function(){
		$(this).children(".submenu").hide(200);
	});
	
});
</script>


