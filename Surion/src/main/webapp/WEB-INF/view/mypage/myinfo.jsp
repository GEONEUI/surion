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
				frm.find('#address').html(''
						+'<div class="addressLine">'
						+'<input class="left" type="text" id="sample5_address" placeholder="주소" name="address" value="${member.address}">'
						+'<input class="right" type="button" onclick="sample5_execDaumPostcode()" value="주소 검색">'
						+'</div>'
						+'<small>* 변경하실 주소를 선택해주세요.</small>'
				);
				frm.find('#name').html('<small>* 변경하실 이름을 입력해주세요.</small>');
				frm.find('#phone').html('<small>* 변경된 휴대폰 번호를 입력해주세요.</small>');
				$('#target').html('<button data-oper="update" class="btn btn-sm" style="background:#00c7ae; color:#fff;">변경완료</button>');
			}
		});
	});
	
</script>

<style>


	.addressLine{
		display:flex;
	}
	
	.addressLine > input{
		border:1px solid #ccc;
	}
	
	.addressLine .left{
		width:80%;
	}
	
	.addressLine .right{
		width:20%;
		background: #00c7ae;
  	 	color: #fff;
  	 	padding-left:0;
	}
	
	
	
	

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
<div id="map" style="width:300px;height:300px;margin-top:10px;display:none;"></div>
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
							<div class="formgroup" id="address">
								<p>주소</p>
								<input type="text" name="address" value="${member.address}" readonly="readonly">
								<span id="addess"></span>
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=555d7f6279f62f81ef88a8b268b9cfc0&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
            	var addr = data.address; // 최종 주소 변수 // 최종 주소 변수
                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                console.log(addr);
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {
                    	

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "none";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>
				
				