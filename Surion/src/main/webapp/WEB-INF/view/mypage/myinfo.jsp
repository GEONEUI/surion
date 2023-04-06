<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<style>

	#my_page_right img{
		margin-bottom: 20px;
		border-radius:65px;
		filter: grayscale(1);
	}

	#my_page_right .item{
		width: 100%;
	}

	#my_page_right .item .item_left{
		padding-right: 30px;
		display:flex;
		aling-items:center;
		flex-direction:column;
	}

	#my_page_right .item_right{
		width: 100%;
	}

	#my_page_right .item_right form{width: 100%;}

	.formgroup{
		margin-bottom: 15px;
	}

	.formgroup p{
		font-size: 13px;
	}

	.formgroup input{
		width: 100%;
		height: 40px;
		border-radius:5px;
		background: #f6f6ff;
		border:none;
		margin-bottom: 10px;
		padding-left: 10px;
	}

	#my_page_right .item_right small{
		display:block;
		font-size: 12px;
		color: #9A9BA7;
	}

	#my_page_right .item p{
		font-size:15px;
		margin-bottom: 10px;
		color: #555969;
		font-weight: bold;
	}

	.sub_title{
		font-size: 18px;
		font-weight: bold;
	}

</style>

<p class="sub_title">나의정보</p>
				<div class="item d-flex">
					<div class="item_left">
						<img src="${cpath}/resources/images/default.png" alt="기본프로필 이미지" width="110">
						<button class="btn btn-sm" style="background:#00c7ae; color:#fff;">프로필변경</button>
					</div>
					<div class="item_right">
						<form>
							<div class="formgroup">
								<p>닉네임</p>
								<input type="text">
								<small>* 닉네임 변경은 가입후 1회만 가능합니다.</small>
								<small>* 닉네임 변경 이력이 있다면 수정 기능이 비활성화되며, 추가 변경은 불가합니다..</small>
								<small>* 한글/영문/숫자만 사용할 수 있으며, 이메일 아이디와 동일한 문자열은 사용이 불가합니다.</small>	
							</div>
							<div class="formgroup">
								<p>이메일</p>
								<input type="text">
								<small>* 변경하실 이메일을 입력해주세요.</small>
							</div>
							<div class="formgroup">
								<p>비밀번호 변경</p>
								<input type="text">
								<small>* 변경하실 비밀번호를 입력해주세요.</small>
							</div>
							<div class="formgroup">
								<p>휴대폰번호</p>
								<input type="text">
								<small>* 변경된 휴대폰 번호를 입력해주세요.</small>
							</div>
							<div class="formgroup">
								<p>직업</p>
								<input type="text">
								<small>* 직업을 입력해주세요.</small>
							</div>
							<div class="formgroup">
								<p>관심사선택</p>
								<input type="text">
								<small>*수리관심사를 선택해주세요.</small>
							</div>
							<div class="formgroup">
								<button class="btn btn-sm" style="background:#00c7ae; color:#fff;">변경완료</button>
							</div>
						</form>
					</div>
				</div>	