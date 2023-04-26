<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />

<script>
	$(function(){
		var frm = $('#frm');
		$("button").on('click', function(e){
			var oper = $(this).data('oper');
			if(oper == 'infoChange'){
				frm.find('input').attr('readonly', false);
				frm.find('#email').html('<small>* 변경하실 이메일을 입력해주세요.</small>');
				frm.find('#pass').html('<small>* 변경하실 비밀번호를 입력해주세요.</small>');
				frm.find('#favor').html('<small>* 수리관심사를 선택해주세요.</small>');
				frm.find('#name').html('<small>* 변경하실 이름을 입력해주세요.</small>');
				frm.find('#phone').html('<small>* 변경된 휴대폰 번호를 입력해주세요.</small>');
				$('#target').html('<button data-oper="update" class="btn btn-sm" style="background:#00c7ae; color:#fff;">변경완료</button>');
			}
		});
	});
	
</script>

<style>


	#my_page_right img{
		margin-bottom: 20px;
		border-radius:65px;
	}

	#my_page_right .item{
		width: 100%;
	}

	#my_page_right .item .item_left{
		padding-right: 63px;
    	padding-left: 36px;
		display:flex;
		align-items:center;
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
						<c:if test="${member.imgurl eq null}">
							<img id="a" class="preview" src="${cpath}/resources/images/default.png" alt="기본프로필 이미지" width="110">
						</c:if>
						<c:if test="${member.imgurl ne null}">
							<img id="b" class="preview" src="${cpath}/resources/images/${member.imgurl}" alt="기본프로필 이미지" width="110">
						</c:if>
							<button
								id="mbtn"
								type="button"
								class="btn"
								data-bs-toggle="modal"
								data-bs-target="#myModal"
								style="background:#00c7ae; color:#fff;">
								프로필
							</button>		
					</div>
					<div class="item_right">
						<form id="frm" action="${cpath}/member/updateProfile" enctype="multipart/form-data" method="post">
							<div class="formgroup">
								<p>이름</p>
								<input type="text" value="${member.name}" name="name" readonly="readonly">
								<span id="name"></span>
							</div>
							<div class="formgroup">
								<p>이메일</p>
								<input type="text" value="${member.email}" name="email" readonly="readonly">
								<span id="email"></span>
							</div>
							<div class="formgroup">
								<p>비밀번호 변경</p>
								<input type="password" value="${member.password}" name="password" readonly="readonly">
								<span id="pass"></span>
							</div>
							<div class="formgroup">
								<p>주소</p>
								<input type="text" name="address" value="${member.address}" readonly="readonly">
								<span id="favor"></span>
							</div>
							<div class="formgroup">
								<p>휴대폰번호</p>
								<input type="text" value="${member.phone}" name="phone" readonly="readonly">
								<span id="phone"></span>
							</div>
							<div id="target" class="formgroup">
								<button type="button" data-oper="infoChange" class="btn btn-sm btn-primary">정보변경</button>
							</div>
							<div class="modal" id="myModal">
							  <div class="modal-dialog">
							    <div class="modal-content">
								      <!-- Modal Header -->
									       <div class="modal-header" style="background:#00c7ae;">
									        <h4 class="modal-title text-white">프로필을 선택해주세요.</h4>
									        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
									      </div>
								      <!-- Modal body -->
								      <div class="modal-body">
								      		<input id="imgname" type="file" onchange="preImg(this)" name="imgurl" value="${member.imgurl}">
								      		<input type="hidden" name="id" value="${member.id}"/>
								      </div>
							    </div>
							  </div>
							</div>	
						</form>
					</div>
				</div>	
				
	
	
	<c:if test="${!empty updateMsg}">
		<script>
			alert('${updateMsg}');
		</script>
	</c:if>

	<script>
	


		
		function preImg(input){
			
			
			if(input.files && input.files[0]){
				var reader = new FileReader();
				reader.onload = function(e){
					if(document.querySelector('#a')){
						document.querySelector('#a').src = e.target.result;
					}
					if(document.querySelector('#b')){
						document.querySelector('#b').src = e.target.result;	
					}
				};
				reader.readAsDataURL(input.files[0]);
			}
		}
		

	
		
	</script>
				
				