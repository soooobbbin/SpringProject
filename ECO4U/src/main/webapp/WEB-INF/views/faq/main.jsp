<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 내용 시작 -->
<style>
h1{
	padding-top: 100px;
	font-size:25pt;
}
p{
	font-size:12pt;
	color:darkgray;
}
.move{
	margin-top:4%;
	margin-left:31%;
}
.faq_main{
	float:left;
	margin-right:10%;
	color:darkgreen;
}
#img01,#img02,#img03{
	width:50px;
	height:50px;
	cursor:pointer;
}
figcaption{
	font-size:12pt;
	font-weight:bold;
	margin-top:10px;
}
/* chatbot */
.chatbot{
	display:none;
}
#chatbot_btn_open img{
	width:100px;
	height:100px;
}
.chatbot_pop_wrap{
	position:fixed; 
	top:37%; 
	right:18%; 
	width:10px;
	height:10px; 
	text-align:left;
}
.chatbot_pop_wrap:after{
	display:inline-block;
	height:100%; 
	vertical-align:middle; 
	content:'';
}
.chatbot_pop_wrap .chatbot_pop_inner{
	display:inline-block; 
	padding:20px 30px; 
	background: rgba(250,249,248); 
	width:280px;
	height:400px; 
	vertical-align:middle; 
	font-size:15px;
	border-radius: 30px;
	box-shadow: 2px 2px 7px gray;
	box-sizing: initial;
}
.chatbot_pop_head{
	width: 90%;
	height: 15%;
}
.chatbot_pop_head > img{
	width: 20%;
	height: 90%;
	float:left;
}
.chatbot_pop_head_title{
	width: 80%;
	height: 50%;
	margin-top:4%;
	float:left;
	font-size:25px;
	font-weight: bold;
}
.chatbot_pop_head > .chatbot_btn_close{
	width: 15%;
	height: 20%;
	margin-top:10%;
	float:left;
}
.chatbot_btn_close{
	height: 5%;
	border: none;
	cursor: pointer;
	background: none;
	color : blue;
	text-align: right;
	width: 100%;
	font-size: 15px;
}
chatbot_btn_close:focus{
	border: none;
	outline:none;
}
.chatbot_pop_head_txt{
	width: 110%;
	padding-top: 55px;
	color: gray;
}
.chatbot_pop_main{
	width: 80%;
	height: 45%;
	margin-top: 60px;
	padding:20px 30px; 
	background:white; 
	border-radius: 30px;
	font-size:15px;
	box-sizing: initial;
}
.chatbot_pop_main_title{
	font-size:18px;
	font-weight: bold;
}
.chatbot_pop_foot1{
	width: 39%;
	margin-top: 14px;
	color : green;
	float: left;
	text-align: right;
	font-size: 5px;
}
.chatbot_pop_foot2{
	width: 50%;
	margin-left: 12px;
	margin-top: 12px;
	color : gray;
	float: left;
}
</style>
<div class="page-main align-center">
	<h1>ECO4U 고객센터 스마트봇입니다.</h1>
	<p>궁금한 서비스를 선택해주세요.</p>
	<!-- 챗봇 -->
	<div class="chatbot2">
	<div class="chatbot_wrap">
		<a href="#chatbot_pop_info_1" class="chatbot_btn_open" id="chatbot_btn_open">
			<img src="${pageContext.request.contextPath}/images/chatbot.png" id="chatbot">
		</a>
	    
		<div id="chatbot_pop_info_1" class="chatbot_pop_wrap" style="display:none;">
			<div class="chatbot_pop_inner">
			<button type="button" class="chatbot_btn_close">X</button>
				<div class="chatbot_pop_head">
					<img src="${pageContext.request.contextPath}/images/main_logo.png" class="chatbot_pop_img">
					<div class="chatbot_pop_head_title">ECO4U</div> 
					<div class="chatbot_pop_head_txt">친환경 쇼핑몰 ECO4U입니다. 궁금한 점을 문의해주세요.</div>
				</div>
				<div class="chatbot_pop_main">
					<div class="chatbot_pop_main_title">ECO4U</div> 
					안녕하세요 <img src="${pageContext.request.contextPath}/images/member/member_smaller.svg" width="20" height="20"><br>
					아래 버튼을 통해 카카오채널을 <br> 등록한 후 챗봇을 이용해주세요.<br><br><br>
					<div class="align-center" style="margin-top: -20px">	
						<div id="kakao-talk-channel-chat-button" data-channel-public-id="_Zxfxmxdxj" data-title="consult" data-size="large" data-color="yellow" data-shape="pc" data-support-multiple-densities="true"></div>
					</div>
				</div>
					<div class="chatbot_pop_foot1">● </div><div class="chatbot_pop_foot2"> 챗봇 대기중</div>
			</div>
			</div>
		</div>
	</div>
	
	<p>아이콘 선택 시 해당 서비스로 이동합니다.</p>
	<p style="font-size:10pt;">※ 문의는 로그인 후 사용가능합니다. ※</p>
	
	<div class="move">
		<figure class="faq_main">
		<img id="img01" src="../images/faq/question.png" onclick="location.href='faqlist.do'">
		<figcaption>자주찾는질문</figcaption>
		</figure>
		<figure class="faq_main">
		<img id="img02" src="../images/faq/messenger.png" onclick="location.href='qnawrite.do'">
		<figcaption>1:1문의등록</figcaption>
		</figure>
		<figure class="faq_main">
		<img id="img03" src="../images/faq/list.png"
		<c:if test="${empty user || user.auth == 1}">
		onclick="location.href='qnalist.do'"</c:if>
		<c:if test="${user.auth == 2}">
		onclick="location.href='qnamanagementlist.do'"</c:if>>
		<figcaption>1:1문의내역</figcaption>
		</figure>
	</div>
</div>
<script>
	const btn1 = document.getElementById('chatbot_btn_open');
	var target = document.querySelectorAll('.chatbot_btn_open');
	var btnPopClose = document.querySelectorAll('.chatbot_pop_wrap .chatbot_btn_close');
	var targetID;
	
	// 팝업 열기
	for(var i = 0; i < target.length; i++){
	  target[i].addEventListener('click', function(){
	    targetID = this.getAttribute('href');
	    document.querySelector(targetID).style.display = 'block';
	  });
	}
	
	// 팝업 닫기
	for(var j = 0; j < target.length; j++){
	  btnPopClose[j].addEventListener('click', function(){
	    this.parentNode.parentNode.style.display = 'none';
	    target.style.display = 'block';
	  });
	
	//카카오채널이동  
	window.kakaoAsyncInit = function() {
		Kakao.Channel.createChatButton({
			container: '#kakao-talk-channel-chat-button',
			});
		};

		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id)) return;
		    js = d.createElement(s); js.id = id;
		    js.src = 'https://developers.kakao.com/sdk/js/kakao.channel.min.js';
		    fjs.parentNode.insertBefore(js, fjs);
		})(document, 'script', 'kakao-js-sdk');
}
</script>
<!-- 내용 끝 -->