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
</style>

<div class="suriSize st">
    <div class="container-profile">
        <div class="row no-gutters">
            <div class="profile-section">
                <div class="profile-overview">
                    <div class="thumb">
                        로고
                    </div>
                    <div class="row" style="position: relative;">
                        <div class="col-lg-9">
                            <div class="info">
                                <h2> 제목 (3600명이 선택한 청소업체) </h2>
                                <button type="button" class="btn share-button btn-none">쉐어버튼</button>
                                <div class="row">
                                    <div class="col-lg-2">
                                        {mechanic} 업종(수리가능분야)
                                    </div>
                                    <div class="col-lg-2">
                                        지역 (안산)
                                    </div>
                                    <div class="col-lg-2">
                                        (비움) 임시칸
                                    </div>
                                </div>
                                <div class="card-body d-flex justify-content-center align-items-center mt-3"
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
                                                    <p class="card-text fs-5 fw-bold" style="text-align: center"> 업력 xx
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
                                                <li class="me-4"><a class=" " href="#test" style="font-size: 16px;">상점
                                                    정보</a></li>&nbsp;&nbsp;
                                                <li class="me-4"><a class=" " href="#review"
                                                                    style="font-size: 16px;">리뷰</a>&nbsp;&nbsp;&nbsp;
                                                </li>
                                                <li class="me-4"><a class=" " href="#pic" style="font-size: 16px;">사진/동영상</a>&nbsp;&nbsp;
                                                </li>
                                                <li class="me-4"><a class=" " href="#qna"
                                                                    style="font-size: 16px;">질문/답변</a>&nbsp;
                                                </li>

                                            </ul>
                                        </div>
                                    </div>
                                    <div class="bottomline" id="test">
                                        <h2 class="h2h2 ">상점 정보</h2>
                                        <div> 연락가능시간</div>
                                    </div>
                                    <div class="bottomline">
                                        <h2 class="h2h2">서비스 상세설명</h2>
                                        <div> 상세설명 시작</div>
                                    </div>

                                    <div class="possibleItem bottomline">
                                        <h2 class="h2h2">수리 분야(값에 따른 이미지 뿌리기) </h2>
                                        <div class="container">
                                            <ul class="d-flex justify-content-around align-items-center">
                                                <li>
                                                    <figure class="d-flex justify-content-center align-items-center flex-column">
                                                        <i class="fa-duotone fa-bicycle fs-3"></i>
                                                        <figcaption class="fs-5">
                                                            자전거
                                                        </figcaption>
                                                    </figure>
                                                </li>
                                                <li>
                                                    <figure class="d-flex justify-content-center align-items-center flex-column">
                                                        <i class="fa-duotone fa-motorcycle fs-3"></i>
                                                        <figcaption class="fs-5">
                                                            오토바이
                                                        </figcaption>
                                                    </figure>
                                                </li>
                                                <li>
                                                    <figure class="d-flex justify-content-center align-items-center flex-column">
                                                        <i class="fa-duotone fa-wind fs-3"></i>
                                                        <figcaption class="fs-5">
                                                            에어컨
                                                        </figcaption>
                                                    </figure>
                                                </li>
                                                <li>
                                                    <figure class="d-flex justify-content-center align-items-center flex-column">
                                                        <i class="fa-duotone fa-temperature-arrow-up fs-3"></i>
                                                        <figcaption class="fs-5">
                                                            보일러
                                                        </figcaption>
                                                    </figure>
                                                </li>
                                                <li>
                                                    <figure class="d-flex justify-content-center align-items-center flex-column">
                                                        <i class="fa-light fa-desktop fs-3"></i>
                                                        <figcaption class="fs-5">
                                                            컴퓨터
                                                        </figcaption>
                                                    </figure>
                                                </li>
                                                <li>
                                                    <figure class="d-flex justify-content-center align-items-center flex-column">
                                                        <i class="fa-duotone fa-headphones-simple fs-3"></i>
                                                        <figcaption class="fs-5">
                                                            음향 / 악기
                                                        </figcaption>
                                                    </figure>
                                                </li>
                                                <li>
                                                    <figure class="d-flex justify-content-center align-items-center flex-column">
                                                        <i class="fa-regular fa-plane-departure fs-3"></i>
                                                        <figcaption class="fs-5">
                                                            해외직구
                                                        </figcaption>
                                                    </figure>
                                                </li>
                                                <li>
                                                    <figure class="d-flex justify-content-center align-items-center flex-column">
                                                        <i class="fa-duotone fa-ellipsis fs-3"></i>
                                                        <figcaption class="fs-5">
                                                            기타
                                                        </figcaption>
                                                    </figure>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>

                                    <div class="bottomline">
                                        <h2 class="h2h2"> 경력</h2>
                                        <div> 경력설명 시작</div>
                                    </div>
                                    <div class="reviewScore bottomline">
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
                                    <div class="review bottomline" id="review" style="min-height: 50px">
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

                                    <div class="bottomline">
                                        <h2 class="h2h2">포트폴리오</h2>
                                        <div> 포트폴리오 시작</div>
                                    </div>
                                    <div class="bottomline" id="photo">
                                        <h2 class="h2h2">사진 동영상 </h2>
                                        <div>
                                            <ul class="d-flex">
                                                <li clss="col-lg-3"><img src="..." class="img-thumbnail" alt="...">
                                                </li>
                                                <li clss="col-lg-3"><img src="..." class="img-thumbnail" alt="...">
                                                </li>
                                                <li clss="col-lg-3"><img src="..." class="img-thumbnail" alt="...">
                                                </li>
                                                <li clss="col-lg-3"><img src="..." class="img-thumbnail" alt="...">
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="bottomline">
                                        <h2 class="h2h2">고수의 노하우</h2>
                                        <div class="row">
                                            <div class="col-lg-3">
                                                <div class="card" style="width: 10rem;">
                                                    <img class="card-img-top" src="..." alt="Card image cap">
                                                    <div class="card-body">
                                                        <h5 class="card-title">청소의 핵심은...</h5>
                                                        <p class="card-text">겁나 깨끗하게 박박 닦기</p>
                                                        <a href="#" class="btn btn-primary">자세히 알아보기</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="card" style="width: 10rem;">
                                                    <img class="card-img-top" src="..." alt="Card image cap">
                                                    <div class="card-body">
                                                        <h5 class="card-title">청소의 핵심은...</h5>
                                                        <p class="card-text">겁나 깨끗하게 박박 닦기</p>
                                                        <a href="#" class="btn btn-primary">자세히 알아보기</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="card" style="width: 10rem;">
                                                    <img class="card-img-top" src="..." alt="Card image cap">
                                                    <div class="card-body">
                                                        <h5 class="card-title">청소의 핵심은...</h5>
                                                        <p class="card-text">겁나 깨끗하게 박박 닦기</p>
                                                        <a href="#" class="btn btn-primary">자세히 알아보기</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="card" style="width: 10rem;">
                                                    <img class="card-img-top" src="..." alt="Card image cap">
                                                    <div class="card-body">
                                                        <h5 class="card-title">청소의 핵심은...</h5>
                                                        <p class="card-text">겁나 깨끗하게 박박 닦기</p>
                                                        <a href="#" class="btn btn-primary">자세히 알아보기</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="bottomline" id="qna">
                                        <h2 class="h2h2">자주 묻는 질문 </h2>
                                        <div>qna 시작</div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="col-lg-3" style="position: sticky; height:10vh; top:140px; right:0;">
                            < % = 기업이름 > 에게 원하는 견적을 받아보세요
                            <button class="btn btn-primary btn-sm">견적받기</button>
                            <button class="btn btn-primary btn-sm">찜하기</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>