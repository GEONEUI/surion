<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<%@ include file="./common/front_header.jsp"%>
<style>
    .rdg-image {
        image-rendering: -moz-crisp-edges;
        /* Firefox */
        image-rendering: -o-crisp-edges;
        /* Opera */
        image-rendering: -webkit-optimize-contrast;
        /* Webkit 표준 X */
        image-rendering: crisp-edges;
        -ms-interpolation-mode: nearest-neighbor;
        /* IE 표준 X */
    }

    /* uvisual */
    .uvisual img {
        width: 100%;
    }

    .cursor {
        cursor: pointer;
    }

    figure {
        cursor: pointer;
    }

    .content {
        overflow: hidden;
        white-space: nowrap;
        text-overflow: ellipsis;
    }

    i {
        color: #888;
        margin-bottom: 10px;
    }

    .w22 {
        width: 22%;
    }

    .w22 img {
        width: 100%;
        border-radius: 12px;
    }
</style>

<body>
    <%@ include file="./common/header.jsp"%>
    <div class="usec_visual">
        <div class="uvisual">
            <img class="rdg-image" src="${cpath}/resources/images/visual8.png">
        </div>
    </div>
    <div class="suriSize st">
        <div class="container">
            <ul class="d-flex justify-content-around align-items-center">
                <li onclick="location.href='${cpath}/repair/repairList?type=1'">
                    <figure class="d-flex justify-content-center align-items-center flex-column">
                        <i class="fa-duotone fa-bicycle fs-3"></i>
                        <figcaption class="fs-5">자전거</figcaption>
                    </figure>
                </li>
                <li onclick="location.href='${cpath}/repair/repairList?type=2'">
                    <figure class="d-flex justify-content-center align-items-center flex-column">
                        <i class="fa-duotone fa-motorcycle fs-3"></i>
                        <figcaption class="fs-5">오토바이</figcaption>
                    </figure>
                </li>
                <li onclick="location.href='${cpath}/repair/repairList?type=3'">
                    <figure class="d-flex justify-content-center align-items-center flex-column">
                        <i class="fa-duotone fa-wind fs-3"></i>
                        <figcaption class="fs-5">에어컨</figcaption>
                    </figure>
                </li>
                <li onclick="location.href='${cpath}/repair/repairList?type=4'">
                    <figure class="d-flex justify-content-center align-items-center flex-column">
                        <i class="fa-duotone fa-temperature-arrow-up fs-3"></i>
                        <figcaption class="fs-5">보일러</figcaption>
                    </figure>
                </li>
                <li onclick="location.href='${cpath}/repair/repairList?type=5'">
                    <figure class="d-flex justify-content-center align-items-center flex-column">
                        <i class="fa-light fa-desktop fs-3"></i>
                        <figcaption class="fs-5">컴퓨터</figcaption>
                    </figure>
                </li>
                <li onclick="location.href='${cpath}/repair/repairList?type=6'">
                    <figure class="d-flex justify-content-center align-items-center flex-column">
                        <i class="fa-duotone fa-headphones-simple fs-3"></i>
                        <figcaption class="fs-5">음향 / 악기</figcaption>
                    </figure>
                </li>
            </ul>
        </div>
    </div>



    <div class="suriSize st">
        <div class="container">
            <div class="d-flex justify-content-between">
                <h2 class="fs-2 mb-4">인기있는 수리목록</h2>
                <a href="${cpath}/repair/repairList" style="color: #00c7ae;">전체보기
                    <i style="color: #00c7ae;" class="fa-solid fa-caret-right"></i>
                </a>
            </div>
        </div>
        <ul class="d-flex justify-content-between">
            <c:forEach items="${popularList}" begin="0" end="3" var="popularList">
                <li class="w22" onclick="location.href='${cpath}${popularList.url}'">
                    <figure>
                        <img src="${cpath}/resources/mainImage/${popularList.categoryImg}" alt="오토바이 이미지">
                        <figcaption class="fs-5 py-2">${popularList.category}</figcaption>
                        <p class="text-secondary">
                            <i class="me-1 fa-sharp fa-solid fa-envelope"></i>
                            <fmt:formatNumber pattern="#,###" value="${popularList.count}" />
                            요청
                        </p>
                    </figure>
                </li>
            </c:forEach>
        </ul>
    </div>

    <div class="suriSize st">
        <div class="container">
            <div class="d-flex justify-content-between">
                <h2 class="fs-2 mb-4">수리온 커뮤니티에 물어보세요</h2>
                <a href="${cpath}/community/board" style="color: #00c7ae;">전체보기
                    <i style="color: #00c7ae;" class="fa-solid fa-caret-right"></i>
                </a>
            </div>
            <div class="row d-flex">
                <div class="col-lg-6 pe-4">
                    <c:forEach items="${communityList}" begin="0" end="2" var="list">
                        <div class="cursor" onclick="location.href='${cpath}/community/detail?idx=${list.idx}'">
                            <small class="d-block text-secondary">${list.comm_list}</small> <span class="d-block fw-bold content">${list.content}</span> <span class="text-secondary d-block pb-4 mb-4 fw-normal" style="border-bottom: 1px solid #ecebeb;">${fn:split(list.indate, " ")[0]}</span>
                        </div>
                    </c:forEach>
                </div>
                <div class="col-lg-6 ps-5 d-flex justify-content-between flex-column">
                    <c:forEach items="${communityList}" begin="3" end="5" var="list">
                        <div class="cursor" onclick="location.href='${cpath}/community/detail?idx=${list.idx}'">
                            <small class="d-block text-secondary">${list.comm_list}</small> <span class="d-block fw-bold content">${list.content}</span> <span class="text-secondary d-block pb-4 mb-4 fw-normal" style="border-bottom: 1px solid #ecebeb;">${fn:split(list.indate, " ")[0]}</span>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid st px-5 py-5" style="background: #d4f1ed;">
        <div class="container">
            <h2 class="text-center pb-3 fs-2">수리온이 선택한 유용한 동영상!</h2>
            <p class="text-center pb-3">어디서든 필요한 지식</p>
            <div class="row">
                <div class="col-lg-4">
                    <iframe width="100%" height="240" src="https://www.youtube.com/embed/RMdz_zIjUso" title="[모두의학교 x 서울시설공단] 일상기술자 프로젝트🛠 집수리편 🏡" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                </div>
                <div class="col-lg-4">
                    <iframe width="100%" height="240" src="https://www.youtube.com/embed/Nunfq4M6cjQ" title="생활안전예방서비스 개념 소개(2차년도)" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                </div>
                <div class="col-lg-4">
                    <iframe width="100%" height="240" src="https://www.youtube.com/embed/_nTR39J-slE" title="[exTV가 살려드림] 고속도로에서 사고가 났다고?!? 그럼 어떻게 해??" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                </div>
            </div>
        </div>
    </div>




    <button id="mbtn" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal" style="display: none;">Open modal</button>








    <c:if test="${!empty msg}">
        <!-- 모든 요청모달 여기로 해주세요. -->
        <!-- The Modal -->
        <div class="modal" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <c:if test="${msgTitle == 'Error Message!'}">
                        <div class="modal-header bg-danger" style="background: #00c7ae;">
                            <h4 class="modal-title text-white">${msgTitle}</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>
                    </c:if>
                    <c:if test="${msgTitle != 'Error Message!'}">
                        <div class="modal-header" style="background: #00c7ae;">
                            <h4 class="modal-title text-white">${msgTitle}</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>
                    </c:if>
                    <!-- Modal body -->
                    <div class="modal-body">${msg}</div>
                </div>
            </div>
        </div>



        <script>
            $(function() {
                $('#mbtn').trigger('click');
            });
        </script>
    </c:if>


    <!-- 리뷰작성 테스트 -->

	<script>
		
		$('#review').show();
	</script>





    <%@ include file="./common/footer.jsp"%>
</body>

</html>