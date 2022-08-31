<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style>
#id{
	width:70%;
	font-size: 15px;
}
#mem_name{
	font-size: 15px;
}
#mem_pw{
	font-size: 15px;
}
#mem_cell{
	font-size: 15px;
}
#mem_eamil{
	font-size: 15px;
}
.zipcode{
	font-size: 15px;
}
.address1{
	font-size: 15px;
}
.address2{
	font-size: 15px;
}
#sub_btn{
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
#confirmId{
	color:white;
	font-size: 11px;
	background-color: gray;
	padding: 9px;
	margin-top: -10px;
	border: none;
	border-radius: 5px;
	width: 20%;
	cursor:pointer;
}
#confirmzipcode{
	color:white;
	font-size: 11px;
	background-color: gray;
	padding: 9px;
	margin-top: -10px;
	border: none;
	border-radius: 5px;
	width: 20%;
	cursor:pointer;
}
/*체크 박스*/
.checks {
	position: relative;
	margin-left: 40px;
	margin-top: 30px;
}
.checks input[type="checkbox"] {  /* 실제 체크박스는 화면에서 숨김 */
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip:rect(0,0,0,0);
  border: 0
}
.checks input[type="checkbox"] + label {
  display: inline-block;
  position: relative;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
}
.checks input[type="checkbox"] + label:before {  /* 가짜 체크박스 */
  content: ' ';
  display: inline-block;
  width: 21px;  /* 체크박스의 너비를 지정 */
  height: 21px;  /* 체크박스의 높이를 지정 */
  line-height: 21px; /* 세로정렬을 위해 높이값과 일치 */
  margin: -2px 8px 0 0;
  text-align: center; 
  vertical-align: middle;
  background: #fafafa;
  border: 1px solid #cacece;
  border-radius : 3px;
  box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05);
}
.checks input[type="checkbox"] + label:active:before,
.checks input[type="checkbox"]:checked + label:active:before {
  box-shadow: 0 1px 2px rgba(0,0,0,0.05), inset 0px 1px 3px rgba(0,0,0,0.1);
}
.checks input[type="checkbox"]:checked + label:before {  /* 체크박스를 체크했을때 */ 
  content: '\2714';  /* 체크표시 유니코드 사용 */
  color: #99a1a7;
  text-shadow: 1px 1px #fff;
  background: #e9ecee;
  border-color: #adb8c0;
  box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05), inset 15px 10px -12px rgba(255,255,255,0.1);
}
</style>        
<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/confirmId.js"></script>
<div class="page-main" style="height:1100px;">
	<div class="align-center" style="margin-top: 60px; margin-bottom: 30px;">
		<h1>ECO4U에 오신 것을 환영합니다.</h1>
	</div>
	<form:form id="register_form" action="registerUser.do" modelAttribute="memberVO" style="border:1px solid white; border-radius:10px; width:35%; height:950px; background-color:white;">
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
				<label for="id" id="id" style="margin-top: 25px;">아이디</label><br>
				<input type="button" id="confirmId" value="ID중복체크">
				<span id="message_id"></span>
			</li>
		</ul>
		<ul>
			<li>
			<div style="position:relative;">
				<form:input path="id" placeholder="아이디를 입력해주세요" autocomplete="off" style="width:80%; height:40px; border-radius:5px; border:1px solid gray; padding-left: 2.75rem;"/>
				<form:errors path="id" cssClass="error-color"/>
				<div style="position:absolute; margin-top: -32px; margin-left: 15px">
					<img src="${pageContext.request.contextPath}/images/member/member_id.svg" width="20" height="20">
				</div>
			</div>
			</li>
		</ul>
		<ul>
			<li>
				<label for="mem_name" id="mem_name">이름</label><br>
			</li>
		</ul>
		<ul>
			<li>
			<div style="position:relative;">
				<form:input path="mem_name" placeholder="이름을 입력해주세요" style="width:80%; height:40px; border-radius:5px; border:1px solid gray; padding-left: 2.75rem;"/>
				<form:errors path="mem_name" cssClass="error-color"/>
				<div style="position:absolute; margin-top: -32px; margin-left: 15px">
					<img src="${pageContext.request.contextPath}/images/member/member_name.svg" width="20" height="20">
				</div>
			</div>
			</li>
		</ul>
		<ul>
			<li>
				<label for="mem_pw" id="mem_pw">비밀번호</label><br>
			</li>
		</ul>
		<ul>
			<li>
			<div style="position:relative;">
				<form:input path="mem_pw" placeholder="비밀번호를 입력해주세요" style="width:80%; height:40px; border-radius:5px; border:1px solid gray; padding-left: 2.75rem;"/>
				<form:errors path="mem_pw" cssClass="error-color"/>
				<div style="position:absolute; margin-top: -32px; margin-left: 15px">
					<img src="${pageContext.request.contextPath}/images/member/member_pw.svg" width="20" height="20">
				</div>
			</div>
			</li>
		</ul>
		<ul>
			<li>
				<label for="mem_cell" id="mem_cell">전화번호</label><br>
			</li>
		</ul>
		<ul>
			<li>
			<div style="position:relative;">
				<form:input path="mem_cell" placeholder="전화번호를 입력해주세요" style="width:80%; height:40px; border-radius:5px; border:1px solid gray; padding-left: 2.75rem;"/>
				<form:errors path="mem_cell" cssClass="error-color"/>
				<div style="position:absolute; margin-top: -32px; margin-left: 15px">
					<img src="${pageContext.request.contextPath}/images/member/member_cell.svg" width="20" height="20">
				</div>
			</div>
			</li>
		</ul>
		<ul>
			<li>
				<label for="mem_email" id="mem_eamil">이메일</label><br>
			</li>
		</ul>
		<ul>
			<li>
			<div style="position:relative;">
				<form:input path="mem_email" placeholder="이메일을 입력해주세요" style="width:80%; height:40px; border-radius:5px; border:1px solid gray; padding-left: 2.75rem;"/>
				<form:errors path="mem_email" cssClass="error-color"/>
				<div style="position:absolute; margin-top: -32px; margin-left: 15px">
					<img src="${pageContext.request.contextPath}/images/member/member_email.svg" width="20" height="20">
				</div>
			</div>
			</li>
		</ul>
		<ul>
			<li>
				<label for="zipcode" class="zipcode" style="margin-top: 25px; width: 70%;">우편번호</label><br>
				<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" id="confirmzipcode">
			</li>
		</ul>
		<ul>
			<li>
			<div style="position:relative;">
				<form:input path="zipcode" placeholder="우편번호" style="width:80%; height:40px; border-radius:5px; border:1px solid gray; padding-left: 2.75rem;"/>
				<form:errors path="zipcode" cssClass="error-color"/>
				<div style="position:absolute; margin-top: -32px; margin-left: 15px">
					<img src="${pageContext.request.contextPath}/images/member/member_zipcode.svg" width="20" height="20">
				</div>
			</div>
			</li>
		</ul>
		<ul>
			<li>
				<label for="address1" class="address1">주소</label><br>
			</li>
		</ul>
		<ul>
			<li>
			<div style="position:relative;">
				<form:input path="address1" placeholder="주소를 입력해주세요" style="width:80%; height:40px; border-radius:5px; border:1px solid gray; padding-left: 2.75rem;"/>
				<form:errors path="address1" cssClass="error-color"/>
				<div style="position:absolute; margin-top: -32px; margin-left: 15px">
					<img src="${pageContext.request.contextPath}/images/member/member_address.svg" width="20" height="20">
				</div>
			</div>
			</li>
		</ul>
		<ul>
			<li>
				<label for="address2" class="address2">상세주소</label><br>
			</li>
		</ul>
		<ul>
			<li>
			<div style="position:relative;">
				<form:input path="address2" placeholder="상세주소를 입력해주세요" style="width:80%; height:40px; border-radius:5px; border:1px solid gray; padding-left: 2.75rem;"/>
				<form:errors path="address2" cssClass="error-color"/>
				<div style="position:absolute; margin-top: -32px; margin-left: 15px">
					<img src="${pageContext.request.contextPath}/images/member/member_address.svg" width="20" height="20">
				</div>
			</div>
			</li>
		</ul>
		<div class="checks">
  			<input type="checkbox" id="ex_chk"> 
  			
		</div>
		<div class="align-center">
			<form:button id="sub_btn">회원가입</form:button>
		</div>                           
	</form:form>
</div>
<!-- 우편번호 검색 시작 -->
<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address1').value = fullAddr;
                //document.getElementById('sample2_addressEnglish').value = data.addressEnglish;

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
</script>
<!-- 우편번호 검색 끝 -->
<!-- 내용 끝 -->

