<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>

<html lang="ko">
<%@ include file="../common/front_header.jsp"%>
<style>
body {
	background: #fff !important;
}

#my_page_right {
	padding: 35px 30px;
}

#navLink


 


a




:nth-child




(


 


${
pageview



	



}
)
{
color
:
red
!important;
}
.subject {
	display: flex;
	padding: 27px 0;
	justify-content: space-between;
}

.option_subject {
	height: 3.5rem;
	padding: 1rem 0;
	background-color: #fff;
}

.pick_picture {
	height: 3.5rem;
	background-color: lightgray;
}

.insert_title {
	width: 100%;
	padding: 1.25rem 0;
	margin: 0;
	border-color: transparent;
}

.option {
	display: flex;
	align-items: center;
	height: 62.97px;
	border: 1px dotted lightgray;
	justify-content: space-around;
}

.option_service, .option_loc {
	
}

.text {
	color: gray;
	padding-top: 20px;
	border-color: transparent;
	width: 100%;
	height: 300px;
}

.form-control {
	text-align: center;
}

.form-control option {
	text-align: center;
}

.pick_picture{
	align-items: center;
    display: flex;
}

.pick_picture i{
	align-items: center;
	margin-left:10px;
	font-size: 20px;
}

</style>
<script> 
//선택한 것 보여주기
function change(){
	
	var values = document.getElementById('test').value;
	document.getElementById('show').value = values;
}
</script>
<body>
	<%@ include file="../common/header.jsp"%>
	<div class="suriSize">
		<div class="container">
			<div class="row justify-content-between" style="min-height: 500px;">
				<%@ include file="../common/communiSidebar.jsp"%>
				<div class="col-lg-9" id="my_page_right">
					<!-- 커뮤니티 글 등록 -->
					<form action="/writePro" method="post">
						<div class="subject">
							<!-- <div class="option_subject">
							주제선택 <i class="fa-solid fa-caret-down"></i>
						</div> -->

							<!-- 주제선택 -->
							<table class="pull-right">
								<tr>
									<td><select class="form-control" name="searchField">
											<option value="0">주제 선택</option>
											<option value="query">궁금해요</option>
											<option value="howmuch">얼마예요</option>
											<option value="findgosu">고수찾아요</option>
											<option value="together">함께해요</option>
									</select></td>
								</tr>
							</table>
							<!-- <input type="text" id="show"> -->
							<div data-v-63515f9a class="write-button desktop">
						<input type="submit" value="등록"
							class="btn btn-outline-info"></button>
					</div>
						</div>
						<div class="pick_picture">
							<a><i class="fa-solid fa-camera"></i></a>
						</div>
						<input type="text" class="insert_title" placeholder="제목을 입력해주세요.">
						<div class="option">
							<div class="option_service">
								<!-- (선택) 서비스 <i class="fa-regular fa-chevron-down"></i> -->
								<select class="form-control" name="searchField">
									<option value="0">(선택) 서비스</option>
									<option value="query">레슨</option>
									<option value="howmuch">홈/리빙</option>
									<option value="findgosu">이벤트</option>
									<option value="together">비즈니스</option>
									<option value="howmuch">디자인/개발</option>
									<option value="findgosu">건강/미용</option>
									<option value="together">알바</option>
									<option value="howmuch">기타</option>

								</select>

							</div>
							<div class="option_loc">
								<!-- (선택) 지역 <i class="fa-regular fa-chevron-down"></i> -->
								<select class="form-control" name="searchField">
									<option value="0">(선택) 지역</option>
									<option value="query">전국</option>
									<option value="howmuch">서울</option>
									<option value="findgosu">경기</option>
									<option value="together">대전</option>
									<option value="howmuch">대구</option>
									<option value="findgosu">부산</option>
									<option value="together">제주</option>

								</select>
							</div>
						</div>


						<textarea class="text"
							placeholder="요청 서비스 정보를 공유하거나 고객과 고수님들에게 궁금한 서비스를 물어보세요.&#13;&#10;주제에 맞지 않는 글이나 커뮤니티 이용정책에 위배되어 일정 수 이상 신고를 받는 경우 글이 숨김 및 삭제될 수 있습니다."></textarea>

					</form>
				</div>
				<!-- //row -->
			</div>
			<!-- //container -->
		</div>
		<!-- //suriSize -->
	</div>
</body>

<%@ include file="../common/footer.jsp"%>



</body>
</html>