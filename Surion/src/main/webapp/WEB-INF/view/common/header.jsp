<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />  
<style>
	.usec_header{
		background: #fff !important;
		position:fixed;
		top: 0;
		left: 0;
		width: 100%;
		z-index: 99;
		box-shadow: rgba(0, 0, 0, 0.12) 0px 1px 3px, rgba(0, 0, 0, 0.24) 0px 1px 2px;
	}
	.uinner{
		width: 1200px;
		margin:0 auto;
		padding: 0 16px;
	}

	.uheader_top{
		display:flex;
		align-items:center;
		justify-content:space-between;
		height:8vh;
		position:relative;
	}

	.unav1, .unav2{
		display:flex;
		align-items:center;
		margin-bottom: 0;
		padding: 0;
	}

	.unav1 li{
		margin-right:20px;
	}
	
	.unav1 li img{
		cursor:pointer;
	}

	.unav1 li:nth-child(2){
		margin-right:10px;
	}

	.unav1 li:last-child{
		margin-right: 0;
	}
	.unav1 li a{
		display:block;
		padding:10px 24px;
		font-size:15px;
	}

	.unav1 li:last-child a{
		background: #00c7ae;
		border-radius: 4px;
		color: #fff;
	}
	
	.uheader_bottom{height:5vh; display:flex; justify-content:space-between; align-items:center;}
	.uheader_bottom .unav2{display:flex; justify-content:space-between; align-items:center;}
	.uheader_bottom .unav2 li{margin-right: 45px;}
	.uheader_bottom .unav2 li a{display:block;}

	.uheader_bottom p{font-size: 14px; margin-bottom: 0;}


	.ubold{
		font-weight: bold;
	}



	/* search */
	.search{}
	.search form{display:flex; justify-content:center; }
	.search form input{
		border-radius:20px 0 0 20px;
		width: 220px;
		height: 40px;
		border:1px solid #ccc;
		border-right: 0;
		outline:none;
		font-size: 14px;
		padding-left: 15px;
		color: #666;
	}
	.search form button{
		width: 60px;
		height: 40px;
		border-radius:0 20px 20px 0;
		border-left:none;
		background: #fff;
		border:1px solid #ccc;
		border-left: 0;
		outline:none;
	}

	.search i{
		font-size: 15px;
		color:#444;	
	}
	
	
	.myinfo{
		width:240px;
		background:#fff;
		box-shadow: rgba(0, 0, 0, 0.25) 0px 0.0625em 0.0625em, rgba(0, 0, 0, 0.25) 0px 0.125em 0.5em, rgba(255, 255, 255, 0.1) 0px 0px 0px 1px inset;
		position:absolute;
		top:70px;
		right:-30px;
		z-index:999;
	}

	
	
	.mybox{
		padding:20px 30px;
	}
	
	.mybox p{
		font-size:17px;
		margin-bottom:30px;

	}
	
	.mybox ul{}
	
	.mybox ul li{
		margin-bottom:20px;
	}

	
	.mybox ul li:last-child{
		margin-bottom:0;
	}
	
	.mybox ul li a{
		font-size:16px;
		color:#5c5c5c;
	}
	
	.myinfo{
		display:none;
	}
	
	.myinfo .logout{
		display:block;
		text-align:center;
		padding:12px 0;
		background:#efefef;
		color:#525252;
		
	}
	
	.myinfo.active{
		display:block;
	}

</style>

<div class="usec_header">
	<div class="uheader">
		<div class="uinner">
			<div class="uheader_top">
				<h1><a href="${cpath}/"><img src="${cpath}/resources/images/logo.png" alt="로고"></a></h1>
				<c:if test="${empty member}">
					<ul class="unav1">
						<li><a href="javascript:gologin2()">엔지니어 등록</a></li>
						<li><a href="javascript:gologin()">로그인</a></li>
						<li><a href="javascript:gojoin()">무료 회원가입</a></li>
					</ul>
				</c:if>
				<c:if test="${!empty member}">
					<ul class="unav1">
						<c:if test="${member.office eq ''}">
						   <li><a href="javascript:gomechanic()" style="background: #00c7ae; border-radius: 4px; color: #fff;">엔지니어 등록</a></li>
						</c:if>
						<c:if test="${member.office ne ''}">
						   <c:choose>
								<c:when test="${result == 1}">
									<li><a href="javascript:alert('이미 업체 등록을 하셨습니다.')" style="background: #00c7ae; border-radius: 4px; color: #fff;">업체 등록</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="${cpath}/order2/orderForm" style="background: #00c7ae; border-radius: 4px; color: #fff;">업체 등록</a></li>
								</c:otherwise>
							</c:choose>
						</c:if>
						<c:if test="${member.imgurl eq null}">
							<li onclick="goProfile();"><img src="${cpath}/resources/images/default.png" width="40" style="border-radius:12px;"></li>
						</c:if>
						<c:if test="${member.imgurl ne null}">
							<li onclick="goProfile();"><img src="${cpath}/resources/images/${member.imgurl}" width="40" style="border-radius:12px;"></li>
						</c:if>	
					</ul>
					<!--  내 정보 모탈창  -->
					<div class="myinfo">
						<div class="mybox">
							<p>${member.id} &nbsp 고객님</p>
							<ul>
								<li><a href="#"><i class="fa-solid fa-money-bill-wave" style="color: #525252; margin-right:10px;"></i>받은 견적</a></li>
								<li><a href="${cpath}/mypage/myinfo"><i class="fa-solid fa-circle-user" style="color: #525252; margin-right:10px;"></i> 마이페이지</a></li>
							</ul>
						</div>
						<a class="logout" href="${cpath}/member/logout">로그아웃</a>
					</div>
				</c:if>
			</div>
			<div class="uheader_bottom">
				<ul class="unav2">
					<li><a href="#" class="ubold">전체카테고리</a></li>
					<li><a href="${cpath}/repair/repairList">의뢰목록</a></li>
					<li><a href="${cpath}/order2/orderList">엔지니어</a></li>
					<li><a href="${cpath}/community/board">커뮤니티</a></li>
				</ul>
				<p>원하는 서비스를 못 찾겠다면, <span class="ubold">프로젝트 의뢰</span>하세요! ></p>
			</div>
		</div>
	</div>

</div>


<script>

	function goProfile(){
		$('.myinfo').toggleClass('active');
	}

	function gologin(){
		location.href='${cpath}/member/login';
	}
	
	function gojoin(){
		location.href='${cpath}/member/join';
	}
	function gomechanic() {		    
		location.href = '${cpath}/order2/orderJoin';
		}
	function goBoard(){
		location.href='${cpath}/order2/orderForm';
	}
	function gologin2(){
		alert("로그인 후 이용해 주세요.")
		location.href='${cpath}/member/login';
	}
</script>


