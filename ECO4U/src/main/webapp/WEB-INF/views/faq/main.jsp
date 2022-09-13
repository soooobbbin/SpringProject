<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 내용 시작 -->
<style>
h1{
	padding-top: 100px;
	font-size:25pt;
}
#chatbot{
	display:none;
}
#chatbot2{
	padding:50px;
}
p{
	font-size:12pt;
	color:darkgray;
}
.move{
	width:680px;
	margin:50px auto;
}
.faq_main{
	float:left;
	margin:0px 70px;
	color:darkgreen;
}
#img01,#img02,#img03{
	width:50px;
	height:50px;
}
figcaption{
	font-size:12pt;
	font-weight:bold;
	margin-top:10px;
}
</style>
<div class="page-main align-center">
	<h1>ECO4U 고객센터 스마트봇입니다.</h1>
	<p>궁금한 서비스를 선택해주세요.</p>
	<a href="${pageContext.request.contextPath}/chatbot/main.do">
		<img src="${pageContext.request.contextPath}/images/chatbot.png" id="chatbot2">
	</a>
	<p>아이콘 선택 시 해당 서비스로 이동합니다.</p>
	<div class="move">
		<figure class="faq_main">
		<img id="img01" src="../images/faq/question.png" onclick="location.href='faqlist.do'">
		<figcaption>FAQ</figcaption>
		</figure>
		<figure class="faq_main">
		<img id="img02" src="../images/faq/messenger.png" onclick="location.href='qnawrite.do'">
		<figcaption>1:1문의 등록</figcaption>
		</figure>
		<figure class="faq_main">
		<img id="img03" src="../images/faq/list.png" onclick="location.href='qnalist.do'">
		<figcaption>1:1문의 내역</figcaption>
		</figure>
	</div>
</div>
<!-- 내용 끝 -->