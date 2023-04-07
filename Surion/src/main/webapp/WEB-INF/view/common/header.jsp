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
		height:8vh;
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
	
	.uheader_bottom{height:5vh; display:flex; justify-content:space-between; align-items:center;}
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
	
	
	
	/* 로그인 */
	.sec_ulogin{flex-direction:column; width:100%; height:87vh; position:absolute; top:13vh; left:0; background:#fafafa; display:flex; align-items:center; justify-content:center;z-index: 99;}
	.sec_ulogin h2{text-align:center; margin-bottom:30px;}
	.sec_ulogin .ulogin{ width:420px; padding:40px; background:#fff; border:2px solid #f5f5f5; margin-bottom:20vh;}
	.sec_ulogin .ulogin .uline{margin-bottom:30px;}
	.sec_ulogin .ulogin .uline:nth-child(3){margin-bottom:20px;}
	.sec_ulogin .ulogin .uline p{color:#737373; margin-right:25px; margin-bottom:0; position:relative;}
	.sec_ulogin .ulogin .uline p::after{content:""; display: block; width: 1px; height: 11px;background: #bdbdbd;top: 7px;right: -15px; position: absolute; }
	.sec_ulogin .ulogin .uline p:last-child::after{display:none;}
	.sec_ulogin .ulogin .uline p:last-child{margin-right:0; border-right:0; padding-right:0;}
	.sec_ulogin .ulogin .uline label{width:100%; font-size:16px; font-weight:bold; margin-bottom:5px;}
	.sec_ulogin .ulogin .uline input{padding-left:10px; width:100%; height:48px; border-radius:3px; border:1px solid #e1e1e1;}
	.sec_ulogin .ulogin .uline input[type="submit"]{
		background:#00c7ae;
		color:#fff;
	}
	.lastline{margin-bottom:0 !important;}
	
	
	/* 회원가입 */
	.sec_ujoin{padding-top: 23px;flex-direction:column; width:100%; height:87vh; position:absolute; top:13vh; left:0; background:#fafafa; display:flex; align-items:center; justify-content:center;z-index: 99;}
	.sec_ujoin h2{text-align:center; margin-bottom:30px;}
	.sec_ujoin .ujoin{ width:420px; padding:40px; background:#fff; border:2px solid #f5f5f5;}
	.sec_ujoin .ujoin .uline{margin-bottom:30px;}
	.sec_ujoin .ujoin .uline:nth-child(3){margin-bottom:20px;}
	.sec_ujoin .ujoin .uline p{color:#737373; margin-right:25px; margin-bottom:0; position:relative;}
	.sec_ujoin .ujoin .uline p::after{content:""; display: block; width: 1px; height: 11px;background: #bdbdbd;top: 7px;right: -15px; position: absolute; }
	.sec_ujoin .ujoin .uline p:last-child::after{display:none;}
	.sec_ujoin .ujoin .uline p:last-child{margin-right:0; border-right:0; padding-right:0;}
	.sec_ujoin .ujoin .uline label{width:100%; font-size:16px; font-weight:bold; margin-bottom:5px;}
	.sec_ujoin .ujoin .uline input{padding-left:10px; width:100%; height:48px; border-radius:3px; border:1px solid #e1e1e1;}
	.sec_ujoin .ujoin .uline input[type="submit"]{
		background:#00c7ae;
		color:#fff;
	}
	.lastline{margin-bottom:0 !important;}
	


</style>

<div class="usec_header">
	<div class="uheader">
		<div class="uinner">
			<div class="uheader_top">
				<h1><a href="${cpath}/"><img src="${cpath}/resources/images/logo.png" alt="로고"></a></h1>
				<ul class="unav1">
					<li><a href="">엔지니어 등록</a></li>
					<li><a href="javascript:gologin()">로그인</a></li>
					<li><a href="javascript:gojoin()">무료 회원가입</a></li>
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


<!--  로그인 ---> 
<div class="sec_ulogin" style="display:none";>
	<h2>로그인</h2>
	<form>
		<div class="ulogin">
			<div class="uline">
				<label>아이디</label>
				<input type="text" placeholder="아이디를 입력해주세요.">
			</div>
			<div class="uline">
				<label>비밀번호</label>
				<input type="password" placeholder="비밀번호를 입력해주세요.">
			</div>
			<div class="uline">
				<input type="submit" value="로그인">
			</div>
			<div class="lastline uline d-flex justify-content-center">
				<p>비밀번호</p>
				<p>회원찾기</p>
			</div>
		</div>
	</form>
</div>


<!--  회원가입  ---> 
<div class="sec_ujoin" style="display:none";>
	<h2>회원가입</h2>
	<form>
		<div class="ujoin">
			<div class="uline">
				<label>아이디</label>
				<input type="text" placeholder="아이디를 입력해주세요.">
			</div>
			<div class="uline">
				<label>비밀번호</label>
				<input type="password" placeholder="비밀번호를 입력해주세요.">
			</div>
			<div class="uline">
				<label>비밀번호 확인</label>
				<input type="password" placeholder="비밀번호를 입력해주세요.">
			</div>
			<div class="uline">
				<label>이름</label>
				<input type="password" placeholder="이름을 입력해주세요.">
			</div>
			<div class="uline">
				<label>전화번호</label>
				<input type="password" placeholder="이름을 입력해주세요.">
			</div>
			<div class="uline">
				<input type="submit" value="회원가입">
			</div>
		</div>
	</form>
</div>



<script>

	//로그인창
	function gologin(){
		$('.sec_ujoin').css('display', 'none');
		$('.sec_ulogin').css('display', 'flex');
		$('body').css({
			'height':'100vh',
			'overflow':'hidden',
		})
	}
	
	//로그인창
	function gojoin(){
		$('.sec_ulogin').css('display', 'none');
		$('.sec_ujoin').css('display', 'flex');
		$('body').css({
			'height':'100vh',
			'overflow':'hidden',
		})
	}
	
	
	
	

	
</script>
