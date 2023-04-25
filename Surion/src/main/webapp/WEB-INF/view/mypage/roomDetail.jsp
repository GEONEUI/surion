<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../common/front_header.jsp" %>

<body>
<%@ include file="../common/header.jsp" %>
	<div class="container" id="app">
		<div>
			<h2>방제목</h2>
		</div>
		<div class="input-group">
			<div class="input-group-prepend">
				<label class="input-group-text">내용</label>
			</div>
			<input type="text" class="form-control" id="messageVal">
			<div class="input-group-append">
				<button class="btn btn-primary" type="button"
					onclick="sendMessage()">보내기</button>
			</div>
		</div>
		<ul class="list-group" id="msgArea">
			<li class="list-group-item" >
			
				</li>
		</ul>
		<div></div>
	</div>
	<!-- Jquery -->
	<script src="https://code.jquery.com/jquery-3.6.4.js"
		integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
		crossorigin="anonymous"></script>
	<!-- socket -->
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
	<script>
		//alert(document.title);
		// websocket & stomp initialize
		var sock = new SockJS("http://"+location.host+"/surion/ws-stomp");
		var ws = Stomp.over(sock);
		var reconnect = 0;

		let room_id = '';
		let room = {};
		let member_id = '';
		let message = '';
		let messages = [];
		let send_time = '';

		$(document).ready(function() {
			room_id = localStorage.getItem('wschat.room_id');
/* 			member_id = localStorage.getItem('wschat.member_id');
 */			findRoom();
			console.log("------------"+room_id);
		});

		function renderChat(newMsg) {
			let msgArea = document.getElementById("msgArea");
			let newMsgSpan = document.createElement("span");
			let viewHtml = '<li class="list-group-item">' + newMsg + '</li>';
			newMsgSpan.innerHTML = viewHtml;
			msgArea.append(newMsgSpan);
		}

		function findRoom() {
			$.ajax({
				url : '/surion/chat/room/' + room_id,
				type : 'get',
				error : function() {
					alert('채팅방 입장 실패');
				},
				success : function(res) {
					room = res.data;
					console.log("room info---" + room);
				}
			});
		}

		function sendMessage() {
			message = $('#messageVal').val();
			ws.send("/pub/chat/message", {}, JSON.stringify({
				type : 'TALK',
				room_id : room_id,
				member_id : member_id,
				message : message,
				send_time : new Date()
			}));
			message = '';
		}

		function recvMessage(recv) {
			messages.unshift({
				"type" : recv.type,
				"romm_id" : recv.type == 'ENTER' ? '[알림]' : recv.member_id,
				"message" : recv.message
			})
			renderChat(recv.message);

		}

		function connect() {
			// pub/sub event
			ws.connect({}, function(frame) {
				ws.subscribe("/sub/chat/room/" + room_id, function(
						message) {
					var recv = JSON.parse(message.body);
					recvMessage(recv);
				});
				ws.send("/pub/chat/message", {}, JSON.stringify({
					type : 'ENTER',
					room_id : room_id,
					member_id : member_id
				}));

			}, function(error) {
				if (reconnect++ <= 5) {
					setTimeout(function() {
						console.log("connection reconnect");
						sock = new SockJS("/ws-stomp");
						ws = Stomp.over(sock);
						connect();
					}, 10 * 1000);
				}
			});
		}
		connect();
	</script>
	<%@ include file="../common/footer.jsp" %>
		</body>
	
</html>