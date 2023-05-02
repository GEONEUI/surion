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
	
	.subBtn {
		width: 100%;
		height: 3rem;
		background: #00c7ae;	
		border-style: none;
		border-radius: 0.4rem;
		color: #fff;
	}
	
	
	.updateBtn {
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
		position: fixed;
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
	    top: 40%;
	    left: 50%;
	    width: 400px;
	    height: 160px;
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
		margin-bottom: 1rem;
	}
	
	div.modal.show > form > div:nth-child(6) {
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
	input[type=number] {
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
								<form method="get" class="frm">
									<input type="hidden" value="${m.idx}" name="idx">
									<button type="button" class="subBtn" onclick="formClick('update')" style="width: 60%">게시글 수정</button>
								<button type="button" class="subBtn" onclick="formClick('delete')"
									style="width: 25%; margin-left: 15px;">삭제</button>
									</form>
							</c:when>
							<c:otherwise>
								<button class="sBtn" data-profile-status="${result}"> 제안하기</button>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="modal">
	<form action="${cpath}/repair/offer" class="modal_body"  method="get" name="frm1" onsubmit="return goCheck()">
		<hr class="modal_hr">
			<input type="hidden" name="mechanic_id" value="${member.id}">
			<input type="hidden" name="member_id" value="${m.member_id}">
		<div class="location">
			<div class="left-font">금액</div>
			<input type="number" class="inText" name="estimate" maxlength="10" oninput="maxLengthCheck(this)" placeholder="숫자만 입력해주세요.">
		</div>
		<div class="bottom-btn">
			<button type="submit" class="submit-btn">제안하기</button>
			<button type="reset" class="cancel-btn">취소</button>
		</div>
	</form>
</div>

<script>	

function formClick(str) {
	const frm = document.querySelector('.frm');
	if (str == "update") {
		frm.action = "${cpath}/mypage/boardUpdate";
		frm.submit();
	} else if (str == "delete") {
		if (confirm('정말 게시글을 삭제 하시겠습니까?')) {
			frm.action = "${cpath}/mypage/boardDelete";
			frm.submit();
		} else {
			return;
		}
	}
}

	
// 제안하기 버튼 클릭 시 modal 등장
	const modal = document.querySelector('.modal');
	const sBtn = document.querySelector('.sBtn');
	const loginStatus = "${member.id}";
	const mechanicStatus = "${mechanic.id}";
	const profileStatus = "${result}";
	
	sBtn.addEventListener('click', () => {
		// 로그인 확인
		if (loginStatus === "") {
		  	alert("로그인을 해주세요.");
		  	return	
		}
		// 엔지니어 정보 확인
		if(mechanicStatus === "" || profileStatus == 0){
			alert("엔지니어/프로필 등록을 해주세요.")
			return
		}
	 	// 로그인 상태인 경우 처리
		modal.classList.add('show');
		document.body.style.overflow = 'hidden';
	});
	
	// 제안하기 modal 에서 취소 버튼 누를 시 이벤트
	const cancel_btn = document.querySelector('.cancel-btn');
	cancel_btn.addEventListener('click', () => {
		modal.classList.remove('show');
		document.body.style.overflow = 'auto';
	});
	
	// 모달 창 공란 입력 불가
	function goCheck(){
		tf = document.frm1;
			if(tf.estimate.value == ""){
				alert("금액을 입력해주세요.");
				tf.estimate.focus();
				return false;
			}
			alert('견적 제안이 완료 되었습니다.');
			return true;
		};
	
		// input number 길이 제한
		function maxLengthCheck(object){
		    if (object.value.length > object.maxLength){
		      object.value = object.value.slice(0, object.maxLength);
		    }    
		  }
		
</script>

		<%@ include file="../common/footer.jsp" %>
</body>
</html>