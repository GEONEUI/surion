<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!doctype html>
<html lang="ko">
<%@ include file="../common/front_header.jsp"%>
<style>

/* uvisual */
.usec_visual {
	background: #000;
}

.usec_visual .uvisual {
	width: 100%;
	height: 320px;
	background: url('${cpath}/resources/images/submit.png') center center/cover no-repeat;
	padding: 6rem 0;
	font-size: 3rem;
	color: #fff;
}

/* content */
.content {
	height: 887px;
	background: #fafafa;
	padding-top: 3rem;
}

.suriSize {
	display: flex;
}

.mainForm {
	width: 560px;
	height: 800px;
	background: #fff;
	border-radius: 1rem;
	border: .0625rem solid #e1e1e1;
	padding: 2.4375rem;
	transform: translateY(-6.25rem);
}

.main1 {
	width: 51%;
	padding-right: 2.2rem;
}

.main2 {
	width: 42%;
}

.main2 h3 {
	line-height: 3rem;
}

.main2 h4 {
	margin-bottom: 0.25rem;
	font-size: 1rem;
	line-height: 2.0625rem;
	font-weight: 500;
	letter-spacing: -.025rem;
}

.main2 p {
	margin-bottom: 2.5rem;
	color: #737373;
	font-size: .875rem;
	line-height: 2rem;
	font-weight: 400;
	letter-spacing: -.0125rem;
}

.loading {
	display: flex;
	align-items: center;
}

.loading .bar {
	width: 0%;
	transition: 1s;
	height: 5px;
	background: linear-gradient(to right, #93F9B9, #1D976C);
	margin-right: 5px;
}

.loading span {
	color: #00c7ae;
	font-weight: bold;
}

.first {
	font-size: .75rem;
	color: #737373;
}

.loading div:nth-child(2) {
	width: 3rem;
	color: #00c7ae;
	font-weight: bold;
}

.service {
	font-size: 2rem;
	padding-bottom: 1.5rem;
}

.below {
	padding-top: 3rem;
}

.text-area {
	width: 100%;
	display: flex;
	border: 0.0625rem solid #e7e7e7;
}

.selBtn {
	display: flex;
	justify-content: end;
}

.select {
	padding: 1rem 0 2rem;
}

.nextBtn {
	width: 7.5rem;
	height: 48px;
	border-style: none;
	background: #00c7ae;
	color: #fff;
	font-weight: bold;
	font-size: 1.1rem;
	border-radius: 0.3rem;
	margin-left: 1rem;
}

.prevBtn {
	width: 7.5rem;
	height: 48px;
	border: 0.0625rem solid #e1e1e1;
	background: #fff;
	color: #00c7ae;
	font-weight: bold;
	font-size: 1.1rem;
	border-radius: 0.3rem;
}

.submitBtn {
	width: 7.5rem;
	height: 48px;
	border-style: none;
	background: #00c7ae;
	color: #fff;
	font-weight: bold;
	font-size: 1.1rem;
	border-radius: 0.3rem;
	margin-left: 1rem;
}

.progress {
	width: 100%;
	height: 0.25rem;
	border-radius: 2px;
	box-shadow: none;
	margin: 0;
	flex: 1;
}

.progress {
	appearance: none;
}

.progress::-webkit-progress-bar {
	background: #f0f0f0;
	border-radius: 10px;
	box-shadow: inset 3px 3px 10px #ccc;
}

.progress::-webkit-progress-value {
	border-radius: 10px;
	background: #1D976C;
	background: -webkit-linear-gradient(to right, #93F9B9, #1D976C);
	background: linear-gradient(to right, #93F9B9, #1D976C);
}

.loadingGage {
	padding-left: 15px;
}


.esti {
	display: flex;
	align-items: center;
}

.aa {
	color: rgb(122, 122, 122);
	font-size: 1.5rem;
	margin-right: 1rem;
}

.lastTitle {
	width: 28rem;
	margin-bottom: 1rem;
	border-style: none;
}

.lastContent {
	width: 28rem;
	height: 15rem;
	margin-bottom: 1.5rem;
	border-style: none;
}

.lastEstimate {
	padding-left: 7px;
	border-style: none;
}

.imageUpload {
	width: 45%;
	margin-bottom: 1rem;
}

.imageForm {
	display: flex;
	align-items: center;
}

.imageText {
	color: red;
	font-size: 13px;
	padding-bottom: 16px;
}

/* 견적 협의 창에서 있는 협의 체크 버튼 */
/* input[checkbox] 디폴트 display가 none이기 때문에 강제로 block 시킴 */
.confer {
	display: block !important;
	margin-right: 5px;
}

.labelConfer {
	display: flex;
	padding-left: 17px;
}

/* input css */
input[type="checkbox"] {
	display: none;
}

input[type="checkbox"]+label {
	display: flex;
	align-items: center;
	height: 4rem;
	width: 100%;
	cursor: pointer;
	padding-left: 1rem;
}

input[type="checkbox"]+label span {
	width: 20px;
	height: 20px;
	position: relative;
	background: url("${cpath}/resources/images/checkbox.svg") center center/contain
		no-repeat;
}

input[type="checkbox"]+label div {
	padding-left: 1rem;
	font-size: 1.2rem;
}

input[type="checkbox"]:checked+label span::after {
	content: "";
	font-size: 25px;
	width: 20px;
	height: 20px;
	text-align: center;
	position: absolute;
	left: 0;
	top: 0;
	background: url('${cpath}/resources/images/checkSuc.svg') center center/contain
		no-repeat;
}
</style>
<body>
	<%@ include file="../common/header.jsp"%>

	<!-- header -->
	<div class="usec_visual">
		<div class="uvisual">
			<div class="suriSize">견적요청</div>
		</div>
	</div>

	<!-- content -->
	<div class="sec_content">
		<div class="content">
			<div class="suriSize">
				<div class="main1">
					<div class="mainForm">
						<div>
							<div class="first">완료 시 평균 4개 견적 도착</div>
							<div class="loading">
								<div class="bar"></div>
								<span class="barPercent">0%</span>
							</div>
						</div>
						
						<div class="below">
							<div class="service">어떤 서비스를 받기 원하시나요?</div>
							<ul class="select">
								<li class="text-area"><input type="checkbox" value="자전거"
									id="checkbox-area-0" name="selectOne"
									onclick="checkOnlyOne(this)" class="selClass" /> <label
									for="checkbox-area-0"> <span></span>
										<div>자전거</div>
								</label></li>
								<li class="text-area"><input type="checkbox" value="오토바이"
									id="checkbox-area-1" name="selectOne"
									onclick="checkOnlyOne(this)" class="selClass" /> <label
									for="checkbox-area-1"> <span></span>
										<div>오토바이</div>
								</label></li>
								<li class="text-area"><input type="checkbox" value="에어컨"
									id="checkbox-area-2" name="selectOne"
									onclick="checkOnlyOne(this)" class="selClass" /> <label
									for="checkbox-area-2"> <span></span>
										<div>에어컨</div> 
										
								</label></li>
								<li class="text-area"><input type="checkbox" value="보일러"
									id="checkbox-area-3" name="selectOne"
									onclick="checkOnlyOne(this)" class="selClass" /> <label
									for="checkbox-area-3"> <span></span>
										<div>보일러</div>
								</label></li>
								<li class="text-area"><input type="checkbox" value="컴퓨터"
									id="checkbox-area-4" name="selectOne"
									onclick="checkOnlyOne(this)" class="selClass" /> <label
									for="checkbox-area-4"> <span></span>
										<div>컴퓨터</div>
								</label></li>
								<li class="text-area"><input type="checkbox" value="음향"
									id="checkbox-area-5" name="selectOne"
									onclick="checkOnlyOne(this)" class="selClass" /> <label
									for="checkbox-area-5"> <span></span>
										<div>음향</div>
								</label></li>
								<li class="text-area"><input type="checkbox" value="기타"
									id="checkbox-area-6" name="selectOne"
									onclick="checkOnlyOne(this)" class="selClass" /> <label
									for="checkbox-area-6"> <span></span>
										<div>기타</div>
								</label></li>
							</ul>
						</div>
						
						<div class="selBtn">
							<input type="button" value="다음" class="nextBtn" onclick="next()" />
						</div>
					</div>
				</div>
				<div class="main2">
					<h4>Surion은 어떤 곳인가요?</h4>
					<p>서비스가 필요한 고객과 서비스를 제공하는 숨은 고수를 쉽고 빠르게 연결해드리는 전문가 매칭 서비스입니다.
						1분 내외의 요청서를 작성하면, 여러 고수님들이 맞춤형 견적을 보내드려요. 맘에 쏙 드는 고수의 맞춤형 서비스를
						받아보세요.</p>
					<h4>모든 분야의 고수만을 모았다!</h4>
					<p>수리 및 무언가를 원하시나요? 모든 물건은 그에 맞는 수리법이 있는 것인데, 숨고에는 다양한 경력의 수리
						전문가가 활동하고 있어요. 지금 바로 요청서를 작성하시고, 쉽고 간편하게 전문가님과 상담해보세요!</p>
					<h3>
						내가 찾는 고수<br> Surion에서 만나세요 &#128161;
					</h3>
				</div>
			</div>
		</div>
	</div>
	<span id="A"></span>

	<%@ include file="../common/footer.jsp"%>

	<script>
	// 체크박스 1개만 클릭
	 function checkOnlyOne(element) {
	  const checkboxes = document.getElementsByName("selectOne");
	  checkboxes.forEach((cb) => {
		cb.checked = false;
	  })
	  element.checked = true;
	}
	
	var barElem = document.querySelector('.bar'); // 로딩바 막대
	var barPercent = document.querySelector('.barPercent'); // 로딩바 수치 % 
	const select = document.querySelector('.select'); // li를 감싸고 있는 ul
	const selBtn = document.querySelector('.selBtn'); // 이전, 다음 버튼을 감싸고 있는 div
	const service = document.querySelector('.service'); // 로딩바 밑에 있는 헤더 글귀
	const selectDate = document.querySelector('.selectDate'); // 날짜 인풋창
	const checkbox_4 = document.querySelector('#checkbox-area-4'); // 기타 체크박스
	const inputEtc = document.querySelector('.inputEtc'); // 기타내용 value
	
	var goNextValue;
	var list = []; 

	// 0단계 초기값 //
	const serviceText0 = '어떤 서비스를 받기 원하시나요?';
	const mainText = ''
					+ '<li class="text-area">'
					+ '<input type="checkbox" value="자전거" id="checkbox-area-0" name="selectOne"   onclick="checkOnlyOne(this)" class="selClass"/>'
					+ '<label for="checkbox-area-0">'
					+ '<span></span>'
					+ '<div>자전거</div>'
					+ '</label>'
					+ '</li>'
					+ '<li class="text-area">'
					+ '<input type="checkbox" value="오토바이" id="checkbox-area-1" name="selectOne"   onclick="checkOnlyOne(this)" class="selClass"/>'
					+ '<label for="checkbox-area-1">'
					+ '<span></span>'
					+ '<div>오토바이</div>'
					+ '</label>'
					+ '</li>'
					+ '<li class="text-area">'
					+ '<input type="checkbox" value="에어컨" id="checkbox-area-2" name="selectOne"   onclick="checkOnlyOne(this)" class="selClass"/>'
					+ '<label for="checkbox-area-2">'
					+ '<span></span>'
					+ '<div>에어컨</div>'
					+ '</label>'
					+ '</li>'
					+ '<li class="text-area">'
					+ '<input type="checkbox" value="보일러" id="checkbox-area-3" name="selectOne" onclick="checkOnlyOne(this)" class="selClass"/>'
					+ '<label for="checkbox-area-3">'
					+ '<span></span>'
					+ '<div>보일러</div>'
					+ '</label>'
					+ '</li>'
					+ '<li class="text-area">'
					+ '<input type="checkbox" value="컴퓨터" id="checkbox-area-4" name="selectOne" onclick="checkOnlyOne(this)" class="selClass"/>'
					+ '<label for="checkbox-area-4">'
					+ '<span></span>'
					+ '<div>컴퓨터</div>'
					+ '</label>'
					+ '</li>'
					+ '<li class="text-area">'
					+ '<input type="checkbox" value="음향" id="checkbox-area-5" name="selectOne" onclick="checkOnlyOne(this)" class="selClass"/>'
					+ '<label for="checkbox-area-5">'
					+ '<span></span>'
					+ '<div>음향</div>'
					+ '</label>'
					+ '</li>'
					+ '<li class="text-area">'
					+ '<input type="checkbox" value="기타" id="checkbox-area-6" name="selectOne" onclick="checkOnlyOne(this)" class="selClass"/>'
					+ '<label for="checkbox-area-6">'
					+ '<span></span>'
					+ '<div>기타</div>'
					+ '</label>'
					+ '</li>';
					
	const btn0 = '<input type="button" value="다음" class="nextBtn" onclick="next()" />';
	
	
	// 1단계 //
	const serviceText = '어떤 부분이 고장 나셨나요?';

	const bicycle = ''
					+'<li class="text-area">'
					+'<input type="checkbox" value="타이어펑크" id="checkbox-area-0" name="selectOne"' +'onclick="checkOnlyOne(this)" class="selClass"/>'
					+'<label for="checkbox-area-0">'
					+'<span></span>'
					+'<div>타이어펑크</div>'
					+'</label>'
					+'</li>'

					+'<li class="text-area">'
					+'<input type="checkbox" value="프레임손상" id="checkbox-area-1" name="selectOne"' +'onclick="checkOnlyOne(this)" class="selClass"/>'
					+'<label for="checkbox-area-1">'
					+'<span></span>'
					+'<div>프레임손상</div>'
					+'</label>'
					+'</li>'

					+'<li class="text-area">'
					+'<input type="checkbox" value="구동계교체" id="checkbox-area-2" name="selectOne"' +'onclick="checkOnlyOne(this)" class="selClass"/>'
					+'<label for="checkbox-area-2">'
					+'<span></span>'
					+'<div>구동계교체</div>'
					+'</label>'
					+'</li>'

					+'<li class="text-area">'
					+'<input type="checkbox" value="소모품교체" id="checkbox-area-3" name="selectOne"' +'onclick="checkOnlyOne(this)" class="selClass"/>'
					+'<label for="checkbox-area-3">'
					+'<span></span>'
					+'<div>소모품교체</div>'
					+'</label>'
					+'</li>'

					+'<li class="text-area">'
					+'<input type="checkbox" value="기타" id="checkbox-area-4" name="selectOne"' +'onclick="checkOnlyOne(this)" class="selClass"/>'
					+'<label for="checkbox-area-4">'
					+'<span></span>'
					+'<div><input type="text" class="inputEtc" placeholder="기타 요청사항을 입력해주세요. (10자 이내)" maxlength="10" style="width: 25rem; border-style: none;" ></div>'
					+'</label>'
					+'</li>';

	const motorcycle = ''
					+'<li class="text-area">'
					+'<input type="checkbox" value="전원 불량" id="checkbox-area-0" name="selectOne"' +'onclick="checkOnlyOne(this)" class="selClass"/>'
					+'<label for="checkbox-area-0">'
					+'<span></span>'
					+'<div>전원 불량</div>'
					+'</label>'
					+'</li>'

					+'<li class="text-area">'
					+'<input type="checkbox" value="타이어펑크" id="checkbox-area-1" name="selectOne"' +'onclick="checkOnlyOne(this)" class="selClass"/>'
					+'<label for="checkbox-area-1">'
					+'<span></span>'
					+'<div>타이어펑크</div>'
					+'</label>'
					+'</li>'

					+'<li class="text-area">'
					+'<input type="checkbox" value="소모품교환" id="checkbox-area-2" name="selectOne"' +'onclick="checkOnlyOne(this)" class="selClass"/>'
					+'<label for="checkbox-area-2">'
					+'<span></span>'
					+'<div>소모품교환</div>'
					+'</label>'
					+'</li>'

					+'<li class="text-area">'
					+'<input type="checkbox" value="추가 튜닝" id="checkbox-area-3" name="selectOne"' +'onclick="checkOnlyOne(this)" class="selClass"/>'
					+'<label for="checkbox-area-3">'
					+'<span></span>'
					+'<div>추가 튜닝</div>'
					+'</label>'
					+'</li>'

					+'<li class="text-area">'
					+'<input type="checkbox" value="기타" id="checkbox-area-4" name="selectOne"' +'onclick="checkOnlyOne(this)" class="selClass"/>'
					+'<label for="checkbox-area-4">'
					+'<span></span>'
					+'<div><input type="text" class="inputEtc" placeholder="기타 요청사항을 입력해주세요. (10자 이내)" maxlength="10" style="width: 25rem; border-style: none;" ></div>'
					+'</label>'
					+'</li>';

	const airConditioner = ''
					+'<li class="text-area">'
					+'<input type="checkbox" value="가스충전" id="checkbox-area-0" name="selectOne"' +'onclick="checkOnlyOne(this)" class="selClass"/>'
					+'<label for="checkbox-area-0">'
					+'<span></span>'
					+'<div>가스충전</div>'
					+'</label>'
					+'</li>'

					+'<li class="text-area">'
					+'<input type="checkbox" value="내부청소" id="checkbox-area-1" name="selectOne"' +'onclick="checkOnlyOne(this)" class="selClass"/>'
					+'<label for="checkbox-area-1">'
					+'<span></span>'
					+'<div>내부청소</div>'
					+'</label>'
					+'</li>'

					+'<li class="text-area">'
					+'<input type="checkbox" value="재설치" id="checkbox-area-2" name="selectOne"' +'onclick="checkOnlyOne(this)" class="selClass"/>'
					+'<label for="checkbox-area-2">'
					+'<span></span>'
					+'<div>재설치</div>'
					+'</label>'
					+'</li>'

					+'<li class="text-area">'
					+'<input type="checkbox" value="소모품교체" id="checkbox-area-3" name="selectOne"' +'onclick="checkOnlyOne(this)" class="selClass"/>'
					+'<label for="checkbox-area-3">'
					+'<span></span>'
					+'<div>소모품교체</div>'
					+'</label>'
					+'</li>'

					+'<li class="text-area">'
					+'<input type="checkbox" value="기타" id="checkbox-area-4" name="selectOne"' +'onclick="checkOnlyOne(this)" class="selClass"/>'
					+'<label for="checkbox-area-4">'
					+'<span></span>'
					+'<div><input type="text" class="inputEtc" placeholder="기타 요청사항을 입력해주세요. (10자 이내)" maxlength="10" style="width: 25rem; border-style: none;" ></div>'
					+'</label>'
					+'</li>';

	const boiler = ''
					+'<li class="text-area">'
					+'<input type="checkbox" value="동파수리" id="checkbox-area-0" name="selectOne"' +'onclick="checkOnlyOne(this)" class="selClass"/>'
					+'<label for="checkbox-area-0">'
					+'<span></span>'
					+'<div>동파수리</div>'
					+'</label>'
					+'</li>'

					+'<li class="text-area">'
					+'<input type="checkbox" value="전지점검" id="checkbox-area-1" name="selectOne"' +'onclick="checkOnlyOne(this)" class="selClass"/>'
					+'<label for="checkbox-area-1">'
					+'<span></span>'
					+'<div>전지점검</div>'
					+'</label>'
					+'</li>'

					+'<li class="text-area">'
					+'<input type="checkbox" value="보일러교체" id="checkbox-area-2" name="selectOne"' +'onclick="checkOnlyOne(this)" class="selClass"/>'
					+'<label for="checkbox-area-2">'
					+'<span></span>'
					+'<div>보일러교체</div>'
					+'</label>'
					+'</li>'

					+'<li class="text-area">'
					+'<input type="checkbox" value="소모품교체" id="checkbox-area-3" name="selectOne"' +'onclick="checkOnlyOne(this)" class="selClass"/>'
					+'<label for="checkbox-area-3">'
					+'<span></span>'
					+'<div>소모품교체</div>'
					+'</label>'
					+'</li>'

					+'<li class="text-area">'
					+'<input type="checkbox" value="기타" id="checkbox-area-4" name="selectOne"' +'onclick="checkOnlyOne(this)" class="selClass"/>'
					+'<label for="checkbox-area-4">'
					+'<span></span>'
					+'<div><input type="text" class="inputEtc" placeholder="기타 요청사항을 입력해주세요. (10자 이내)" maxlength="10" style="width: 25rem; border-style: none;" ></div>'
					+'</label>'
					+'</li>';

	const computer = ''
					+'<li class="text-area">'
					+'<input type="checkbox" value="CPU" id="checkbox-area-0" name="selectOne"' +'onclick="checkOnlyOne(this)" class="selClass"/>'
					+'<label for="checkbox-area-0">'
					+'<span></span>'
					+'<div>CPU</div>'
					+'</label>'
					+'</li>'

					+'<li class="text-area">'
					+'<input type="checkbox" value="메인보드" id="checkbox-area-1" name="selectOne"' +'onclick="checkOnlyOne(this)" class="selClass"/>'
					+'<label for="checkbox-area-1">'
					+'<span></span>'
					+'<div>메인보드</div>'
					+'</label>'
					+'</li>'

					+'<li class="text-area">'
					+'<input type="checkbox" value="파워" id="checkbox-area-2" name="selectOne"' +'onclick="checkOnlyOne(this)" class="selClass"/>'
					+'<label for="checkbox-area-2">'
					+'<span></span>'
					+'<div>파워</div>'
					+'</label>'
					+'</li>'

					+'<li class="text-area">'
					+'<input type="checkbox" value="OS" id="checkbox-area-3" name="selectOne"' +'onclick="checkOnlyOne(this)" class="selClass"/>'
					+'<label for="checkbox-area-3">'
					+'<span></span>'
					+'<div>OS</div>'
					+'</label>'
					+'</li>'

					+'<li class="text-area">'
					+'<input type="checkbox" value="기타" id="checkbox-area-4" name="selectOne"' +'onclick="checkOnlyOne(this)" class="selClass"/>'
					+'<label for="checkbox-area-4">'
					+'<span></span>'
					+'<div><input type="text" class="inputEtc" placeholder="기타 요청사항을 입력해주세요. (10자 이내)" maxlength="10" style="width: 25rem; border-style: none;" ></div>'
					+'</label>'
					+'</li>';
					
	const sound = ''
					+'<li class="text-area">'
					+'<input type="checkbox" value="단선" id="checkbox-area-0" name="selectOne"' +'onclick="checkOnlyOne(this)" class="selClass"/>'
					+'<label for="checkbox-area-0">'
					+'<span></span>'
					+'<div>단선</div>'
					+'</label>'
					+'</li>'

					+'<li class="text-area">'
					+'<input type="checkbox" value="전원 불량" id="checkbox-area-1" name="selectOne"' +'onclick="checkOnlyOne(this)" class="selClass"/>'
					+'<label for="checkbox-area-1">'
					+'<span></span>'
					+'<div>전원 불량</div>'
					+'</label>'
					+'</li>'

					+'<li class="text-area">'
					+'<input type="checkbox" value="부품 불량" id="checkbox-area-2" name="selectOne"' +'onclick="checkOnlyOne(this)" class="selClass"/>'
					+'<label for="checkbox-area-2">'
					+'<span></span>'
					+'<div>부품 불량</div>'
					+'</label>'
					+'</li>'

					+'<li class="text-area">'
					+'<input type="checkbox" value="소모품교체" id="checkbox-area-3" name="selectOne"' +'onclick="checkOnlyOne(this)" class="selClass"/>'
					+'<label for="checkbox-area-3">'
					+'<span></span>'
					+'<div>소모품교체</div>'
					+'</label>'
					+'</li>'

					+'<li class="text-area">'
					+'<input type="checkbox" value="기타" id="checkbox-area-4" name="selectOne"' +'onclick="checkOnlyOne(this)" class="selClass"/>'
					+'<label for="checkbox-area-4">'
					+'<span></span>'
					+'<div><input type="text" class="inputEtc"  placeholder="기타 요청사항을 입력해주세요." maxlength="10" style="width: 25rem; border-style: none;" ></div>'
					+'</label>'
					+'</li>';

	const etc = ''
					+'<li class="text-area">'
					+'<input type="checkbox" value="텍스트 창 만들기" id="checkbox-area-etc" name="selectOne"' +'onclick="checkOnlyOne(this)" class="selClass"/>'
					+'<label for="checkbox-area-etc">'
					+'<span></span>'
					+'<div><input type="text" class="inputEtc"  placeholder="기타 요청사항을 입력해주세요. (10자 이내)" maxlength="10" style="width: 25rem; border-style: none;" ></div>'
					+'</label>'
					+'</li>'
					
	const btn = ''
					+'<input type="button" value="이전" class="prevBtn" onclick="prev()"/>'
					+'<input type="button" value="다음" class="nextBtn" onclick="next2()"/>';
				
	const etcBtn = ''
					+'<input type="button" value="이전" class="prevBtn" onclick="prev()"/>'
					+'<input type="button" value="다음" class="nextBtn" onclick="etcNext()"/>';				
	
	// next2() 2단계 // 
	const serviceText2 = '제품을 보낼 방법을 선택해주세요.';

	const repairSort = ''
						+'<li class="text-area">'
						+'<input type="checkbox" value="방문수리" id="checkbox-area-0" name="selectOne"' +'onclick="checkOnlyOne(this)" class="selClass"/>'
						+'<label for="checkbox-area-0">'
						+'<span></span>'
						+'<div>방문수리</div>'
						+'</label>'
						+'</li>'

						+'<li class="text-area">'
						+'<input type="checkbox" value="직접방문" id="checkbox-area-1" name="selectOne"' +'onclick="checkOnlyOne(this)" class="selClass"/>'
						+'<label for="checkbox-area-1">'
						+'<span></span>'
						+'<div>직접방문</div>'
						+'</label>'
						+'</li>'

						+'<li class="text-area">'
						+'<input type="checkbox" value="택배수리" id="checkbox-area-2" name="selectOne"' +'onclick="checkOnlyOne(this)" class="selClass"/>'
						+'<label for="checkbox-area-2">'
						+'<span></span>'
						+'<div>택배수리</div>'
						+'</label>'
						+'</li>'

	const btn2 = ''
				+'<input type="button" value="이전" class="prevBtn" onclick="prev2()"/>'
				+'<input type="button" value="다음" class="nextBtn" onclick="next3()"/>';


	// next3() 3단계 //
	const serviceText3 = '원하시는 날짜를 선택해주세요.';
	
	const btn3 = ''
				+'<input type="button" value="이전" class="prevBtn" onclick="prev3()"/>'
				+'<input type="button" value="다음" class="nextBtn" onclick="next4()"/>';			
						 
	// next4() 4단계 //
	
	const serviceText4 = '관련 내용을 작성해주세요.';
	
	const btn4 = ''
				+'<input type="button" value="이전" class="prevBtn" onclick="prev4()"/>'
				+'<input type="button" value="견적 요청" class="nextBtn" onclick="next5()"/>';
	
	
	
	
	
	function next()	{
		if(document.querySelector('.selClass:checked') == null){
			alert("1개 항목을 체크해주세요.");
			return
		}
		
		goNextValue = document.querySelector('.selClass:checked').value;
		
		if(goNextValue == '자전거'){
			service.textContent = serviceText;
			select.innerHTML = bicycle;
			selBtn.innerHTML = btn;
			list.push(goNextValue);
		}
		if(goNextValue == '오토바이'){
			service.textContent = serviceText;
			select.innerHTML = motorcycle;
			selBtn.innerHTML = btn;
			list.push(goNextValue);
		}	
		if(goNextValue == '에어컨'){
			service.textContent = serviceText;
			select.innerHTML = airConditioner;
			selBtn.innerHTML = btn;
			list.push(goNextValue);
		}	
		if(goNextValue == '보일러'){
			service.textContent = serviceText;
			select.innerHTML = boiler;
			selBtn.innerHTML = btn;
			list.push(goNextValue);
		}	
		if(goNextValue == '컴퓨터'){
			service.textContent = serviceText;
			select.innerHTML = computer;
			selBtn.innerHTML = btn;
			list.push(goNextValue);
		}	
		if(goNextValue == '음향'){
			service.textContent = serviceText;
			select.innerHTML = sound;
			selBtn.innerHTML = btn;
			list.push(goNextValue);
		}	
		if(goNextValue == '기타'){
			service.textContent = serviceText;
			select.innerHTML = etc;
			selBtn.innerHTML = etcBtn;
			list.push(goNextValue);
		}	
		
		barElem.style.width = 28 + "%";
		barPercent.textContent = '28%';
		console.log(list);
	}
	function next2(){
		if(document.querySelector('.selClass:checked') == null){
			alert("1개 항목을 체크해주세요.");
			return
		}
				
		let inputEtcValue = document.querySelector('.inputEtc').value;
		if(document.querySelector('#checkbox-area-4').checked){
			if(inputEtcValue == ""){
				alert("요청사항을 입력해주세요.");
				return
			}
			list.push(inputEtcValue);
		} else {
			goNextValue = document.querySelector('.selClass:checked').value;
			list.push(goNextValue);	
		}
			 
			service.textContent = serviceText2;
			select.innerHTML = repairSort;
			selBtn.innerHTML = btn2;
			
		barElem.style.width = 55 + "%";
		barPercent.textContent = '55%';
		console.log(list);
	}
	
	// 0단계에서 기타 선택 시 따로 진행되는 버튼
	function etcNext(){
		if(document.querySelector('.selClass:checked') == null){
			alert("1개 항목을 체크해주세요.");
			return
		}
		const aa =  document.querySelector	('#checkbox-area-etc');
		let inputEtcValue = document.querySelector('.inputEtc').value;
		if(list[0] == "기타"){
			if(inputEtcValue == ""){
				alert("요청사항을 입력해주세요.");
			return	
			}
			list.push(inputEtcValue);
		}
			
		service.textContent = serviceText2;
		select.innerHTML = repairSort;
		selBtn.innerHTML = btn2;
		
		barElem.style.width = 55 + "%";
		barPercent.textContent = '55%';
		console.log(list);	
	}
	
	function next3(){
		if(document.querySelector('.selClass:checked') == null){
			alert("1개 항목을 체크해주세요.");
			return
		}
		goNextValue = document.querySelector('.selClass:checked').value;
			list.push(goNextValue);
			
			service.textContent = serviceText3;
			select.innerHTML = '<input type="date" name="startday" class="selectDate">';
			selBtn.innerHTML = btn3;
			
		barElem.style.width = 75 + "%";
		barPercent.textContent = '75%';
		console.log(list);
	}
	
	function next4(){
		
		let newDate = new Date();
		let year = newDate.getFullYear(); // 년도
		let month = newDate.getMonth() + 1;  // 월
		let date = newDate.getDate();  // 날짜
		let day = newDate.getDay();  // 요일
		let today = String(year) + '-' + String(month).padStart(2, '0') + '-' + String(date).padStart(2,'0');
			
		let selectDateValue = document.querySelector('.selectDate').value;
		
		if(selectDateValue == ""){
			alert("날짜를 선택해주세요.");	
			return
		}
		if(today > selectDateValue){
			alert("현재일보다 이전 날짜는 선택할 수 없습니다.")
			return
		}
		
		service.textContent = serviceText4;
		select.innerHTML = ''																
							+'<form action="${cpath}/repair/upload" method="post" enctype="multipart/form-data" id="imageUp">'
							+'<div class="imageForm">'
							+'<input type="file"  name="file" class="imageUpload">'
							+'<input type="hidden" name="member_id" value="ff">'
							+'<div class="imageText">이미지를 업로드 해주세요.</div>'
							+'</div>'
							+'<div class="aa">제목</div>'
							+'<input type="text" class="lastTitle" placeholder="25자 이내로 작성해주세요." maxlength="25">'
							+'<div class="aa">내용</div>'
							+'<textarea class="lastContent" maxlength="270"> </textarea>'
							+'<div class="esti">'
							+'<div class="aa">희망 견적</div><span id="ss"><input type="number" id="number" class="lastEstimate" placeholder="숫자만 입력해주세요."></span><label class="labelConfer"><input type="checkbox" name="confer" class="confer" value="협의">협의</label>'
							+'</div>'
							+'</form>'
		selBtn.innerHTML = btn4;
							
		// 이미지 등록 시 빨간 텍스트 사라짐 // 					
		var imageText = document.querySelector('.imageText'); 
		var input = document.getElementsByTagName('input')[0];
		input.onchange = function () {
			if(document.querySelector('.imageUpload').value != ""){
				imageText.textContent = "";
			}
			if(document.querySelector('.imageUpload').value == ""){
				imageText.textContent = "이미지를 업로드 해주세요.";
			}
		}
		
// 		// 견적 적는 부분에 숫자만 들어가게 // 
// 		var input3 = document.getElementsByTagName('input')[3];
// 		console.log(input3);
// 		input3.onkeypress = function(e){
// 			console.log(e);
// 			 if(event.keyCode >= 48 && event.keyCode <= 57){
// 				  return true;
//  			   } else {
//  				  event.preventDefault();
//  				  return false;
//  			   }
// 		}
		
		// 협의 버튼 클릭 시 숫자 입력 못하고 협의 내용 기입
		var input4 = document.getElementsByTagName('input')[4];
		const checkbox = document.querySelector('.confer');
		const lastEstimate = document.querySelector('.lastEstimate');
		const ss = document.querySelector('#ss');
		input4.onclick = function() {
			  console.log(checkbox.value);
			  if(checkbox.checked == true)  {
				  ss.innerHTML = '<input type="text" class="lastEstimate" placeholder="협의" value="협의" readonly>';
			  } else {
				  ss.innerHTML = '<input type="number" id="number" class="lastEstimate" placeholder="숫자만 입력해주세요.">';
			  }
			}
							
							
							
		barElem.style.width = 99 + "%";
		barPercent.textContent = '99%';
		list.push(selectDateValue);
		console.log(list);
	}
	
	
	
	function next5(){
		
		let imageUpload = document.querySelector('.imageUpload').value;
		let lastTitleValue = document.querySelector('.lastTitle').value;
		let lastContentValue = document.querySelector('.lastContent').value;
		let lastEstimateValue = document.querySelector('.lastEstimate').value;
		
		if(imageUpload == ""){
			alert("이미지를 첨부해주세요.");
			return
		}
		if(lastTitleValue == ""){
			alert("제목을 입력해주세요.");
			return
		}
		if(lastContentValue == ""){
			alert("내용을 입력해주세요.");
			return
		}
		if(lastEstimateValue == ""){
			alert("숫자만 입력해주세요.");
			return
		}
		
		list.push(imageUpload, lastTitleValue, lastContentValue, lastEstimateValue);
		console.log(list);
		alert("견적 요청이 완료되었습니다.");
		
			
		goOrder(); // ajax로 list 데이터 보내기
	}
	
	

	// 이전 버튼 //
	
	function prev(){
		list.pop();
		
		service.textContent = serviceText0;
		select.innerHTML = mainText;
		selBtn.innerHTML = btn0;
		
		barElem.style.width = 0 + "%";
		barPercent.textContent = '0%';
		console.log(list);
	}
	
	function prev2(){
		list.pop();
		
		if(list[0] == '자전거'){
			service.textContent = serviceText;
			select.innerHTML = bicycle;
			selBtn.innerHTML = btn;
		}
		if(list[0] == '오토바이'){
			service.textContent = serviceText;
			select.innerHTML = motorcycle;
			selBtn.innerHTML = btn;
		}	
		if(list[0] == '에어컨'){
			service.textContent = serviceText;
			select.innerHTML = airConditioner;
			selBtn.innerHTML = btn;
		}	
		if(list[0] == '보일러'){
			service.textContent = serviceText;
			select.innerHTML = boiler;
			selBtn.innerHTML = btn;
		}	
		if(list[0] == '컴퓨터'){
			service.textContent = serviceText;
			select.innerHTML = computer;
			selBtn.innerHTML = btn;
		}	
		if(list[0] == '음향'){
			service.textContent = serviceText;
			select.innerHTML = sound;
			selBtn.innerHTML = btn;
		}	
		if(list[0] == '기타'){
			service.textContent = serviceText;
			select.innerHTML = etc;
			selBtn.innerHTML = etcBtn;
		}	
		barElem.style.width = 28 + "%";
		barPercent.textContent = '28%';
		console.log(list);
	}

	
	function prev3(){
		list.pop();
		service.textContent = serviceText2;
		select.innerHTML = repairSort;
		selBtn.innerHTML = btn2;
		console.log(list);
		
	barElem.style.width = 55 + "%";
	barPercent.textContent = '55%';
	}
	
	function prev4(){
		list.pop();
		service.textContent = serviceText3;
		select.innerHTML = '<input type="date" name="startday" class="selectDate">';
		selBtn.innerHTML = btn3;
		console.log(list);
		
	barElem.style.width = 75 + "%";
	barPercent.textContent = '75%';
	}
	
	// 데이터 보내기 //
	
	
	function goOrder(){
		$.ajax({
			type : "post",
			url : "${cpath}/repair/uploadAjaxAction",
			data : {
				"member_id" : "ff",
				"choice1" : list[0],
				"choice2" : list[1],
				"deliveryType" : list[2],
				"date" : list[3],
				"image" : list[4],
				"title" : list[5],
				"content" : list[6],
				"estimate" : list[7],
				"itemcategory_id" : 1,
			}, 
			success : function (data){
			},
			error : function (){
				alert("error");
			}
		});
		uploadImg();
	}
	
	function uploadImg(){
		var frm = $('#imageUp');
			frm.submit();
	}

</script>
</body>
</html>