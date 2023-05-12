<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />

<%@ include file="../common/front_header.jsp"%>
<style>
.content {
	width: 100%;
	display: flex;
	justify-content: space-between;
	margin-bottom: 3rem;
}

.mainImg {
	width: 55%;
	display: flex;
	flex-direction: column;
	justify-content: center;
	margin-top: 55px;
}

.mainHere {
	width: 100%;
	height: 25rem;
	background:
		url("${cpath}/resources/repairImages/${fn:substring(m.image, 12, 99)}")
		center center/contain no-repeat;
	filter: drop-shadow(2px 4px 6px black);
}

.mainContent {
	width: 40%
}

.mainContent h3 {
	font-weight: 500;
	margin: 0 0 8px;
	color: #303441;
	font-size: 20px;
	word-break: keep-all;
	line-height: 1.5;
}

.subTitle {
	display: flex;
	margin-bottom: 1rem;
	font-size: 14px;
	color: rgb(85, 89, 105);
	align-items: center;
}

.subTitle li:nth-child(1) {
	font-size: 1.2rem;
	color: #00c7ae;
	font-weight: bold;
	font-style: italic;
	margin-right: 6px;
}

.subTitle li:nth-child(2) {
	padding-top: 3px;
}

.subTitle2 {
	font-size: 14px;
	color: rgb(85, 89, 105);
	display: flex;
	margin-bottom: 1rem;
}

.ContentDetail {
	border: 1px solid #ede8e8;
	font-size: 1.1rem;
	padding: 2rem;
}

.explain {
	height: 290px;
}

.ContentDetail li {
	height: 24px;
	color: #303441;
}

.nikname {
	display: flex;
	margin-bottom: 1rem;
}

.nikname li:nth-child(1) {
	font-weight: bold;
	margin-right: 1rem;
}

.sBtn {
	width: 100%;
	height: 3rem;
	background: #00c7ae;
	border-style: none;
	border-radius: 0.4rem;
	color: #fff;
	margin-right: 1px;
}

.propose {
	padding-top: 22px;
	margin-top: 2.8rem;
	height: 5rem;
	border: 1px solid #ede8e8;
	color: rgb(122, 122, 122);
	line-height: 1.3;
	font-size: 1.5rem;
	font-weight: 400;
	text-align: center;
	margin-top: auto;
	margin-bottom: 0;
}
</style>
<body>

	<%@ include file="../common/header.jsp"%>
	<form method="post" enctype="multipart/form-data" action="${cpath}/mypage/boardUpdate">
		<div class="sec_content">
			<div class="suriSize st">
				<div class="content">
					<div class="mainImg">
						<div class="mainHere"></div>
						<p class="propose">
							<input type="file" name="image">
							<input type="hidden" name="prevImage">
						</p>
					</div>
						

					<div class="mainContent">
						<div>
							<h3>제목</h3>
							<input type="text" name="title" value="${m.title}">
							<ul class="subTitle2">
								<li>${m.choice1}&nbsp>&nbsp</li>
								<li>${m.choice2}&nbsp>&nbsp</li>
								<li>${m.deliveryType}</li>
							</ul>
							<div class="ContentDetail">
								<ul class="nikname">
									<li>의뢰자 :</li>
									<li>${m.member_id}</li>
								</ul>
								<textarea name="content" cols="43" rows="10">${m.content}</textarea>
								<ul class="nikname">
									<li>작업 요청일 :</li>
									<li><input type="date" value="${m.date}" name="date" id="Date"></li>
									
								</ul>
								<ul class="nikname">
									<li>견적 :</li>
									<li><span id="chek"> <c:choose>
												<c:when test="${m.estimate eq '협의'}">
													<input type="text" name="estimate" class="estimate"
														placeholder="협의" value="협의" readonly>
												</c:when>
												<c:otherwise>
													<input type="number" name="estimate" class="estimate"
														placeholder="숫자만 입력해주세요" value="${m.estimate}">
												</c:otherwise>
											</c:choose>
									</span> <label><input type="checkbox" name="confer"
											id="confer" value="협의">협의</label> <input type="hidden"
										value="${m.idx}" name="idx"></li>
								</ul>
								<button class="sBtn">수정 완료</button>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>


	<script>
		$(document).ready(function() {
			var boxVal = $('.estimate').val();
			if (boxVal == '협의') {
				$('input:checkbox[id="confer"]').attr("checked", true)
			}
		})
		//협의 버튼 클릭 함수
		const checkbox = document.querySelector('#confer');
		const ss = document.querySelector('#chek');
		checkbox.onclick = function() {
			console.log(checkbox.value);
			if (checkbox.checked == true) {
				ss.innerHTML = '<input type="text" name="estimate" placeholder="협의" value="협의" readonly>';
			} else {
				ss.innerHTML = '<input type="number" id="number" name="estimate" placeholder="숫자만 입력해주세요.">';

			}
		}

		//오늘 이전 날짜 선택 금지 함수
		var now_utc = Date.now()
		var timeOff = new Date().getTimezoneOffset()*60000;
		var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
		document.getElementById("Date").setAttribute("min", today);
	</script>

	<%@ include file="../common/footer.jsp"%>
</body>
