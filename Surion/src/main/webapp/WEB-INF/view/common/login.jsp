<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />  
<style>

	body{
		 overFlow : scroll
	}
	/* 로그인 */
	.sec_ulogin{flex-direction:column; width:100%; height:87vh;  background:#fafafa; display:flex; align-items:center; justify-content:center;z-index: 99;}
	.sec_ulogin h2{text-align:center; margin-bottom:30px;}
	.sec_ulogin .ulogin{ width:420px; padding:40px; background:#fff; border:2px solid #f5f5f5; margin-bottom:15vh;}
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
	
</style>

<html>
<%@ include file="./front_header.jsp" %>
<body>
<%@ include file="./header.jsp" %>
<!--  로그인 ---> 
<div class="sec_ulogin">
	<h2>로그인</h2>
	<form action="${cpath}/member/login" method="post">
		<div class="ulogin">
			<div class="uline">
				<label>아이디</label>
				<input type="text" placeholder="아이디를 입력해주세요." name="id">
			</div>
			<div class="uline">
				<label>비밀번호</label>
				<input type="password" placeholder="비밀번호를 입력해주세요." name="password">
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
	function gologin(){
		location.href='${cpath}/member/login';
	}
	
	function gojoin(){
		location.href='${cpath}/member/join';
	}
</script>

</body>
</html>

