<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />   
<style>

	body{
		 overFlow : scroll
	}
	/* 회원가입 */
	.sec_ujoin{padding-top: 23px;flex-direction:column; width:100%; height:87vh;background:#fafafa; display:flex; align-items:center; justify-content:center;z-index: 99;}
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
	
	
	/* 중복확인 */
	.idcheck{
		display:flex;
		justify-content:space-between;
	}
	
	.idcheck button{
		width:30%;
		border:none;
		color:#454545;
	}

	
	
	
</style>

<html>
<%@ include file="./front_header.jsp" %>
<body>
<%@ include file="./header.jsp" %>
<!--  회원가입  ---> 
<div class="sec_ujoin">
	<h2>회원가입</h2>
	<form action="${cpath}/member/join" method="post">
		<div class="ujoin">
			<div class="uline">
				<label>아이디</label>
				<div class="idcheck">
					<input type="text" placeholder="아이디를 입력해주세요." name="Id">
					<button onclick="idConfirm();">중복확인</button>
				</div>
			</div>
			<div class="uline">
				<label>비밀번호</label>
				<input type="password" placeholder="비밀번호를 입력해주세요." name="password">
			</div>
			<div class="uline">
				<label>비밀번호 확인</label>
				<input type="password" placeholder="비밀번호를 입력해주세요." name="password2">
			</div>
			<div class="uline">
				<label>이름</label>
				<input type="text" placeholder="이름을 입력해주세요." name="name">
			</div>
			<div class="uline">
				<label>이메일</label>
				<input type="text" placeholder="이메일을 입력해주세요." name="email">
			</div>
			<div class="uline">
				<input type="submit" value="회원가입">
			</div>
		</div>
	</form>
</div>
<script>
	
	function idConfirm(){
		$.ajax({
			url:"${cpath}/member/check",
			type:"get",
			success:idConfirmResult,
			error: function(){ alert('error')}
		});
	}
	
	
	function idConfirmResult(data){
		alert(data);
	}


	function gologin(){
		location.href='${cpath}/member/login';
	}
	
	function gojoin(){
		location.href='${cpath}/member/join';
	}
</script>

</body>
</html>



