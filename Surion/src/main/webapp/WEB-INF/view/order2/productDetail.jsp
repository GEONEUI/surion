<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="en">
<%@ include file="../common/front_header.jsp" %>
<body>
<%@ include file="../common/header.jsp" %>

<style>
    .h2h2 {
        margin: 2px;
        padding-top: 10px;
        padding-bottom: 20px;
    }

    .bottomline {
        padding-bottom: 50px;
        border-bottom: 1px solid #ccc;
    }
    
    .thumb img{
    	width: 400px;
    	height: 300px;
    	margin-right:50px;
    	margin-bottom: 32px;
    	
    }
    .bottomline1{
    	display:flex;
    	padding-bottom: 50px;
        border-bottom: 1px solid #ccc;
    }
    .left{
    	width: 40%;
    }
    .right{
    	width: 60%;
    }
    .btn {
    	background-color: #00c7ae;
    	color: #fff;
    	width: 114px;
    	height: 42px;
    }
    
    /* 제안하기 modal */
	 .modal {
		position: absolute;
		top: 0;
	    left: 0;
		width: 100%;
		height: 100%;
		display: none;
		background-color: rgba(0, 0, 0, 0.4);
	}
		
	.modal.show {
	  	display: block;
	}
	.modal_body {
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    width: 400px;
	    height: 500px;
	    padding: 40px;
	    text-align: center;
	    background-color: rgb(255, 255, 255);
	    border-radius: 10px;
	    box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	    transform: translateX(-50%) translateY(-50%);
	}
	
	.modal_hr {
		height: 3px;
		background: #000;
		margin: 0;
		
	}
	.location {
		display: flex;
		border-bottom: 1.5px solid #e9e8e8;
	}
	
	div.modal.show > form > div:nth-child(4) {
		border-bottom: 2px solid #e9e8e8;
		margin-bottom: 1rem;
	}
	
	.left-font {
 		width: 6rem;
 		background: #00c7ae21;
 		font-weight: 500;
	}
	
	.content-box {
		width: 20rem;
    	height: 19rem;
    	padding: 7px;
    	border-color: #babcbf;
    	resize: none;
    	margin-bottom: 5px;
	}
	
	.bottom-btn {
		display: flex;
		align-items: center;
		justify-content: center;
	}
	
	.submit-btn {
		margin-right: 1rem;
		width: 5rem;
    	height: 2rem;
    	background: #00c7ae;
    	color: #fff;
    	border: none;
    	border-radius: 4px;
	}
	
	.cancel-btn {
		width: 3rem;
    	height: 2rem;
    	background: #00c7ae;
    	color: #fff;
    	border: none;
    	border-radius: 4px;
	}
	
/* 	고정 값 */
	input[type=text] {
		padding-left: 10px;
		border-style: none;
	}
		
	textarea:focus {
		outline: none;
	}
	.thumb_sub {
		display: flex;
	    align-items: center;
	    justify-content: left;
	}
	.office {
		margin-top:10px;
	}
    
</style>

<div class="suriSize st">
    <div class="container-profile">
        <div class="row no-gutters">
            <div class="profile-section">
                <div class="profile-overview">
                    <div class="thumb">
                    	<div class="thumb_sub">
                        	<img src="${cpath}/resources/images/order/${profile.img}" alt="" /><div><div id="map" style="width:400px;height:300px;"></div><div class="office">${profile.office}</div></div>
                    	</div>
                    </div>
                    <div class="row" style="position: relative;">
                        <div class="col-lg-9">
                            <div class="info">
                                <div class="card-body d-flex justify-content-center align-items-center mt-3"  id="test"
                                     style="background: #fafafa;">
                                    <div class="col-lg-3 me-4">
                                        <div class="card border border-0" style="background: #fafafa;">
                                            <div class="card-body">
                                                <div class="card-title" style="text-align: center"> 고용
                                                    <p class="card-text fs-5 fw-bold" style="text-align: center">
                                                        고용횟수 </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 me-4">
                                        <div class="card border border-0" style="background: #fafafa;">
                                            <div class="card-body">
                                                <div class="card-title" style="text-align: center"> 리뷰
                                                    <p class="card-text fs-5 fw-bold" style="text-align: center"> 리뷰
                                                        수 </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="card border border-0" style="background: #fafafa;">
                                            <div class="card-body">
                                                <div class="card-title" style="text-align: center"> 경력
                                                    <p class="card-text fs-5 fw-bold" style="text-align: center"> 업력 ${profile.experience }
                                                        년 </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="container mt-3" style="position: relative;">
                                    <div class="d-flex justify-content-between mt-3 mb-3 align-items-center"
                                         style="position: sticky; width:100%; height: 50px; top:120px;left:0; z-index:9;background: #fff; border-bottom: 1px solid #ccc;">
                                        <div class="boarder border-0  w-100">
                                            <ul class="d-flex">
                                                <li class="me-4"><a class=" " href="#test"
                                                                    style="font-size: 16px;">상점정보</a>&nbsp;&nbsp;&nbsp;
                                                </li>
                                                <li class="me-4"><a class=" " href="#review"
                                                                    style="font-size: 16px;">리뷰</a>&nbsp;&nbsp;&nbsp;
                                                </li>
                                                <li class="me-4"><a class=" " href="#qna"
                                                                    style="font-size: 16px;">질문/답변</a>&nbsp;
                                                </li>

                                            </ul>
                                        </div>
                                    </div>
                                    <div class="bottomline1">
                                    	<div class="left">
	                                    	<h2 class="h2h2 ">상점 정보</h2>
	                                    	<h3 style="margin-top: 10px;"> ${profile.shopName} </h3>
	                                        <div> 연락 가능한 시간 : </br>${profile.startTime}시&nbsp;~&nbsp;${profile.endTime}시</div>
                                    	</div>
                                    	<div class="right">
	                                    </div>
                                    </div>
                                    <div class="bottomline">
                                        <h2 class="h2h2">서비스 상세설명</h2>
                                        <div> ${profile.intro}</div>
                                    </div>
									
                                    <div class="possibleItem bottomline">
                                        <h2 class="h2h2">수리 분야</h2>
                                        <div class="container">
                                            <ul class="d-flex align-items-center">
                                                <li>
												  <figure class="d-flex flex-column">
												    <c:choose>
												      <c:when test="${profile.category == '자전거'}">
												        <i class="fa-duotone fa-bicycle fs-3"></i>
												        <figcaption class="fs-5">자전거</figcaption>
												      </c:when>
												      <c:when test="${profile.category == '오토바이'}">
												        <i class="fa-duotone fa-motorcycle fs-3"></i>
												        <figcaption class="fs-5">오토바이</figcaption>
												      </c:when>
												      <c:when test="${profile.category == '에어컨'}">
												        <i class="fa-duotone fa-wind fs-3"></i>
												        <figcaption class="fs-5">에어컨</figcaption>
												      </c:when>
												      <c:when test="${profile.category == '보일러'}">
												        <i class="fa-duotone fa-temperature-arrow-up fs-3"></i>
												        <figcaption class="fs-5">보일러</figcaption>
												      </c:when>
												      <c:when test="${profile.category == '컴퓨터'}">
												        <i class="fa-light fa-desktop fs-3"></i>
												        <figcaption class="fs-5">컴퓨터</figcaption>
												      </c:when>
												      <c:when test="${profile.category == '음향/악기'}">
												        <i class="fa-duotone fa-headphones-simple fs-3"></i>
												        <figcaption class="fs-5">음향 / 악기</figcaption>
												      </c:when>
												      <c:when test="${profile.category == '해외직구'}">
												        <i class="fa-regular fa-plane-departure fs-3"></i>
												        <figcaption class="fs-5">해외직구</figcaption>
												      </c:when>
												      <c:otherwise>
												        <i class="fa-duotone fa-ellipsis fs-3"></i>
												        <figcaption class="fs-5">기타</figcaption>
												      </c:otherwise>
												    </c:choose>
												  </figure>
												</li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="bottomline" id="review">
                                        <h2 class="h2h2"> 경력</h2>
                                        <div> ${profile.experience}년</div>
                                    </div>
                                    <div class="review bottomline" style="min-height: 50px">
                                        <h2 class="h2h2"> 리뷰 </h2>
                                        <c:forEach items="${reviewList}" var="list">
                                        	<div class="reive_box">
                                        		<div>작성자 : ${list.member.id}</div>
                                        		<div>점수 : ${list.score}</div>
                                        	</div>
                                        </c:forEach>
                                        
                                        
                                        
                                        <div> 실제 수리온 서비스를 받은 고객들의 평가입니다.</div>
                                    </div>
                                    <div class="bottomline"></div>
                                    <div class="bottomline" id="qna" style="padding-bottom: 30px;">
                                        <h2 class="h2h2">자주 묻는 질문 </h2>
                                        <div class="accordion-item" style="margin-bottom: 20px">
                                        	<h2 class="accordion-header" id="headingOne">
										      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
										        data-bs-target="#basicAccordionCollapseOne" aria-expanded="false" aria-controls="collapseOne">
										        <h4>1.수리비용은 어떻게 책정되나요?</h4>
										      </button>
										    </h2>
										    <div id="basicAccordionCollapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne"
										      data-bs-parent="#basicAccordion" style="">
										      <div class="accordion-body">
										        수리비용은 수리할 제품의 상태, 수리 부품의 가격, 수리에 필요한 노동비 등 다양한 요소에 따라 결정됩니다. 수리 비용을 산정하기 위해서는 수리가 필요한 제품을 정확히 점검한 후에 견적서를 작성해야 합니다.
										      </div>
										    </div>
										  </div>
										  <div class="accordion-item" style="margin-bottom: 20px">
										    <h2 class="accordion-header" id="headingTwo">
										      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
										        data-bs-target="#basicAccordionCollapseTwo" aria-expanded="false" aria-controls="collapseTwo">
										        <h4>2.수리 접수 방법은 어떻게 되나요?</h4>
										      </button>
										    </h2>
										    <div id="basicAccordionCollapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo"
										      data-bs-parent="#basicAccordion" style="">
										      <div class="accordion-body">
										        수리 접수 방법은 수리센터마다 다를 수 있습니다. 보통은 전화나 인터넷을 통해 접수를 받고, 제품을 방문 수령하거나 택배로 보내주시면 됩니다. 수리 접수 시 제품명, 고장 상태, 연락처 등 필요한 정보를 정확히 입력해야 합니다.
										      </div>
										    </div>
										  </div>
										  <div class="accordion-item">
										    <h2 class="accordion-header" id="headingThree">
										      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
										        data-bs-target="#basicAccordionCollapseThree" aria-expanded="false" aria-controls="collapseThree">
										        <h4>3.수리 기간은 얼마나 걸리나요?</h4>
										      </button>
										    </h2>
										    <div id="basicAccordionCollapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree"
										      data-bs-parent="#basicAccordion" style="">
										      <div class="accordion-body">
										        수리 기간은 수리 센터의 규모, 수리할 제품의 종류 및 상태, 수리 부품 입고 상황 등 다양한 요소에 따라 달라질 수 있습니다. 보통은 수리 필요 부품의 입고와 수리에 소요되는 시간을 고려하여 3일에서 1주일 정도가 소요됩니다. 다만, 복잡한 수리가 필요한 경우에는 더 오랜 시간이 소요될 수 있습니다.
										      </div>
										    </div>
										  </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="col-lg-3" style="position: sticky; height:10vh; top:140px; right:0;">
                            <strong>${profile.shopName }</strong>에게 원하는 견적을 받아보세요</br>
                            <div style="margin-top: 20px;">
	                            <button class="btn btn-sm" id="sBtn">요청하기</button>
	                            <button class="btn btn-sm">찜하기</button>
                   			</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


</div>
<div class="modal">
	<form class="modal_body">
		<hr class="modal_hr">
		<div class="location">
			<div class="left-font">위치</div>
			<input type="text" class="inText" maxlength="22" placeholder="서울시 강동구.....">
		</div>
		<div class="location">
			<div class="left-font">연락처</div>
			<input type="text" class="inText" maxlength="22" placeholder="010-0000-0000.....">
		</div>
		<div class="location">
			<div class="left-font">연락가능시간</div>
			<input type="text" class="inText" maxlength="22" placeholder="00~00시.....">
		</div>
		<div>
			<textarea class="content-box" placeholder="내용을 입력해 주세요." maxlength="400"></textarea>
		</div>
		<div class="bottom-btn">
			<button type="submit" class="submit-btn">견적받기</button>
			<button type="reset" class="cancel-btn">취소</button>
		</div>
	</form>
</div>

<script>	
	
	// 제안하기 버튼 클릭 시 modal 등장
	const sBtn = document.querySelectorAll('.btn-sm');
	
	
	sBtn.forEach((idx, obj)=>{
		idx.addEventListener('click', function(){
			alert('업데이트 진행 예정입니다.');
		});
	})
	
	
	
	// 제안하기 modal 에서 취소 버튼 누를 시 이벤트
	const cancel_btn = document.querySelector('.cancel-btn');
	cancel_btn.addEventListener('click', () => {
		modal.classList.remove('show');
		document.body.style.overflow = 'auto';
	});
		
	
	
</script>

<%@ include file="../common/footer.jsp" %>


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
    
    
    function goMap(){
    	var addr = "${profile.office}";
        geocoder.addressSearch(addr, function(results, status) {
            // 정상적으로 검색이 완료됐으면
            if (status === daum.maps.services.Status.OK) {
            	
            	

                var result = results[0]; //첫번째 결과의 값을 활용

                // 해당 주소에 대한 좌표를 받아서
                var coords = new daum.maps.LatLng(result.y, result.x);
                // 지도를 보여준다.
                mapContainer.style.display = "block";
                map.relayout();
                // 지도 중심을 변경한다.
                map.setCenter(coords);
                // 마커를 결과값으로 받은 위치로 옮긴다.
                marker.setPosition(coords)
            }
        });
    }
    
    goMap();
</script>

</body>
</html>