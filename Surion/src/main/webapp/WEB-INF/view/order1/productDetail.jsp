<%--
  Created by IntelliJ IDEA.
  User: deukkwonpark
  Date: 2023/04/10
  Time: 7:36 PM
  To change this template use File | Settings | File Templates.
--%>
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
    	width:30%;
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
    
</style>

<div class="suriSize st">
    <div class="container-profile">
        <div class="row no-gutters">
            <div class="profile-section">
                <div class="profile-overview">
                    <div class="thumb">
                        <img src="${cpath}/resources/images/order/${profile.img}" alt="" />
                    </div>
                    <div class="row" style="position: relative;">
                        <div class="col-lg-9">
                            <div class="info">
                                <h2> ${profile.shopName} </h2>
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
	                                        <div> 연락 가능한 시간 : </br>${profile.startTime}시&nbsp;~&nbsp;${profile.endTime}시</div>
                                    	</div>
                                    	<div class="right">
	                                    	여기는 지도</br>
	                                    	${profile.office}
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
                                        <div class="d-flex justify-content-start">
                                            <li style="margin-right: 30px;">
                                                <div class="star-container"
                                                     style="position:relative;display:inline-block;vertical-align:middle;padding-left:0;padding-right:0">
                                                    <svg viewBox="0 0 24 24" class="widget-svg"
                                                         style="width:20px;height:20px;transition:transform .2s ease-in-out">
                                                        <path class="star"
                                                              style="fill:#ffd400;transition:fill .2s ease-in-out"
                                                              d="M8.37094152,8.12482574 L2.52598096,8.59636398 L2.36821881,8.6135218 C0.881583763,8.81867772 0.513822851,10.1467426 1.72605142,11.1443161 L6.11068071,14.7526934 L4.80553251,20.0682859 L4.77348322,20.2161997 C4.50052597,21.673724 5.6402616,22.4726949 6.9887771,21.699537 L12.00271,18.8250573 L17.0166429,21.699537 L17.1506515,21.7715841 C18.4829447,22.4403279 19.5680516,21.5674348 19.1998875,20.0682859 L17.8937294,14.7526934 L22.2793686,11.1443161 L22.3984321,11.0405714 C23.4954951,10.0270601 23.0352205,8.72174778 21.479439,8.59636398 L15.6334685,8.12482574 L13.3880977,3.09014615 C12.7393731,1.6361626 11.2656405,1.63707337 10.6173223,3.09014615 L8.37094152,8.12482574 Z"></path>
                                                    </svg>
                                                </div>
                                                <div class="star-container"
                                                     style="position:relative;display:inline-block;vertical-align:middle;padding-left:0;padding-right:0">
                                                    <svg viewBox="0 0 24 24" class="widget-svg"
                                                         style="width:20px;height:20px;transition:transform .2s ease-in-out">
                                                        <path class="star"
                                                              style="fill:#ffd400;transition:fill .2s ease-in-out"
                                                              d="M8.37094152,8.12482574 L2.52598096,8.59636398 L2.36821881,8.6135218 C0.881583763,8.81867772 0.513822851,10.1467426 1.72605142,11.1443161 L6.11068071,14.7526934 L4.80553251,20.0682859 L4.77348322,20.2161997 C4.50052597,21.673724 5.6402616,22.4726949 6.9887771,21.699537 L12.00271,18.8250573 L17.0166429,21.699537 L17.1506515,21.7715841 C18.4829447,22.4403279 19.5680516,21.5674348 19.1998875,20.0682859 L17.8937294,14.7526934 L22.2793686,11.1443161 L22.3984321,11.0405714 C23.4954951,10.0270601 23.0352205,8.72174778 21.479439,8.59636398 L15.6334685,8.12482574 L13.3880977,3.09014615 C12.7393731,1.6361626 11.2656405,1.63707337 10.6173223,3.09014615 L8.37094152,8.12482574 Z"></path>
                                                    </svg>
                                                </div>
                                                <div class="star-container"
                                                     style="position:relative;display:inline-block;vertical-align:middle;padding-left:0;padding-right:0">
                                                    <svg viewBox="0 0 24 24" class="widget-svg"
                                                         style="width:20px;height:20px;transition:transform .2s ease-in-out">
                                                        <path class="star"
                                                              style="fill:#ffd400;transition:fill .2s ease-in-out"
                                                              d="M8.37094152,8.12482574 L2.52598096,8.59636398 L2.36821881,8.6135218 C0.881583763,8.81867772 0.513822851,10.1467426 1.72605142,11.1443161 L6.11068071,14.7526934 L4.80553251,20.0682859 L4.77348322,20.2161997 C4.50052597,21.673724 5.6402616,22.4726949 6.9887771,21.699537 L12.00271,18.8250573 L17.0166429,21.699537 L17.1506515,21.7715841 C18.4829447,22.4403279 19.5680516,21.5674348 19.1998875,20.0682859 L17.8937294,14.7526934 L22.2793686,11.1443161 L22.3984321,11.0405714 C23.4954951,10.0270601 23.0352205,8.72174778 21.479439,8.59636398 L15.6334685,8.12482574 L13.3880977,3.09014615 C12.7393731,1.6361626 11.2656405,1.63707337 10.6173223,3.09014615 L8.37094152,8.12482574 Z"></path>
                                                    </svg>
                                                </div>
                                                <div class="star-container"
                                                     style="position:relative;display:inline-block;vertical-align:middle;padding-left:0;padding-right:0">
                                                    <svg viewBox="0 0 24 24" class="widget-svg"
                                                         style="width:20px;height:20px;transition:transform .2s ease-in-out">
                                                        <path class="star"
                                                              style="fill:#ffd400;transition:fill .2s ease-in-out"
                                                              d="M8.37094152,8.12482574 L2.52598096,8.59636398 L2.36821881,8.6135218 C0.881583763,8.81867772 0.513822851,10.1467426 1.72605142,11.1443161 L6.11068071,14.7526934 L4.80553251,20.0682859 L4.77348322,20.2161997 C4.50052597,21.673724 5.6402616,22.4726949 6.9887771,21.699537 L12.00271,18.8250573 L17.0166429,21.699537 L17.1506515,21.7715841 C18.4829447,22.4403279 19.5680516,21.5674348 19.1998875,20.0682859 L17.8937294,14.7526934 L22.2793686,11.1443161 L22.3984321,11.0405714 C23.4954951,10.0270601 23.0352205,8.72174778 21.479439,8.59636398 L15.6334685,8.12482574 L13.3880977,3.09014615 C12.7393731,1.6361626 11.2656405,1.63707337 10.6173223,3.09014615 L8.37094152,8.12482574 Z"></path>
                                                    </svg>
                                                </div>
                                                <div class="star-container"
                                                     style="position:relative;display:inline-block;vertical-align:middle;padding-left:0;padding-right:0">
                                                    <svg viewBox="0 0 24 24" class="widget-svg"
                                                         style="width:20px;height:20px;transition:transform .2s ease-in-out">
                                                        <path class="star"
                                                              style="fill:#ffd400;transition:fill .2s ease-in-out"
                                                              d="M8.37094152,8.12482574 L2.52598096,8.59636398 L2.36821881,8.6135218 C0.881583763,8.81867772 0.513822851,10.1467426 1.72605142,11.1443161 L6.11068071,14.7526934 L4.80553251,20.0682859 L4.77348322,20.2161997 C4.50052597,21.673724 5.6402616,22.4726949 6.9887771,21.699537 L12.00271,18.8250573 L17.0166429,21.699537 L17.1506515,21.7715841 C18.4829447,22.4403279 19.5680516,21.5674348 19.1998875,20.0682859 L17.8937294,14.7526934 L22.2793686,11.1443161 L22.3984321,11.0405714 C23.4954951,10.0270601 23.0352205,8.72174778 21.479439,8.59636398 L15.6334685,8.12482574 L13.3880977,3.09014615 C12.7393731,1.6361626 11.2656405,1.63707337 10.6173223,3.09014615 L8.37094152,8.12482574 Z"></path>
                                                    </svg>
                                                </div>
                                            </li>
                                            <li style="margin-right: 30px;"> 점수</li>
                                            <li style="margin-right: 30px;"> < 개의 평가</li>
                                        </div>
                                        <div> 실제 수리온 서비스를 받은 고객들의 평가입니다.</div>
                                    </div>
                                    <div class="bottomline">
                                        <h2 class="h2h2">리뷰</h2>
                                        <div class="row">
                                            <div class="col-lg-3">
                                                <div class="card" style="width: 10rem;">
                                                    <img class="card-img-top" src="..." alt="Card image cap">
                                                    <div class="card-body">
                                                        <h5 class="card-title"> 깨끗히 잘합니다. </h5>
                                                        <p class="card-text">후기에요~ 넘나 좋아요</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="card" style="width: 10rem;">
                                                    <img class="card-img-top" src="..." alt="Card image cap">
                                                    <div class="card-body">
                                                        <h5 class="card-title">또 이용하고싶어요</h5>
                                                        <p class="card-text">이사오자마자 다른 곳으로 또 이사갈 뻔</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="card" style="width: 10rem;">
                                                    <img class="card-img-top" src="..." alt="Card image cap">
                                                    <div class="card-body">
                                                        <h5 class="card-title">흘린 거 주워먹어도 될 정도로..</h5>
                                                        <p class="card-text">겁나 맛있었어요 </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="card" style="width: 10rem;">
                                                    <img class="card-img-top" src="..." alt="Card image cap">
                                                    <div class="card-body">
                                                        <h5 class="card-title">사진은 없지만</h5>
                                                        <p class="card-text"> 조금 아쉬웠어요 </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
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
                            <button class="btn btn-sm" id="sBtn">견적받기</button>
                            <button class="btn btn-sm">찜하기</button>
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
	const modal = document.querySelector('.modal');
	const sBtn = document.querySelector('#sBtn');
	
	sBtn.addEventListener('click', () => {
		modal.classList.add('show');
		document.body.style.overflow = 'hidden';
	});
	
	// 제안하기 modal 에서 취소 버튼 누를 시 이벤트
	const cancel_btn = document.querySelector('.cancel-btn');
	cancel_btn.addEventListener('click', () => {
		modal.classList.remove('show');
		document.body.style.overflow = 'auto';
	});
		
	
	
</script>

<%@ include file="../common/footer.jsp" %>
</body>
</html>