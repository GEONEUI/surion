<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />


<style>
.rate {
	display: inline-block;
	border: 0;
	margin-right: 1%;
}

.rate>input {
	display: none;
}

.rate>label {
	float: right;
	color: #ddd
}

.rate>label:before {
	display: inline-block;
	font-size: 1rem;
	padding: .3rem .2rem;
	margin: 0;
	cursor: pointer;
	font-family: FontAwesome;
	content: "\f005 ";
}

.rate .half:before {
	content: "\f089 ";
	position: absolute;
	padding-right: 0;
}

.rate input:checked ~ label, .rate label:hover, .rate label:hover ~
	label {
	color: #f73c32 !important;
}

.rate input:checked+.rate label:hover, .rate input input:checked ~ label:hover,
	.rate input:checked ~ .rate label:hover ~ label, .rate label:hover ~
	input:checked ~ label {
	color: #f73c32 !important;
}

body {
	margin-top: 20px;
	color: #1a202c;
	text-align: left;
	background-color: #e2e8f0;
}

@media ( min-width : 992px) {
	.sticky-navbar .inner-wrapper {
		height: calc(100vh - 3.5rem - 48px);
	}
}

.inner-main-body {
	padding: 1rem;
	position: relative;
	flex: 1 1 auto;
}

.inner-main-body .sticky-top, .sticky-top {
	z-index: 999;
}

@media ( max-width : 767.98px) {
	.inner-expand .main-body {
		overflow: hidden;
	}
	.inner-expand .inner-wrapper {
		transform: translate3d(235px, 0, 0);
	}
}

.nav .show>.nav-link.nav-link-faded, .nav-link.nav-link-faded.active,
	.nav-link.nav-link-faded:active, .nav-pills .nav-link.nav-link-faded.active,
	.navbar-nav .show>.nav-link.nav-link-faded {
	color: #3367b5;
	background-color: #c9d8f0;
}

.nav-pills .nav-link.active, .nav-pills .show>.nav-link {
	color: #fff;
	background-color: #467bcb;
}

.nav-link.has-icon {
	display: flex;
	align-items: center;
}

.nav-link.active {
	color: #467bcb;
}

.nav-pills .nav-link {
	border-radius: .25rem;
}

.nav-link {
	color: #4a5568;
}

.card {
	position: relative;
	display: flex;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	background-color: #fff;
	background-clip: border-box;
	border: 0 solid rgba(0, 0, 0, .125);
	border-radius: .25rem;
	padding: 0 !important;
}

.card-body {
	flex: 1 1 auto;
	min-height: 1px;
}

.test {
	height: 115px;
	transition: .2s;
	cursor: pointer;
	overflow-y: hidden
}

.active .test {
	height: 300px;
	cursor: context-menu;
}

.chatRoom:hover {
	background-color: gray;
	cursor: pointer;
}

#paddingnone {
	padding: 0;
}
</style>

<!--채팅방 목록-->
<div class="card shadow-sm p-3 mb-5 bg-body rounded" id="chat1"
	style="border-radius: 15px; height: 90%;">
	<div class="container" id="target"></div>
</div>

<script>
 
    let target = document.getElementById('target');
 	$(document).ready(function(){
 		findAllRoom();  		
    });
 
	//방찾기
    function findAllRoom() {
		var viewHtml = '';
		var PreMessage, sendTime;
		$.ajax({
			url:"${cpath}/chat/rooms",
         	type:"get",
         	data:{
         		"member_id" : "${member.id}"
         		},
         	error:function(){
				alert("채팅목록 불러오기 실패")
			},
			success:function(res){
				$.each(res, function(idx, obj){
					
					$.ajax({
						url: "${cpath}/chat/findMessage",
						type: "post",
						async:false, //ajax는 비동기라서 값을 원하는대로 못가져 올 수도 있기에, 동기로 바꿈
						data:{
							"room_id" : obj.room_id
						},
						error:function(){
							alert("채팅방 아이디 가져오기 실패");
						},
						success:function(message){
							console.log(message)
								PreMessage = message.message;/* substr(0, 20) */	
								sendTime = message.send_time; /* substr(4, 17) */
							
						}
					});
					
					viewHtml += '<div onclick="enterRoom('+"'"+obj.room_id+"'"+')" class="col chatRoom shadow-sm p-3 mb-1 bg-body rounded" style="height:100px;">'; 
					viewHtml += '<div class="d-flex">';
					if(obj.imgurl != null){						
						viewHtml +=	'<img src="${cpath}/resources/images/'+obj.imgurl+'" alt="프로필" width="45px" height="45px" style="border-radius: 50%">';
					} else {
						viewHtml +=	'<img src="${cpath}/resources/images/default.png" alt="프로필" width="45px" height="45px" style="border-radius: 50%">';
					}
					if(obj.shopName == null){
						viewHtml += '<p class="fs-3 text ms-3">'+ obj.othermem_id + '</p>'
					}else {					
						viewHtml += '<p class="fs-3 text ms-3">'+obj.shopName +'(' + obj.othermem_id +')</p>'
					}
					viewHtml += '</div>';
					viewHtml += '<div class="d-flex justify-content-between">';
					

					if(PreMessage == null){						
						viewHtml += '</div>';
						viewHtml += '</div>';
					} else {
						viewHtml += '<p class="fs-5 mb-5 text">'+PreMessage.substr(0, 20)+'</p>';
						viewHtml += '<p class="fs-6 text">'+sendTime.substr(4, 17) +'</p>'
						viewHtml += '</div>';
						viewHtml += '</div>';
						
					}
					/* console.log(PreMessage);
					console.log(sendTime); */
				    target.innerHTML = viewHtml;	  
					
					});    	            			  
         		}
         	});
     } 
	

    function enterRoom(roomId) {
            localStorage.setItem('wschat.member_id', '${member.id}');
            localStorage.setItem('wschat.room_id',roomId);
            location.href="${cpath}/chat/room/enter/"+roomId;
        
    }
    
    
 </script>