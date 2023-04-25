<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
  <head>
    <title>Websocket Chat</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <!-- CSS -->
    <link rel="stylesheet" href="/webjars/bootstrap/4.3.1/dist/css/bootstrap.min.css">
  
  </head>
  <body>
    <div class="container" id="app" >
        <div class="row">
            <div class="col-md-12">
                <h3>채팅방 리스트</h3>
            </div>
        </div>
        <div class="input-group">
            <div class="input-group-prepend">
                <label class="input-group-text">방제목</label>
            </div>
            <input type="text" class="form-control" id="roomName">
            <div class="input-group-append">
                <button class="btn btn-primary" type="button" onclick="fff();">채팅방 개설</button>
            </div>
        </div>
        <ul class="list-group" id="target">
            
        </ul>
    </div>
    <!-- JavaScript -->
  <script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
    <script>
       
      
    $(document).ready(function(){
    	findAllRoom();  		
        });
    
    
    				  let roomName = $('#roomName');
    	              let chatrooms = []
    		
             
          
 
         
  
            	
            	//방찾기
               function findAllRoom() {
    	            	  var viewHtml = null;
    	            	  $.ajax({
    	            		  url:"/surion/chat/rooms",
    	            		  type:"get",
    	            		  error:function(){
    	            			  alert("채팅목록 불러오기 실패")
    	            		  },
    	            		  success:function(res){
									$.each(res, function(idx, obj){
										console.log(res);
										viewHtml += '<li class="list-group-item list-group-item-action" onclick="enterRoom('+"'"+obj.room_id+"'"+')">'+obj.member_id+'</li>'; 
									});    	            			  
		    	            			target.innerHTML = viewHtml;
    	            			  
    	            		  },
    	            		  });
                }
                
                //방만들기
                function fff() {
                	 if("" == roomName.val()) {
                        alert("방 제목을 입력해 주십시요.");
                        return;
                    } else {
                        var params = new URLSearchParams();
                        params.append("name",roomName.val());
                        //alert(params);
                        
                       $.ajax({
                    	   url:"/surion/chat/room?"+params,
                    	   type:"post",
                    	   error: function(){ alert('채팅방 개설 실패')},
                    	   success: function(res){
                    		  console.log(res);
                    		  findAllRoom();
                    	   },
                       });

                    } 
                }
                
             function enterRoom(roomId) {
                    var member_id = prompt('대화명을 입력해 주세요.');
                    if(member_id != "") {
                        localStorage.setItem('wschat.member_id', member_id);
                        localStorage.setItem('wschat.room_id',roomId);
                        location.href="/surion/chat/room/enter/"+roomId;
                    }
                }
           
    </script>
  </body>
</html>