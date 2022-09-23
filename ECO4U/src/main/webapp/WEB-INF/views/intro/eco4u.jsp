<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 내용 시작 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/store.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/store.js"></script>
<div class="page-main2">
		<h1 style="font-size:25pt;" class="align-center">ECO4U 소개</h1>
		<img src="${pageContext.request.contextPath}/images/intro/ecofriendly.png" id="ecofriendly">
	<div class="eco4u_intro">
		<span>
		환경 문제 해결을 위해 노력해 왔지만 코로나19 이후 
		플라스틱 사용이 급증하면서 <br>다시금 환경을 위협하고 있다. 
		환경 문제는 곧 우리의 건강과 직결된다. <br><p style="font-size:15pt;font-style: oblique;">우리를 위한 친환경!</p>
		친환경 프로젝트에 동참하고 업사이클/비건 제품을 사용하면서 
		나 자신과 지구를 지켜요.
		</span>
	</div>
	<!-- 찜 목록에 상품이 담긴 경우 -->
	<table class="eco4u-category">
		<tr>
		<td id="zero">제로웨이스트</td>
		<td id="up">업사이클링</td>
		<td id="fair">공정무역</td>
		<td id="vegan">비건</td>
		</tr>
	</table>
	<div class="zero" style="display:none;">
		<img src="${pageContext.request.contextPath}/images/intro/zerowaste.jpg" id="zerowaste">
		<span>
		<mark>제로웨이스트</mark>는 숫자인 ‘0(제로)’와 쓰레기를 뜻하는 ‘waste’가 합쳐져, 쓰레기가 하나도 없게 만들자는 뜻을 가지고 있습니다. 일회용품 컵, 비닐봉지 등 썩지 않는 쓰레기를 줄여 쓰레기 생산을 최소화하자는 생활습관입니다. 
		<br><br>
		즉, 모든 제품이 재사용될 수 있도록 장려하며 폐기물을 방지하는 데 초점을 맞춘 것이 원칙입니다. 쓰레기 매립지나 소각장, 바다로 쓰레기를 흘려보내지 않는 것이 목표입니다. 환경오염과 지구 온난화 등 환경에 대한 관심이 증대되고 있고, 경각심도 커지면서 환경을 보호하려는 움직임의 일종입니다. 
		<br><br>
		<b>제로웨이스트 실천방법</b><br>
		<ul>
			<li> 먹지 않는 반찬, 일회용품 등은 받지 않기</li>		
			<li> 종이 영수증, 우편 발급받지 않기 </li>		
			<li> 외출 시 텀블러 준비하기</li>		
			<li> 장바구니 사용하기</li>		
			<li> 다회용품 사용하기</li>		
			<li> 분리 수거 철저히 하기</li>		
			<li> 필요한 물건만 구매하기 </li>		
		</ul>
		</span>
	</div>
	<div class="up" style="display:none;">
		<img src="${pageContext.request.contextPath}/images/intro/upcycle.jpg" id="upcycle">
		<span>
		<mark>업사이클링</mark>이란 업그레이드(upgrade)와 리사이클링(recycling)의 합성어로 버려진 물건을 재활용해 더 가치 있는 제품으로 만드는 '새활용'을 말합니다. 상품에 디자인과 가치를 더해 새로운 쓸모를 갖게 한다는 점에서 유의미할 뿐 아니라, 기존의 새 물건을 생산하고 구매하는 소비 시장을 대신할 수 있다는 점에서 친환경적입니다. 
		<br><br>
		업사이클링 브랜드마다 재활용하는 소재들이 정해져 있고 그 자체를 콘셉트로 내세우며 디자인에 반영하는 식이다. 내구성이 좋은 소재들을 활용해 가방, 지갑 등의 잡화를 만드는 패션 브랜드들이 주요하다.
		<br>그 외에 푸드 업사이클링도 주목할 만하다. 리하베스트(RE:harvest)는 맥주 및 식혜의 부산물을 활용해 영양바인 '리너지바(RE:nergy bar)'를 만들었다. 라이프스타일 브랜드 '소나이트(SONITE)'는 농업 과정에서 버려지는 벼 껍질을 활용해 트레이, 코스터 등의 제품을 선보이고 있다. 음식물 쓰레기가 전 세계 온실가스 배출량의 약 10%를 차지하는 만큼 기대되는 분야 중 하나다.
		</span>
	</div>
	<div class="fair" style="display:none;">
		<img src="${pageContext.request.contextPath}/images/intro/fairtrade.jpeg" id="fairtrade">
		<span>
		<mark>공정무역</mark>이란 저개발국의 생산자와 노동자가 만든 물건을 공정한가격에 거래함으로써 그들의 경제적 자립을 돕고, 소비자에게는 윤리적·환경적 기준에 부합하는
		좋은 제품을 제공하는 전 세계적 시민운동이자 사회적기업 & 협동조합 운동입니다.
		<br><br>
		세계공정무역기구(World Fair Trade Organization)는 공정무역제품을 다음과 같이 정의하고 있습니다. “공정무역제품이란 공식적으로 인증된 공정무역제품 수입업체, WFTO회원, IMS(국제감사기구) 생산자, 수입업자에 의해 개발 및 생산되는 모든 제품을 의미합니다."
		<br><br>
		공정무역은 세계무역시장에서 공정하지 못한 무역 관행을 개선하고자 하는 노력에서 시작되었습니다. 정의(Justice), 공정성(Equity), 지속가능한발전(Sustainable Development)은 공정무역 구조의 핵심입니다. 이를 통해 모든 사람들이 생계를 유지하고 더 나아가 각자의 잠재력을 최대한 개발할 수 있도록 하는 것이 공정무역의 목표입니다.
		</span>
	</div>
	<div class="vegan" style="display:none;">
		<img src="${pageContext.request.contextPath}/images/intro/vegan.jpg" id="vegan">
		<span>
		  최근 많은 관심을 받고 있는 <mark>비거니즘</mark><small>(Veganism)</small>은 모든 동물성 제품사용을 거부하는 하나의 문화로서 육식뿐만 아니라 동물의 부산물이 포함된 상품, 동물 실험을 통한 제품 및 서비스에 대한 사용을 금하고 동물복지를 실천하는 문화입니다. 이와 관련된 라이프 스타일을 비거니즘(veganism), 실천하는 사람을 비건(vegan)이라고 명명했습니다.
		  <br><br>
		 현재 비건의 범위는 음식, 패션, 액세서리, 화장품 등의 생활용품까지 라이프 스타일을 추구하는 개념으로 발전되고 있습니다. 
  		패션 분야와 관련된 비건 제품은 좁은 의미에서 모피, 가죽, 실크, 울 등 동물로부터 나오는 그 어떤 소재도 사용하지 않는 것부터 넓게는 친환경 소재나 100% 재생 물질을 사용하고, 생산 환경과 노동자를 생각한 윤리적 소비를 행하는 것까지 의미합니다.
  		<br><br>
  		<b>한국비건인증원에서 제시하는 비건 제품 인증 기준</b><br>
		<ul>
			<li> 동물 유래 원재료 사용금지</li>		
			<li> 동물실험 금지 </li>		
			<li> 제품 생산공정 전 중 후 교차 오염 금지</li>		
		</ul>
		</span>
	</div>
</div>
<!-- 내용 끝 -->