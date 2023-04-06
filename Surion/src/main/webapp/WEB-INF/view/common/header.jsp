<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		height:74px;
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
	
	.uheader_bottom{height:48px; display:flex; justify-content:space-between; align-items:center;}
	.uheader_bottom .unav2{display:flex; justify-content:space-between; align-items:center;}
	.uheader_bottom .unav2 li{margin-right: 45px;}
	.uheader_bottom .unav2 li a{display:block;}

	.uheader_bottom p{font-size: 14px; margin-bottom: 0;}


	.ubold{
		font-weight: bold;
	}

	/* uvisual */
	.usec_visual{
		background: #000;
	}
	.usec_visual .uinner{}
	.usec_visual .uinner .uvisual{
		width: 100%;
		height: 450px;
		background: url('${cpath}/resources/images/visual.png')center center / cover no-repeat;
	}


	/* search */
	.search{}
	.search form{display:flex; justify-content:center; }
	.search form input{
		border-radius:20px 0 0 20px;
		width: 220px; height: 40px;
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


</style>

<div class="usec_header">
	<div class="uheader">
		<div class="uinner">
			<div class="uheader_top">
				<h1><a href="${cpath}/"><img src="${cpath}/resources/images/logo.png" alt="로고"></a></h1>
				<ul class="unav1">
					<li><a href="">엔지니어 등록</a></li>
					<li><a href="#">로그인</a></li>
					<li><a href="#">무료 회원가입</a></li>
				</ul>
			</div>
			<div class="uheader_bottom">
				<ul class="unav2">
					<li><a href="#" class="ubold">전체카테고리</a></li>
					<li><a href="${cpath}/repair/repairList">의뢰목록</a></li>
					<li><a href="${cpath}/repair/orderList">엔지니어</a></li>
					<li><a href="${cpath}/community/board">커뮤니티</a></li>
					<li><a href="${cpath}/mypage/myinfo">My페이지</a></li>
					<li><a href="#">마켓</a></li>
				</ul>
				<p>원하는 서비스를 못 찾겠다면, <span class="ubold">프로젝트 의뢰</span>하세요! ></p>
			</div>
		</div>
	</div>
</div>
