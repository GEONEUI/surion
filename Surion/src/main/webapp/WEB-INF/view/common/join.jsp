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
	.sec_ujoin .ujoin .uline{margin-bottom:30px; height:75px;}
	.sec_ujoin .ujoin .uline:last-child{margin-bottom:0; height:40px;}
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
	<form id="frm" action="${cpath}/member/join" method="post" name="frma">
		<div class="ujoin">
			<div class="uline">
				<label>아이디</label>
				<div class="idcheck">
					<input type="text" placeholder="아이디를 입력해주세요." name="Id" id='Id' value="${id}">
					<button type="button" onclick="idConfirm();">중복확인</button>
				</div>
				<span id="idWarning" style="color:red"></span>
			</div>
			<div class="uline">
				<label>비밀번호</label>
				<input type="password" placeholder="비밀번호를 입력해주세요." name="password" id="password" onclick="pw();" value="${pw}">
			</div>
			<div class="uline">
				<label>비밀번호 확인</label>
				<input type="password" placeholder="비밀번호를 입력해주세요." name="password2" id="password2">
				<span id="pwWarning" style="color:red"></span>
			</div>
			<div class="uline">
				<label>이름</label>
				<input type="text" placeholder="이름을 입력해주세요." name="name" id="name" onclick="nikname();" value="${na}">
				<span id="nameWarning" style="color:red"></span>
			</div>
			<div class="uline">
				<label>이메일</label>
				<input type="email" placeholder="이메일을 입력해주세요." name="email" id="email" onclick="usermail();" value="${em}">
				<span id="emailWarning" style="color:red"></span>
			</div>
			<div class="uline">
				<input type="submit" value="회원가입" onclick="return totalResult()">
			</div>
		</div>
	</form>
</div>


  <button id="mbtn" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal" style="display:none;">
    Open modal
  </button>
  
  
  
<c:if test="${!empty msg}">
	<!-- 모든 요청모달 여기로 해주세요. -->
		<!-- The Modal -->
		<div class="modal" id="myModal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		
		      <!-- Modal Header -->
		      <c:if test="${msgTitle == 'Error Message!'}">
			       <div class="modal-header bg-danger" style="background:#00c7ae;">
			        <h4 class="modal-title text-white">${msgTitle}</h4>
			        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			      </div>
		      </c:if>
			  <c:if test="${msgTitle != 'Error Message!'}">
			       <div class="modal-header" style="background:#00c7ae;">
			        <h4 class="modal-title text-white">${msgTitle}</h4>
			        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			      </div>
		      </c:if>
		      <!-- Modal body -->
		      <div class="modal-body">
		        ${msg}
		      </div>
		    </div>
		  </div>
		</div>



	<script>
		$(function(){
			$('#mbtn').trigger('click');
		});
	</script>
</c:if>


<script>
	
	var idWarning = $('#idWarning');
	var pwWarning = $('#pwWarning');
	var nameWarning = $('#nameWarning');
	var emailWarning = $('#emailWarning');
	var frm = $('#frm');
	var idflag = true;
	var pwflag = false;
	var nameflag = false;
	var emailflag = false;
	var dataResult;
	var confirm = false;
	
	
	var idValue;
	var passwordValue;
	var password2Value;
	var nameValue;
	var emailValue;
	var lastIdValue;
	var user_id;
	


	
		function pw(){
			pwflag = true;
		}
		
		function nikname(){
			nameflag = true;
		}
		
		function usermail(){
			emailflag = true;
		}
		
		
		makeResult();
		
		function totalResult(){
			return confirm;
		}
		
		function makeResult(){
			
			if(dataResult == 0){
				idWarning.html('아이디 중복 확인이 완료 되었습니다.');
				idWarning.css('color', 'green');
				idflag = false;
				confirm = true;
			}
			
			frm.on('keyup', function(){
				
				console.log(confirm);
				
				idValue = $('#Id').val();
				passwordValue = $('#password').val();
				password2Value = $('#password2').val();
				nameValue = $('#name').val();
				emailValue = $('#email').val();

				//유효성 기본상태
					if(idflag){
						if(idValue != null){
							idWarning.html('아이디 중복 확인을 해주세요.');	
							idWarning.css('color', 'red');
							confirm = false;
						}
						if(idValue == ''){
							idWarning.html('아이디에 빈 값을 입력 하실 수 없습니다.');
							idWarning.css('color', 'red');
						}
					}
				
					if(user_id != idValue){
						idWarning.html('아이디 중복 확인을 해주세요.');	
						idWarning.css('color', 'red');
					}
				
					
					if(pwflag){
						if(passwordValue == ''){
							pwWarning.html('비밀번호에 빈 값을 입력 하실 수 없습니다.');
							pwWarning.css('color', 'red');
						}else if(passwordValue == password2Value){
							pwWarning.html('비밀번호가 일치합니다.');
							pwWarning.css('color', 'green');
						}else if(passwordValue != password2Value){
							pwWarning.html('비밀번호가 일치하지 않습니다.');
							pwWarning.css('color', 'red');
						}
					}
					
					
					if(nameflag){
						if(nameValue != ''){
							nameWarning.html('');
						}
						if(nameValue == ''){
							nameWarning.html('이름에 빈값을 입력하실 수 없습니다.');	
							nameWarning.css('color', 'red');
						}
					}
					
					
					if(emailflag){
						if(emailValue == ''){
							emailWarning.html('이메일에 빈값을 입력하실 수 없습니다.');	
							emailWarning.css('color', 'red');
						}
						
						if(emailValue != ''){
							emailWarning.html('');	
						}
					}
					

			});
		}
		
		
		
		
		function gologin(){
			location.href='${cpath}/member/login';
		}
		
		function gojoin(){
			location.href='${cpath}/member/join';
		}
		
		
		
	
	

	//중복체크
	function idConfirm(){
		user_id = $('#Id').val();
		
		$.ajax({
			url:"${cpath}/member/check",
			type:"get",
			data:{
				"id":user_id,
			},
			success:idConfirmResult,
			error: function(){ alert('error')}
		});
	}
	
	
	function idConfirmResult(data){
		dataResult = data;
		if(data == 1){
			alert('다른 아이디를 입력해주세요.');
		}else{
			alert('사용 가능한 아이디 입니다.');
		}
		makeResult();
	}
	
	
	

	
	
	
</script>

</body>
</html>



