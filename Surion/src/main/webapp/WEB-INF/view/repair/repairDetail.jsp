<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!doctype html>
<html lang="ko">
<%@ include file="../common/front_header.jsp" %>
<style>
	.content {
		width: 100%;
		display: flex;
		justify-content: space-between;
	    margin-bottom: 3rem;
	}
	.mainImg{
		width:55%;
		display:flex;
		flex-direction:column;
		justify-content: center;
		margin-top: 55px;
	}
	
	.mainHere {
		width: 100%;
		height: 25rem;
		background:url("${cpath}/resources/repairImages/${fn:substring(m.image, 12, 99)}") center center / contain no-repeat;
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
	.explain{
		height:290px;
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
	    margin-top:auto;
	    margin-bottom:0;
	}
	
/* 제안하기 modal */
	 .modal {
		position: absolute;
		top: 0;
	    left: 0;
		width: 100%;
		height: 100%;
		display: none;
		background-color: rgba(0, 0, 0, 0.4);
	}
		
	.modal.show {
	  	display: block;
	}

	.modal_body {
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    width: 400px;
	    height: 500px;
	    padding: 40px;
	    text-align: center;
	    background-color: rgb(255, 255, 255);
	    border-radius: 10px;
	    box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	    transform: translateX(-50%) translateY(-50%);
	}
	
	.modal_hr {
		height: 3px;
		background: #000;
		margin: 0;
		
	}
	.location {
		display: flex;
		border-bottom: 1.5px solid #e9e8e8;
	}
	
	div.modal.show > form > div:nth-child(4) {
		border-bottom: 2px solid #e9e8e8;
		margin-bottom: 1rem;
	}
	
	.left-font {
 		width: 6rem;
 		background: #00c7ae21;
 		font-weight: 500;
	}
	
	.content-box {
		width: 20rem;
    	height: 19rem;
    	padding: 7px;
    	border-color: #babcbf;
    	resize: none;
    	margin-bottom: 5px;
	}
	
	.bottom-btn {
		display: flex;
		align-items: center;
		justify-content: center;
	}
	
	.submit-btn {
		margin-right: 1rem;
		width: 5rem;
    	height: 2rem;
    	background: #00c7ae;
    	color: #fff;
    	border: none;
    	border-radius: 4px;
	}
	
	.cancel-btn {
		width: 3rem;
    	height: 2rem;
    	background: #00c7ae;
    	color: #fff;
    	border: none;
    	border-radius: 4px;
	}
	
/* 	고정 값 */
	input[type=text] {
		padding-left: 10px;
		border-style: none;
	}
		
	textarea:focus {
		outline: none;
	}
</style>
<body>

	<%@ include file="../common/header.jsp" %>
<div class="sec_content">
	<div class="suriSize st">
		<div class="content">
			<div class="mainImg">
				<div class="mainHere"></div>
				<p class="propose">&#128680;의뢰자의 요청 내용을 확인 후 제안해 주세요.</p>
			</div>
		
			
			<div class="mainContent">
				<div>
					<h3>${m.title}</h3>
					<ul class="subTitle">
						<li>Surion</li>
						<li>이 제공하는 견적 요청 목록 &#128504;</li>
					</ul>
					<ul class="subTitle2">
						<li>${m.choice1} &nbsp > &nbsp</li>
						<li>${m.choice2} &nbsp > &nbsp</li>
						<li>${m.deliveryType}</li>
					</ul>
					<div class="ContentDetail">
						<ul class="nikname">
							<li>의뢰자 :</li>
							<li>${m.member_id}</li>
						</ul>
						<p class="explain">${m.content}</p>
						<ul class="nikname">
							<li>작업 요청일 : </li>
							<li>${m.date}</li>
						</ul>
						<ul class="nikname">
							<li>견적 : </li>
							<li>${money}</li>
						</ul>
						<c:choose>
							<c:when test="${member.id == m.member_id}">
								<form action="${cpath}/mypage/boardUpdate" method="get">
									<input type="hidden" value="${m.idx}" name="idx">
									<button class="sBtn">게시글 수정/삭제</button>
								</form>
							</c:when>
							<c:otherwise>
								<button class="sBtn">제안하기</button>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal">
	<form class="modal_body">
		<hr class="modal_hr">
		<div class="location">
			<div class="left-font">위치</div>
			<input type="text" class="inText" maxlength="22" placeholder="서울시 강동구.....">
		</div>
		<div class="location">
			<div class="left-font">연락처</div>
			<input type="text" class="inText" maxlength="22" placeholder="010-0000-0000.....">
		</div>
		<div class="location">
			<div class="left-font">연락가능시간</div>
			<input type="text" class="inText" maxlength="22" placeholder="00~00시.....">
		</div>
		<div>
			<textarea class="content-box" placeholder="내용을 입력해 주세요." maxlength="400"></textarea>
		</div>
		<div class="bottom-btn">
			<button type="submit" class="submit-btn">제안하기</button>
			<button type="reset" class="cancel-btn">취소</button>
		</div>
	</form>
</div>


<script>	
	
// 제안하기 버튼 클릭 시 modal 등장
const modal = document.querySelector('.modal');
const sBtn = document.querySelector('.sBtn');

sBtn.addEventListener('click', () => {
	modal.classList.add('show');
	document.body.style.overflow = 'hidden';
});

// 제안하기 modal 에서 취소 버튼 누를 시 이벤트
const cancel_btn = document.querySelector('.cancel-btn');
cancel_btn.addEventListener('click', () => {
	modal.classList.remove('show');
	document.body.style.overflow = 'auto';
});
	

	
</script>

		<%@ include file="../common/footer.jsp" %>
</body>
</html>