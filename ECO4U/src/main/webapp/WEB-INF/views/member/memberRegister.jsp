<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style>
#label_id{
	width:15%;
	font-size: 15px;
}
#mem_name{
	width:15%;
	font-size: 15px;
}
#mem_pw{
	width:15%;
	font-size: 15px;
}
#mem_cell{
	width:15%;
	font-size: 15px;
}
#mem_email{
	width:15%;
	font-size: 15px;
}
.zipcode{
	font-size: 15px;
}
#zipcode{
	font-size: 15px;
}
.address1{
	font-size: 15px;
}
#address1{
	font-size: 15px;
}
#address2{
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
#sub_btn:hover{
	filter: brightness(95%);
}
#confirmId{
	color:white;
	font-size: 13px;
	background-color: gray;
	padding: 7px;
	margin-top: -9px;
	border: none;
	border-radius: 5px;
	width: 20%;
	height:45px;
	font-weight: bold;
	cursor:pointer;
}
#confirmId:hover{
	filter: brightness(95%);
}
#confirmzipcode{
	color:white;
	font-size: 13px;
	background-color: gray;
	padding: 9px;
	margin-top: -10px;
	border: none;
	border-radius: 5px;
	width: 20%;
	height:45px;
	font-weight: bold;
	cursor:pointer;
}
#confirmzipcode:hover{
	filter: brightness(95%);
}
.btn_close{
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
.btn_close:hover{
	filter: brightness(95%);
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
/*팝업창*/
.btn_open{
	margin:5px; 
	padding:2px 3px; 
}
.pop_wrap{
	position:fixed; 
	top:0; 
	left:0; 
	right:0; 
	bottom:0; 
	background:rgba(0,0,0,.5); 
	font-size:0; 
	text-align:center;
}
.pop_wrap:after{
	display:inline-block; 
	height:100%; 
	vertical-align:middle; 
	content:'';
}
.pop_wrap .pop_inner{
	display:inline-block; 
	padding:20px 30px; 
	background:#fff; 
	width:60%;
	height:85%; 
	vertical-align:middle; 
	font-size:15px;
	border-radius: 10px;
}
input:focus {
	outline : 3px solid rgba(110, 131, 118, 0.45);
	border : none;
}
</style>        
<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/confirmId.js"></script>
<div class="page-main">
	<div class="align-center" style="margin-top: 60px; margin-bottom: 30px;">
		<h1>ECO4U에 오신 것을 환영합니다.</h1>
	</div>
	<form:form id="register_form" action="registerUser.do" modelAttribute="memberVO" style="box-shadow: 2px 2px 7px gray; border:1px solid white; border-radius:10px; width:35%; height:900px; background-color:white; padding-top:30px;">
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
				<label for="id" id="label_id">아이디</label>
				<span id="message_id"></span>
				<form:errors path="id" cssClass="error-color"/><br>
			</li>
		</ul>
		<ul>
			<li>
			<div style="position:relative;">
				<form:input path="id" placeholder="아이디를 입력해주세요" autocomplete="off" style="width:60%; height:40px; border-radius:5px; border:1px solid gray; padding-left: 2.75rem;"/>
				<input type="button" id="confirmId" value="ID중복체크">
				<div style="position:absolute; margin-top: -32px; margin-left: 15px">
					<img src="${pageContext.request.contextPath}/images/member/member_id.svg" width="20" height="20">
				</div>
			</div>
			</li>
		</ul>
		<ul>
			<li>
				<label for="mem_name" id="mem_name">이름</label>
				<form:errors path="mem_name" cssClass="error-color"/><br>
			</li>
		</ul>
		<ul>
			<li>
			<div style="position:relative;">
				<form:input path="mem_name" placeholder="이름을 입력해주세요" style="width:80%; height:40px; border-radius:5px; border:1px solid gray; padding-left: 2.75rem;"/>
				<div style="position:absolute; margin-top: -32px; margin-left: 15px">
					<img src="${pageContext.request.contextPath}/images/member/member_name.svg" width="20" height="20">
				</div>
			</div>
			</li>
		</ul>
		<ul>
			<li>
				<label for="mem_pw" id="mem_pw">비밀번호</label>
				<form:errors path="mem_pw" cssClass="error-color"/><br>
			</li>
		</ul>
		<ul>
			<li>
			<div style="position:relative;">
				<form:input path="mem_pw" placeholder="비밀번호를 입력해주세요" autocomplete="off" style="width:80%; height:40px; border-radius:5px; border:1px solid gray; padding-left: 2.75rem;"/>
				<div style="position:absolute; margin-top: -32px; margin-left: 15px">
					<img src="${pageContext.request.contextPath}/images/member/member_pw.svg" width="20" height="20">
				</div>
			</div>
			</li>
		</ul>
		<ul>
			<li>
				<label for="mem_cell" id="mem_cell">전화번호</label>
				<form:errors path="mem_cell" cssClass="error-color"/><br>
			</li>
		</ul>
		<ul>
			<li>
			<div style="position:relative;">
				<form:input path="mem_cell" placeholder="전화번호를 입력해주세요" style="width:80%; height:40px; border-radius:5px; border:1px solid gray; padding-left: 2.75rem;"/>
				<div style="position:absolute; margin-top: -32px; margin-left: 15px">
					<img src="${pageContext.request.contextPath}/images/member/member_cell.svg" width="20" height="20">
				</div>
			</div>
			</li>
		</ul>
		<ul>
			<li>
				<label for="mem_email" id="mem_eamil">이메일</label>
				<form:errors path="mem_email" cssClass="error-color"/><br>
			</li>
		</ul>
		<ul>
			<li>
			<div style="position:relative;">
				<form:input path="mem_email" placeholder="이메일을 입력해주세요" style="width:80%; height:40px; border-radius:5px; border:1px solid gray; padding-left: 2.75rem;"/>
				<div style="position:absolute; margin-top: -32px; margin-left: 15px">
					<img src="${pageContext.request.contextPath}/images/member/member_email.svg" width="20" height="20">
				</div>
			</div>
			</li>
		</ul>
		<ul>
			<li>
				<label for="zipcode" class="zipcode" style="width: 15%;">우편번호</label>
				<form:errors path="zipcode" cssClass="error-color"/><br>
			</li>
		</ul>
		<ul>
			<li>
			<div style="position:relative;">
				<form:input path="zipcode" placeholder="우편번호" autocomplete="off" style="width:60%; height:40px; border-radius:5px; border:1px solid gray; padding-left: 2.75rem;"/>
				<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" id="confirmzipcode">
				<div style="position:absolute; margin-top: -32px; margin-left: 15px">
					<img src="${pageContext.request.contextPath}/images/member/member_zipcode.svg" width="20" height="20">
				</div>
			</div>
			</li>
		</ul>
		<ul>
			<li>
				<label for="address1" class="address1" style="width: 15%;">주소</label>
				<form:errors path="address1" cssClass="error-color"/><br>
			</li>
		</ul>
		<ul>
			<li>
			<div style="position:relative;">
				<form:input path="address1" placeholder="주소를 입력해주세요" autocomplete="off" style="width:80%; height:40px; border-radius:5px; border:1px solid gray; padding-left: 2.75rem;"/>
				<div style="position:absolute; margin-top: -32px; margin-left: 15px">
					<img src="${pageContext.request.contextPath}/images/member/member_address.svg" width="20" height="20">
				</div>
			</div>
			</li>
		</ul>
		<ul>
			<li>
				<label for="address2" class="address2" style="width: 15%;">상세주소</label>
				<form:errors path="address2" cssClass="error-color"/><br>
			</li>
		</ul>
		<ul>
			<li>
			<div style="position:relative;">
				<form:input path="address2" placeholder="상세주소를 입력해주세요" style="width:80%; height:40px; border-radius:5px; border:1px solid gray; padding-left: 2.75rem;"/>
				<div style="position:absolute; margin-top: -32px; margin-left: 15px">
					<img src="${pageContext.request.contextPath}/images/member/member_address.svg" width="20" height="20">
				</div>
			</div>
			</li>
		</ul>
		<div class="checks">
  			<input type="checkbox" id="ex_chk" name="ex_chk"> 
  			<label for="ex_chk" style="width: 18%; font-weight: bold;">동의하기</label>  <a href="#pop_info_1" class="btn_open" style="cursor:pointer; color:#558B2F">이용약관</a> , <a href="#pop_info_2" class="btn_open" style="cursor:pointer; color:#558B2F">개인정보 수집 및 이용</a> 동의(필수)
  			<!-- 팝업창 시작 -->
  			<div id="pop_info_1" class="pop_wrap" style="display:none;">
          		<div class="pop_inner">
	            	<div class="제1장 총칙">
						<h1>개인정보 수집 및 이용 약관 안내</h1>
					</div>
					<div align="left">
					<b>제1조 [목적]</b><br><br>
						이 약관은 (주)ECO4U(이하 “회사”)이 운영하는 사이트에서 제공하는 “서비스”의 이용과 관련하여 “회사”와 “개인회원”간의 이용조건, 제반 절차, 회원의 권리, 의무 및 책임 사항, 기타 필요한 사항을 규정함을 목적으로 한다.<br><br>
					<b>제2조 [정의]</b><br><br>
						본 약관에서 사용하는 용어의 정의는 다음과 같다.<br>
						① “사이트”라 함은 “회사”가 “개인회원”에게 서비스를 제공하기 위해 단말기(PC, TV, 휴대형 단말기 등의 각종 유무선 장치를 포함) 등 정보 통신 설비를 이용하여 재화 또는 용역을 거래할 수 있도록 설정한 가상의 영업장을 말하며, “회사”가 운영하는 웹사이트가 이에 포함된다.<br>
						② “서비스”라 함은 “회사”의 “사이트”에서 “개인회원”에게 유∙무료로 제공하는 모든 서비스를 일컫는다.<br>
						③ “개인회원”이라 함은 “서비스”를 이용하기 위하여 동 약관에 동의하거나, 카카오 등 연동된 서비스를 통해 “회사”와 이용 계약을 체결한 개인 회원을 말한다.<br>
						④ “ID”라 함은 “개인회원”의 식별과 “개인회원”의 “서비스” 이용을 위하여 가입 시 사용한 이메일 주소를 말한다.<br>
						⑤ “비밀번호”라 함은 “회사”의 "서비스"를 이용하려는 “개인회원”이 이용자 ID를 부여받은 자와 동일인임을 확인하고 회원의 권익을 보호하기 위하여 회원이 선정한 문자와 숫자의 조합을 말한다.<br><br>
					<b>제3조 [약관의 게시 및 개정]</b><br><br>
						① “회사”는 이 약관의 내용과 상호, 사업자등록번호, 대표자의 성명, 영업소 소재지(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호, 전자우편주소, 연락처, 개인정보관리책임자 등을 “개인회원”이 쉽게 알 수 있도록 “사이트”의 초기 화면에 게시 한다. 다만, 약관의 내용은 “개인회원”이 연결화면을 통하여 볼 수 있도록 할 수 있다.<br>
						② "회사"는 약관의 규제 등에 관한 법률, 전기통신기본법, 전기통신사업법, 정보통신망 이용 촉진 및 정보 보호 등에 관한 법률 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있다.<br>
						③ "회사"가 약관을 개정할 경우에는 개정 약관 적용일 최소 7일 전부터 “사이트” 내 초기화면 및 연결화면 등을 통해 게시하고 “개인회원”에게 공지한다. 다만, 약관의 변경이 소비자의 권리, 의무에 중대한 영향을 줄 경우에는 그 적용일 30일 전까지 본문과 같은 방법으로 공지하고 이메일 또는 문자메세지 발송 등의 방법으로 “개인회원”에게 통지한다.<br>
						④ “개인회원”은 변경된 약관에 대해 거부할 권리가 있다. “개인회원”은 변경된 약관이 공지된 지 15일 이내에 거부 의사를 표명할 수 있다. “개인회원”이 거부하는 경우 본 "서비스" 제공자인 "회사"는 15일의 기간을 정하여 "개인회원"에게 사전 통지 후 당해 “개인회원”과의 계약을 해지할 수 있다. 만약, “개인회원”이 15일 이내에 거부 의사를 표시하지 않고 "서비스"를 계속 이용하는 경우에는 동의하는 것으로 간주한다.<br>
					</div>
	            	<button type="button" class="btn_close">닫기</button>
          		</div>
        	</div>
        	<div id="pop_info_2" class="pop_wrap" style="display:none;">
          		<div class="pop_inner">
		            <div class="align-center">
						<h1>개인정보 수집 및 이용 안내</h1>
					</div>
					<div class="align-center">
						<h2>주식회사 ECO4U 개인정보 수집 및 이용 안내</h2>
					</div>
					<div align="left">
					<b>1.개인정보 수집항목 및 이용목적</b><br><br>
					주식회사 ECO4U(이하 “회사”)은 사이트 이용을 위해 필요한 최소한의 범위로 개인정보를 수집합니다. 회사는 이용자의 사전 동의 없이는 이용자의 개인 정보를 공개하지 않으며, 다음과 같은 목적을 위하여 개인정보를 수집하고 이용합니다.<br>
					<br>
					<ul>
						<li>
							1. 서비스 제공
						</li>
						<li>
							견적서·요청서 정보 제공 및 프로필 광고노출, 멤버십 등 기본적인 서비스 제공, 서비스 제공에 관한 계약 체결·유지·이행·관리·개선 및 서비스 제공에 따른 요금 정산 및 컨텐츠 서비스 이용, 구매 및 요금결제, 물품 배송 또는 청구지 등 발송, 이용자 레슨 정보 및 서비스 이용 정보 제공
						</li>
						<br>
						<li>
							2. 회원관리
						</li>
						<li>
							회원제 서비스에 따른 본인 확인, 개인 식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 회원 가입∙유지∙탈퇴 의사 확인, 연령확인, 만 14세 미만 아동 개인정보수집 시 법정 대리인 동의 여부 확인, 법정 대리인 권리행사 시 본인 확인, 법령상 의무 이행, 법령 및 약관 위반 여부에 관한 조사, 고객 센터 운영 불만처리 등 민원 처리, 고지사항 전달, ECO4U보증 금액 지급 시 본인 확인 등
						</li>
						<br>
						<li>
							3. 마케팅 및 광고에 활용
						</li>
						<li>
							신규 서비스(제품) 개발 및 특화, 뉴스레터, 이벤트 등 광고성 정보 전달, 인구통계학적 특성에 따른 서비스 제공 및 광고 게재, 마케팅 및 광고 등에 활용, 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계
						</li>
					</ul><br>
					<b>2. 개인정보의 보유 및 이용기간</b><br>
					<ul>
						<li>
							1. 법령에서 별도로 정하거나 귀하와 별도 합의하는 등의 특별한 사정이 없는 한 이용자가 ECO4U 회원으로서 회사에 제공하는 서비스를 이용하는 동안 또는 제1조에서 정한 목적을 달성할 때까지 회사는 이용자들의 개인정보를 계속적으로 보유하며 서비스 제공 등을 위해 이용합니다.
						</li>
						<br>
						<li>
							2. 이용자의 개인정보는 다음과 같이 개인정보의 수집목적 또는 제공받은 목적이 달성되면 파기하는 것을 원칙으로 합니다. 다만, 회사는 서비스 혼선 방지, 수사기관에 대한 협조, 불량 회원의 부정한 이용의 재발 및 재가입을 방지하고 분쟁 해결을 위하여 이용계약 해지일로부터 6개월간 해당 회원의 이름, 아이디, 연락처, 부정이용 내역(서비스 이용기록, 접속로그, 쿠키, 접속IP정보)을 보관합니다.
						</li>
					</ul>
					</div>
		            <button type="button" class="btn_close">닫기</button>
          		</div>
        	</div>
       	<!-- 팝업창 시작 -->
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
<script>
var target = document.querySelectorAll('.btn_open');
var btnPopClose = document.querySelectorAll('.pop_wrap .btn_close');
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
  });
}
/* 체크 박스 */
$('#register_form').submit(function(event){
	if ($("input:checkbox[name=ex_chk]").is(":checked") == true) {
        //체크가 되어있을때.    
	} else {
        //체크가 안되어있을때.
        alert('이용약관에 동의해주세요');
        return false;
	}
});
</script>
<!-- 내용 끝 -->

