<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
    <style>
        @import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

        textarea {
            height: 100px;
            border: none;
            resize: none;
        }

        .rate {
            display: inline-block;
            border: 0;
            margin-right: 33%;
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

        .rate input:checked~label,
        .rate label:hover,
        .rate label:hover~label {
            color: #f73c32 !important;
        }

        .rate input:checked+.rate label:hover,
        .rate input input:checked~label:hover,
        .rate input:checked~.rate label:hover~label,
        .rate label:hover~input:checked~label {
            color: #f73c32 !important;
        }
		

		#rarara{
			position: relative;
		}

		#sendBtnDiv{
			position: absolute;
			bottom: 0;
		}


    </style>
            <div class="row justify-content-between" style="min-height: 500px;">
                <div class="col-lg-8 px-3">
                    <!--채팅창-->
                    <div class="d-flex">
                        <div style="max-height:600px;">
                            <div class="card" id="chat1" style="border-radius: 15px; min-height: 550px;">

                                <div class="card-body" id="rarara" style="min-width: 528px">
                                    <div style="overflow:auto; max-height:373px;" class="msgArea" id="chatMonitor">
                                        <!--여기부터 -->
                                         <!--   <div class="d-flex flex-row justify-content-start mb-3">
                                            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava1-bg.webp"
                                                alt="avatar 1" style="width: 45px; height: 100%;"><!--프로필 -->
                                           <!--  <div class="p-3 ms-3"
                                                style="margin-right:5px; border-radius: 15px; background-color: rgba(57, 192, 237,.2);">
                                                <!--말풍선-->
                                               <!--  <p class="small mb-0">내일 오후 3시 시간
                                                    되세요?ㅇㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅇㅁㄴㅇㅁㅇㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ
                                                </p>
                                            </div>
                                        </div> 
                                        <!--여기까지 채팅 한부분 -->

                                    </div>
                                    <div class="text-end align-bottom mb-1" id="sendBtnDiv" style="vertical-align: bottom; width: 95%">
                                        <textarea class="content form-control border border-primary-subtle"
                                            id="messageArea" placeholder="욕설 및 혐오발언은 제재 대상입니다."></textarea>
                                        <button type="button" class="sendbtn btn btn-outline-primary"
                                            style="margin-top:4px" onclick="sendMsg()" id="sendBtn">보내기</button>
                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <!--고수 정보-->
                    <div class="card text-center me-0" id="chat1" style="border-radius: 15px; height:100%; max-height: 550px;">
						<center>
                            <img class="d-flex mt-1"
                                src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava1-bg.webp"
                                alt="avatar 1" style="width: 120px; height: 120px;">
						</center>
                            <p class="fs-3 text mt-1 mb-0">자전거 가게</p>
                        <p class="fs-5 text mb-0">별점</p>
							<fieldset class="rate">
								<input type="radio" id="rating10" name="rating" value="10"><label for="rating10"
									title="5점"></label>
								<input type="radio" id="rating9" name="rating" value="9" checked><label class="half"
									for="rating9" title="4.5점"></label>
								<input type="radio" id="rating8" name="rating" value="8"><label for="rating8"
									title="4점"></label>
								<input type="radio" id="rating7" name="rating" value="7"><label class="half" for="rating7"
									title="3.5점"></label>
								<input type="radio" id="rating6" name="rating" value="6"><label for="rating6"
									title="3점"></label>
								<input type="radio" id="rating5" name="rating" value="5"><label class="half" for="rating5"
									title="2.5점"></label>
								<input type="radio" id="rating4" name="rating" value="4"><label for="rating4"
									title="2점"></label>
								<input type="radio" id="rating3" name="rating" value="3"><label class="half" for="rating3"
									title="1.5점"></label>
								<input type="radio" id="rating2" name="rating" value="2"><label for="rating2"
									title="1점"></label>
								<input type="radio" id="rating1" name="rating" value="1"><label class="half" for="rating1"
									title="0.5점"></label>
							</fieldset>
                        <p class="fs-6 text">4.5 / 5.0</p>
                       
                        <p class="fs-5 text">서울시 강동구</p>
                        <p class="fs-5 text">연락가능시간 10시 ~ 21시</p>
                        <p class="fs-5 text">고수상세정보</p>
                        <p class="small mb-1 lh-2 mx-2">안녕하세요. 강동구에서 자전거 정비업체를 운영하고 있습니다. 출장/방문 수리 모두 가능합니다.
                            업계 최고 수준으로 모시겠습니다. 감사합니다.</p>

                        <button type="button" class="btn btn-outline-primary mx-3" style=""
                            id="requestCompletedBtn">의뢰완료</button>
                    </div>
                </div>
            </div>




<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script>


    const scrollToBottom = () => { //채팅창 스크롤 고정 함수
        document.getElementById('chatMonitor').scrollBy({ top: 100 });
    };

    let sendbtn = document.getElementById("sendBtnDiv");
	let messageArea;
    sendbtn.addEventListener("keyup", function (event) { //엔터키 입력시 채팅입력 함수
        if (event.keyCode === 13) {
            event.preventDefault();
            messageArea = document.getElementById("messageArea").value;
            document.getElementById("sendBtn").click();
            messageArea = '';
        }
    });

    let socket = new WebSocket("ws://"+location.host+"/surion/chat");

    socket.onopen = function (e) {
        console.log('open server!')
        scrollToBottom();
    };

    socket.onerror = function (e) {
        console.log(e.type);
    }

    socket.onmessage = function (e) { //websocket으로부터 메세지가 수신되면 실행.
//        console.log(e.data);
    	inputData(e.data);
        let msgArea = document.querySelector('.msgArea');
        let newMsg = document.createElement("span");
        let addDiv = '';
        let testid = "testid";
        console.log(e);
        if (<%=session.getAttribute("id")%> == <%=session.getAttribute("id")%> ) { //model로 받아온 값이랑 비교, 회원가입 이후;
            addDiv += '<div class="d-flex flex-row justify-content-start mb-3">';
            addDiv += '<img src="C:\\Users\\nueti\\image\\user1.png" alt="avatar 1" style="width: 45px; height: 100%;">';
            addDiv += '<div class="p-3 ms-3" style="border-radius: 15px; background-color: rgba(57, 192, 237,.2);">';
            addDiv += '<p class="small mb-0">' + e.data + '</p>';
            addDiv += '</div>';
            addDiv += '</div>';
        } else {
            addDiv += '<div class="d-flex flex-row justify-content-end mb-3">';
            addDiv += ' <div class="p-3 me-3 border" style="border-radius: 15px; background-color: #fbfbfb;">';
            addDiv += ' <p class="small mb-0">' + e.data + '</p>';
            addDiv += '</div>'
            addDiv += '</div>'

        }

        newMsg.innerHTML = addDiv;
        msgArea.append(newMsg);
        scrollToBottom();
    }

    function sendMsg() {
        let content = document.querySelector('.content').value;
        socket.send(content);
    }
    
    //채팅입력시 db저장 함수
    function inputData(data) {
        $.ajax({
            type: 'post',
            url: '${cpath}/insertChat',
            data: {
                "message":data,
                "room_id":1, //만들어야함,
                "member_id":"<%=session.getAttribute("id")%>"
            },
            success: console.log("insertMessageSuccess"),
            error: function (){alert('error')}
        })
    }
</script>

</html>