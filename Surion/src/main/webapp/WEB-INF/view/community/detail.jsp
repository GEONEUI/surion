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
	padding-top: 20px;
	font-weight: bold;
	color: gray;
}

h3 {
	padding-top: 20px;
}

.loc {
	padding: 10px 0;
}

.picture {
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

.category {
	color: gray;
}

.profile {
	display: flex;
	padding: 45px 0;
}

.profile img {
	border-radius: 20%;
}

.profile_pic {
	width: 50px;
	height: 50px;
}

.namedate {
	margin-left: 10px;
}

.profile_name {
	font-weight: bold;
}

.content {
	height: 300px;
}

.pic img {
	border-radius: 3%;
}

.pic_box {
	padding: 20px 0;
}

.likecomment {
	display: flex;
	align-items: center;
	padding: 10px 0;
}

.like {
	margin-right: 30px;
}

.comm {
	border: 1px solid lightgray;
	width: 500px;
	height: 70px;
}

.gosu_comments {
	padding: 30px;
	display: flex;
}

.gosu_profile {
	
}

.gosu_profile img {
	border-radius: 20%;
}

.gosu_nameinfo {
	margin-left: 10px;
}

.gosu_name {
	font-weight: bold;
}

.gosu_info {
	font-size: 15px;
	color: gray;
}

.comm_comment {
	padding: 10px 0;
}

.time_before {
	
}

.little{
	display: flex;
	width: 300px;
	font-size: 13px;
	color: gray;
}

</style>
<!-- <script> 
//선택한 것 보여주기
function change(){
	
	var values = document.getElementById('test').value;
	document.getElementById('show').value = values;
}
</script> -->
<body>
	<%@ include file="../common/header.jsp"%>
	<div class="suriSize">
		<div class="container">
			<div class="row justify-content-between" style="min-height: 500px;">
				<%@ include file="../common/communiSidebar.jsp"%>
				<div class="col-lg-9" id="my_page_right">
					<!-- 커뮤니티 글 자세히 보기 -->
					<div class="category">커뮤니티 > 고수찾아요</div>
					<div class="subject">철거</div>
					<h3>옷장 철거를 하고 싶습니다</h3>
					<div class="loc">경기/수원시 권선구</div>
					<div class="profile">
						<img src="${cpath}/resources/images/d.jpg" alt="프로필 이미지"
							width="50" height="50">
						<div class="namedate">
							<div class="profile_name">이름</div>
							<div class="profile_date">날짜 조회수</div>
						</div>
					</div>
					<div class="content">글 내용</div>
					<div class="pic_box">
						<div class="pic">
							<img src="${cpath}/resources/images/d.jpg" alt="업로드한 이미지"
								width="500" height="300">
						</div>
					</div>
					<div class="likecomment">
						<div class="like">
							<i class="fa-solid fa-thumbs-up"></i> 좋아요 0
						</div>
						<div>
							<i class="fa-sharp fa-solid fa-comment-dots"></i> 댓글 3
						</div>
					</div>
					<input type="text" placeholder="    댓글을 남겨보세요." class="comm">
					<div class="gosu_comments">
						<div class="gosu_profile">
							<img src="${cpath}/resources/images/d.jpg" alt="고수 이미지"
								width="50" height="50">
						</div>
						<div class="gosu_nameinfo">
							<div class="gosu_name">이름</div>
							<div class="gosu_info">세탁기 수리/설치</div>
							<div class="comm_comment">댓글 내용</div>
							<div class="little">
								<div class="time_before">
									7분전 </div>
							<div><i class="fa-solid fa-thumbs-up"></i>좋아요</div> 
							<div>답댓글</div>
								

							</div>
						</div>
					</div>
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